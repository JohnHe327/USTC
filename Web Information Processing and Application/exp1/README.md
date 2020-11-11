# enron-search-engine

## TODO

- 在 `src/build_invindex` 里优化代码，从文本预处理到建立倒排索引只 split 一次
- ppt chap.7 page 7 写进实验报告

## BUG-FIX

- `src/build_invindex`: 去邮件头出现了遗漏的情况，在收件人很多的时候，邮件里会分行，但是只有第一行的头部有"To "，后面就识别不出来了，参考 `arora-h/all_documents/10_` 这个邮件。同时注意一下别的地方有没有类似情况

## SETUP
```bash
sudo pip3 install nltk
# path nltk_data
```
