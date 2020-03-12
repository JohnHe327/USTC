create database lab1;
use lab1;

create table `book`(
    `id` char(8) not null,
    `name` varchar(10) not null,
    `author` varchar(10),
    `price` float,
    `status` int default 0,
    constraint `PK_ID` PRIMARY KEY(`id`),
    constraint `CK_PRICE` check (`price` >= 0),
    constraint `CK_STATUS` check (`status` in (0, 1))
);

create table `reader`(
    `id` char(10),
    `name` varchar(10),
    `age` int,
    `address` varchar(20),
    constraint `PK_ID` primary key(`id`),
    constraint `CK_AGE` check (age >= 0)
);

create table `borrow`(
    `book_id` char(8),
    `reader_id` varchar(10),
    `borrow_date` date,
    `return_date` date,
    constraint `PK_BORROW` primary key(`book_id`, `reader_id`, `borrow_date`),
    constraint `FK_BOOK` foreign key(`book_id`) references `book`(`id`) on delete cascade,
    constraint `FK_READER` foreign key(`reader_id`) references `reader`(`id`) on delete cascade,
    constraint `CK_BDnRD` check (`return_date` is null or `borrow_date` < `return_date`)
);

-- 实体完整性
insert into borrow (book_id, reader_id, return_date) values ('bid0', 'rid2', '2020-3-8');

-- 参照完整性
insert into borrow values ('bid9999', 'PB17000075', '2020-3-7', '2020-3-8');

-- 用户定义完整性
insert into book values ('bid0', 'bname0', 'ath0', 1, 2);
insert into borrow values ('bid0', 'PB17000075', '2099-1-1', '1001-1-1');

-- init
-- book
insert into book values ('bid0', 'bname0', 'ath0', 1, 0);
insert into book values ('bid1', 'u1', 'Ullman', 1.1, 0);
insert into book values ('bid2', 'bname2', 'ath2', 1.2, 0);
insert into book values ('bid3', 'bname3', 'ath3', 1.3, 0);
insert into book values ('bid4', 'bname4', 'ath4', 1.4, 0);
insert into book (id, name) values('bid5', 'bname');
insert into book values ('bid6', 'u2', 'Ullman', 1.7, 0);
insert into book values ('bid7', 'mysql', 'ath5', 3, 0);
insert into book values ('bid8', 'MYSQL', 'ath6', 3, 0);
insert into book values ('bid9', 'MySQL', 'ath7', 3, 0);

-- reader
insert into reader values ('PB17000075', 'hcw', 19, 'AH-HF');
insert into reader values ('rid1', 'lilin', 11, 'AA');
insert into reader values ('rid2', 'bbb', 22, 'BB');
insert into reader values ('rid3', 'ccc', 33, 'CC');
insert into reader (id, name, address) values ('rid4', 'ddd', 'DD');

-- borrow
insert into borrow values ('bid2', 'rid2', '2020-1-1', '2020-1-2');
insert into borrow values ('bid3', 'rid3', '2019-1-11', '2019-2-1');
insert into borrow values ('bid7', 'rid3', '2020-1-1', '2020-2-1');
insert into borrow values ('bid8', 'rid3', '2020-1-1', '2020-2-1');
insert into borrow values ('bid9', 'rid3', '2020-1-1', '2020-2-1');
-- hcw
insert into borrow values ('bid0', 'PB17000075', '2019-1-1', '2019-1-2');
insert into borrow values ('bid1', 'PB17000075', '2010-1-3', '2019-1-4');
insert into borrow (book_id, reader_id, borrow_date) values ('bid0', 'PB17000075', '2020-1-5');
-- lilin
insert into borrow values ('bid3', 'rid1', '2019-1-1', '2019-1-2');
insert into borrow values ('bid4', 'rid1', '2020-1-1', '2020-1-2');
insert into borrow (book_id, reader_id, borrow_date) values ('bid5', 'rid1', '2020-1-1');

-- 1 检索读者"hcw"的读者号和地址
select id, address
from reader
where name = 'hcw';

-- 2 检索读者"hcw"所借阅读书（包括已还和未还图书）的图书名和借期
select book.name, borrow.borrow_date, borrow.return_date
from reader, borrow, book
where reader.name = 'hcw'
    and reader.id = borrow.reader_id
    and borrow.book_id = book.id;

-- 3 检索未借阅图书的读者姓名（当前）
select reader.name
from reader
where name not in ( select reader.name
                    from reader, borrow
                    where reader.id = borrow.reader_id
                        and borrow.return_date is null);

-- 4 检索"Ullman"所写的书的书名和单价
select name, price
from book
where author = 'Ullman';

-- 5 检索读者"lilin"借阅未还的图书的图书号和书名
select book.id, book.name
from reader, borrow, book
where reader.name = 'lilin'
    and reader.id = borrow.reader_id
    and borrow.return_date is null
    and borrow.book_id = book.id;

-- 6 检索借阅图书数目超过3本的读者姓名（建馆以来）
select reader.name
from reader
where reader.id in (select reader_id
                    from borrow
                    group by reader_id
                    having count(book_id) > 3);

-- 7 检索没有借阅读者"lilin"所借的任何一本书的读者姓名和读者号（建馆以来）
select reader.name, reader.id
from reader
where reader.id not in (select distinct reader_id
                        from borrow
                        where book_id in (  select book_id
                                            from reader, borrow
                                            where reader.name = 'lilin'
                                                and reader.id = borrow.reader_id));

-- 8 检索书名中包含"MySQL"的图书书名及图书号（不区分大小写）
select name, id
from book
where lower(name) like '%mysql%';

-- 9.1 创建一个读者借书信息的视图，该视图包含读者号、姓名、所借图书号、图书名和借期
create view `record` (`reader_id`, `reader_name`, `book_id`, `book_name`, `borrow_date`, `return_date`)
as select reader.id, reader.name, book.id, book.name, borrow_date, return_date
from reader, book, borrow
where reader.id = reader_id
    and book_id = book.id;
-- 9.2 并使用该视图查询最近一年所有读者的读者号以及所借阅的不同图书数（重复借阅仍计入次数）
select count(reader_id)
from record
where borrow_date >= date_sub(curdate(), interval 1 year);
