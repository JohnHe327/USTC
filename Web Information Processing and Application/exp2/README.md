# exp2

Web 信息处理与应用 lab2

# setup
``` bash
cd src/TPlinker-joint-extraction
pip install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
pip install -r requirements.txt
pip install sklearn
```

# training TPlinker
cd `./TPlinker_data`

run `transfer_data.ipynb`，将给定数据集转换成TPlinker可以处理的形式

将`train.txt`, `valid.txt`, `test.txt`复制进 `ori_data/web_lab2/train_data`, `ori_data/web_lab2/valid_data`, `ori_data/web_lab2/test_data`

cd `./TPlinker-joint-extraction/preprocess`

run `BuildData.ipynb`

Download [BERT-BASE-CASED](https://drive.google.com/drive/folders/1GCWNXQN-L09oSG9ZFYi979wk2dTS9h-3?usp=sharing) and put it under `./pretrained_models`. Put word embeddings under `./pretrained_emb`

Now start training

cd `tplinker`

python `train.py`

> 所有目录均以`src`为根目录

# 先进行bayes模型预测
```bash
python NaiveBayes.py
cd ./TPlinker_data
run generate_res.ipynb
```
