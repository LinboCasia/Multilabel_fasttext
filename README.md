# Multilabel_fasttext

Multilabel Classification base [facebookresearch fastText](https://github.com/facebookresearch/fastText).

The requirements is the same as facebookresearch fastText



## Building Multilabel_fasttext

In order to build `Multilabel_fasttext`, use the following:

```
$ git clone https://github.com/LinboCasia/Multilabel_fasttext.git
$ cd Multilabel_fasttext/Multilabel_fastText
$ make
```


## Example use cases
### Word representation learning

the same as [facebookresearch fastText](https://github.com/facebookresearch/fastText)

### Obtaining word vectors for out-of-vocabulary words
the same as [facebookresearch fastText](https://github.com/facebookresearch/fastText)

### Text classification

This library can also be used to train supervised text classifiers, for instance for sentiment analysis. use:

```
$ ./fasttext supervised -input train.txt -output model
```

where `train.txt` is a text file containing a training sentence per line along with the labels.
By default, we assume that labels are words that are prefixed by the string `__label__`.
This will output two files: `model.bin` and `model.vec`.
Once the model was trained, you can evaluate it by computing the precision and recall at k on a test set using:

```
$ ./fasttext test model.bin test.txt k th 
```

The argument `k` is optional, and is equal to `1` by default.
The argument `th` is optional, and is equal to `0.0` by default.
Different with facebookresearch fastText, this code is choose the top k candidate labels sorted by the predict probability,
and then filtrate labels base the predict probability that bigger than th(threshold) will be keep.

In order to obtain the k and th most likely labels for a piece of text, use:

```
$ ./fasttext predict model.bin test.txt k th prediction_path
```

```
$ ./fasttext predict-prob model.bin test.txt k th prediction_path
```

where `test.txt` contains a piece of text to classify per line.
Doing so will print to the standard output the k most likely labels for each line.
If use the argument `predict-prob`, the prediction output file will show the predict probability of every labels.
The argument `k` is optional, and equal to `1` by default.
The argument `th` is optional, and equal to `0.0` by default.
The argument `prediction_path` is optional, and equal to `"./data/result/prediction.txt"` by default.

See `main_run.sh` for an example use case.
You can run the following command to train(test/predict/predict-prob)

```
$ chmod 755 main_run.sh
$ ./main_run.sh train
$ ./main_run.sh test
$ ./main_run.sh predict
$ ./main_run.sh predict-prob
```

### Others

the same as [facebookresearch fastText](https://github.com/facebookresearch/fastText)
