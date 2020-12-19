# exp2

Web 信息处理与应用 lab2

# setup
``` batch
cd src/TPlinker-joint-extraction
pip install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
pip install -r requirements.txt
pip install sklearn
pip install numpy
```

# wandb key
8db56f1a9bc984d271caa1ac7b1770f3437d4020

# azure training cmd
## batch
``` batch
cd /ds/baselines/TPlinker-joint-extraction
pip install torch==1.6.0+cu101 torchvision==0.7.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html
pip install -r requirements.txt
cd tplinker
python train.py
```

## access keys
sf8feKi/zwOzXfJyYLzISGmvNLMnW/bCBeD4GiMU32Y+Z+gUCeqWViNySg7eRHa4MjgZukZgbe7npO4D9RbaHg==

## azcopy
azcopy cp "./requirements.txt" "https://jianzong.blob.core.windows.net/tloss-ucr?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2021-04-24T14:22:56Z&st=2020-11-17T06:22:56Z&spr=https&sig=WWSuuYpjqz%2BtTq2r43v11SrAI8q6%2FjcgiVQ1mpQtnXM%3D"

azcopy cp "./*" "https://jianzong.blob.core.windows.net/web-lab2/?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2021-04-24T14:22:56Z&st=2020-11-17T06:22:56Z&spr=https&sig=WWSuuYpjqz%2BtTq2r43v11SrAI8q6%2FjcgiVQ1mpQtnXM%3D" --recursive=true

azcopy cp "https://jianzong.blob.core.windows.net/web-lab2/src/TPlinker-joint-extraction/tplinker/wandb?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2021-04-24T14:22:56Z&st=2020-11-17T06:22:56Z&spr=https&sig=WWSuuYpjqz%2BtTq2r43v11SrAI8q6%2FjcgiVQ1mpQtnXM%3D" "./wandb" --recursive=true

azcopy cp "https://jianzong.blob.core.windows.net/representation-learning/baselines/tloss/models_multi_pos/*?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2021-04-24T14:22:56Z&st=2020-11-17T06:22:56Z&spr=https&sig=WWSuuYpjqz%2BtTq2r43v11SrAI8q6%2FjcgiVQ1mpQtnXM%3D" "./models_multi_pos" --recursive=true

azcopy rm "https://jianzong.blob.core.windows.net/representation-learning/baselines/tloss/models_multi_pos?sv=2019-12-12&ss=bfqt&srt=sco&sp=rwdlacupx&se=2021-04-24T14:22:56Z&st=2020-11-17T06:22:56Z&spr=https&sig=WWSuuYpjqz%2BtTq2r43v11SrAI8q6%2FjcgiVQ1mpQtnXM%3D" --recursive=true
