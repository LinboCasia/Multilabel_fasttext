#!/usr/bin/env bash

###use the following command
##./main_run.sh train    #(test/predict/predict-prob)

model_path="./data/model/fasttext_model"
train_path="./data/corpus/train_sample.txt"
test_path=$train_path
pred_path=$train_path
predict_outfile="./data/result/prediction.txt" ##the default path="./data/result/prediction.txt"

###################
##the default value of train are the same as facebookresearch fastText

minCount=5
lr=0.1
dim=50
epoch=5
lrUpdateRate=100
bucket=2000
t=0.0001
##
pred_num=2 ##the default pred_num=1, pred_num is k
th=0.2 ##the default th=0.0

###################
str=$(printf "%-30s" "=")
if [ "$1" = "train" ]
then
du -h $train_path
wc -l $train_path

echo "${str// /=}"

./fasttext supervised -input $train_path -output $model_path \
    -minCount $minCount -lr $lr -epoch $epoch \
    -lrUpdateRate $lrUpdateRate -bucket $bucket \
    -t $t -dim $dim

###################
elif [ "$1" = "test" ]
then
du -h $test_path

./fasttext test $model_path".bin" $test_path $pred_num $th

###################
elif [ "$1" = "predict" ]
then
du -h $pred_path

./fasttext predict $model_path".bin" $test_path $pred_num $th $predict_outfile

elif [ "$1" = "predict-prob" ]
then
du -h $pred_path
./fasttext predict-prob $model_path".bin" $test_path $pred_num $th $predict_outfile

fi
echo "${str// /=}"