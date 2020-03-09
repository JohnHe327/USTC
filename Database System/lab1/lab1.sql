create database lab1;
use lab1;

create table `book`(
    `id` char(8) not null,
    `name` varchar(10) not null,
    `author` varchar(10),
    `price` float,
    `status` int default 0,
    PRIMARY KEY(id)
    );

create table `reader`(
    `id` char(10),
    `name` varchar(10),
    `age` int,
    `address` varchar(20),
    primary key(id)
    );

create table `borrow`(
    `book_id` char(8),
    `reader_id` varchar(10),
    `borrow_date` date,
    `return_date` date,
    primary key(book_id, reader_id, borrow_date),
    constraint FK_book foreign key(book_id) references book(id) on delete cascade,
    constraint FK_reader foreign key(reader_id) references reader(id) on delete cascade,
    constraint CK_BDnRD check (return_date is null or borrow_date < return_date),
    constraint CK_BDnCD check (borrow_date < curdate()),
    constraint CK_RDnCD check (return_date is null or return_date < curdate())
-- fixme book-borrow date overlap
-- fixme current date
);

-- 实体完整性
insert into borrow (book_id, reader_id, return_date) values ('bid0', 'rid2', '2020-3-8');

-- 参照完整性
insert into borrow values ('bid9999', 'rid0', '2020-3-7', '2020-3-8');

-- 用户定义完整性
insert into borrow values ('bid0', 'rid0', '2099-1-1', '1001-1-1');

-- init
insert into book values ('bid0', 'bname0', 'ath0', 1, 0);
insert into book values ('bid1', 'u1', 'ullman', 1.1, 0);
insert into book values ('bid2', 'bname2', 'ath2', 1.2, 0);
insert into book values ('bid3', 'bname3', 'ath3', 1.3, 0);
insert into book values ('bid4', 'bname4', 'ath4', 1.4, 0);
insert into book (id, name) values('bid5', 'bname');
insert into book values ('bid6', 'u2', 'ullman', 1.7, 0);
insert into book values ('bid7', 'mysql', 'ath5', 3, 0);
insert into book values ('bid8', 'MYSQL', 'ath6', 3, 0);
insert into book values ('bid9', 'MySQL', 'ath7', 3, 0);

insert into reader values ('rid0', 'hcw', 19, 'AH-HF');
insert into reader values ('rid1', 'lilin', 11, 'AA');
insert into reader values ('rid2', 'bbb', 22, 'BB');
insert into reader values ('rid3', 'ccc', 33, 'CC');
insert into reader (id, name, address) values ('rid4', 'ddd', 'DD');

-- hcw
insert into borrow values ('bid0', 'rid0', '2019-1-1', '2019-1-2');
insert into borrow values ('bid1', 'rid0', '2010-1-3', '2019-1-4');
insert into borrow (book_id, reader_id, borrow_date) values ('bid0', 'rid0', '2020-1-5');

insert into borrow values ('bid2', 'rid2', '2020-1-1', '2020-1-2');

-- lilin
insert into borrow values ('bid3', 'rid1', '2019-1-1', '2019-1-2');
insert into borrow values ('bid4', 'rid1', '2020-1-1', '2020-1-2');
insert into borrow (book_id, reader_id, borrow_date) values ('bid5', 'rid1', '2020-1-1');

insert into borrow values ('bid3', 'rid3', '2019-1-11', '2019-2-1');
insert into borrow values ('bid7', 'rid3', '2020-1-1', '2020-2-1');
insert into borrow values ('bid8', 'rid3', '2020-1-1', '2020-2-1');
insert into borrow values ('bid9', 'rid3', '2020-1-1', '2020-2-1');

-- insert into borrow values ('bid', 'rid', '--', '--');
-- insert into borrow (book_id, reader_id, borrow_date) values ('bid', 'rid', '--');

-- 1
select id, address
from reader
where name = 'hcw';

-- 2
select book.name, borrow.borrow_date, borrow.return_date
from reader, borrow, book
where reader.name = 'hcw'
    and reader.id = borrow.reader_id
    and borrow.book_id = book.id;

-- 3
select reader.name
from reader
where name not in ( select reader.name
                    from reader, borrow
                    where reader.id = borrow.reader_id
                        and borrow.return_date is null);

-- 4
select name, price
from book
where author = 'ullman';

-- 5
select book.id, book.name
from reader, borrow, book
where reader.name = 'lilin'
    and reader.id = borrow.reader_id
    and borrow.return_date is null
    and borrow.book_id = book.id;

-- 6
select reader.name
from reader
where reader.id in (select reader_id
                    from borrow
                    group by reader_id
                    having count(book_id) > 3);

-- 7
select reader.name, reader.id
from reader
where reader.id not in (select distinct reader_id
                        from borrow
                        where book_id in (
                                select book_id
                                from reader, borrow
                                where reader.name = 'lilin'
                                    and reader.id = borrow.reader_id
                            )
);

-- 8
select name, id
from book
where lower(name) like '%mysql%';

-- 9
create view `record` (`reader_id`, `reader_name`, `book_id`, `book_name`, `borrow_date`, `return_date`)
as select reader.id, reader.name, book.id, book.name, borrow_date, return_date
from reader, book, borrow
where reader.id = reader_id
    and book_id = book.id;

select count(reader_id)
from record
where borrow_date >= date_sub(curdate(), interval 1 year);

-- fixme current date
