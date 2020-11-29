# enron-search-engine

## TODO
- ppt chap.7 page 7 写进实验报告

## 运行环境：
- Windows 10
- python 3.7

## 运行方式：
```bash
pip install nltk
pip install numpy
pip install sqlite3
python
>>> import nltk
>>> nltk.download('stopwords')
>>> exit()
# 构建倒排表、tf-idf 矩阵（已生成output文件时可忽略）
python ./src/build_index_and_matrix.py
# 使用 bool 检索
python ./src/bool_search.py
# 使用语义检索
python ./src/semantic_search.py
```

## 关键函数：
`build_index_and_matrix():`主要函数，遍历所有文件并调用其他函数以构建倒排表和 tf-idf 矩阵。

`pre_process_enron(file):`对邮件文档进行预处理，去除邮件头中发件人等信息。

`strip_punct(file):`去除邮件中的标点符号及数字。

`stem_words(file, stem_mode=1):`对邮件进行分词和词根化处理，返回单词列表。函数实现了3种不同的词根化方法，经测试`stem_mode = 1`能较好地平衡词根化效果与时间开销，需要更准确的词根化处理或更短的构建时间时可换用其他方法。

`exclude_stop_words(file):`去除停用词，包含英文通用停用词和针对本数据集选定的一些停用词。

## 额外文件说明：
`src/utils.py`：可输入文档ID，返回对应文档路径，便于对输出进行人工比对。

`src/build_index_and_matrix.py`：构建倒排表、tf-idf 矩阵使用的源代码

## bug 处理：
若 nltk 库不能正常运行或下载器下载缓慢，可通过睿客网下载 [nltk_data](https://rec.ustc.edu.cn/share/1ed388f0-2e52-11eb-83a2-8926fdd7b031) ，解压至 `C:/nltk_data/` 即可使用。
