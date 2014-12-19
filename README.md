Please scroll down for English.

# 清擦音混合实验

这个实验研究的是两个清擦音“混合”之后的听感。它是对知乎上这个答案（http://www.zhihu.com/question/27126800/answer/35376174 ）中一条评论的回复。

实验方法和结果请参见http://maigoakisame.github.io/fricative-mix/index.htm 。这里记述的是实验的目录结构。

## 根目录：

内含如下文件：
* index.html：实验结果展示页面；
* dewplayer-mini.swf：一个可以嵌入网页的、基于Flash的mp3播放器。
* README.md：本说明文档。

## matlab目录：

内含如下四个Matlab源文件：
* main.m：主程序；
* mix.m：混合两个清擦音的函数；
* spectrogram.m：计算一段语音语谱图的函数；
* synthesize.m：根据语谱图合成语音信号的函数。

## audio目录：

内含三个子目录：
* input-wav：四个清擦音的原始录音，以wav格式存储，采样率为16 kHz；
* output-wav：各对清擦音的混合音，格式同上；
* output-mp3：各对清擦音的混合音，转换成mp3格式，用于在网页上播放。

## spectrogram目录：

各对清擦音混合后的语谱图，用Cool Edit生成。

# Mixture of Unvoiced Fricatives

This experiments studies what the mixture of two unvoiced fricatives sounds like. It is in response to a comment to this answer on Zhihu: http://www.zhihu.com/question/27126800/answer/35376174 .

Please refer to http://maigoakisame.github.io/fricative-mix/index.htm for the methodology and the results. This README file documents the directory structure of the experiment.

## The root directory

Contains the following files:
* index.html: the web page that displays the results;
* dewplayer-mini.swf: a Flash-based MP3 player that can be embedded in web pages;
* README.md: this document.

## The "matlab" directory

Contains the following four Matlab source-code files:
* main.m: the main program;
* mix.m: a function to mix two unvoiced fricatives;
* spectrogram.m: a function to compute the spectrogram of a speech signal;
* synthesize.m: a function to synthesize a speech signal from a spectrogram.

## The "audio" directory

Contains three sub-directories:
* input-wav: the original recordings of the four unvoiced fricatives in the wav format, sampled at 16 kHz;
* output-wav: the mixture of each pair of unvoiced fricatives, in the same format as above;
* output-mp3: the mixture of each pair of unvoiced fricatives, converted to the mp3 format for playback on the web page.

## The "spectrogram" directory

The spectrogram of the mixture of each pair of unvoiced fricatives, generated with Cool Edit.
