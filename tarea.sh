#! /usr/bin/env bash

datasets='/Users/Gaby/data-sets'
states="$datasets/states.tab.gz"

answer_1=$(gzcat $states \
    | grep -v '^#' \
    | cut -f1,6 \
    | sort -k2n \
    | head -1 \
    | cut -f1 \
    | sed 's/"//g')

    echo "answer-1: $answer_1"
echo "answer-1:$answer_1"> answers.yml

samplefa="$datasets/sample.fa"

answer_2=$(cat $samplefa \
    |grep -c '>' \
    |cut -f1)

    echo "answer-2: $answer_2"
 echo "answer-2:$answer_2">> answers.yml

cpg="$datasets/cpg.bed.gz"

answer_3=$(gzcat $cpg \
    | cut -f4 \
    | sort \
    | uniq \
    | wc -l)

    echo "answer-3: $answer_3"
echo "answer-3:$answer_3">> answers.yml

sp1="$datasets/SP1.fq"

answer_4=$(cat $sp1 \
    | grep @cluster \
    | wc -l)

    echo "answer-4: $answer_4"
echo "answer-4:$answer_4">> answers.yml

hamlet="$datasets/hamlet.txt"

answer_5=$(cat $hamlet \
    |grep -i bloody \
    |wc -w)

   echo "answer-5: $answer_5"
echo "answer-5:$answer_5">> answers.yml

answer_6=$(cat $samplefa \
    |grep -v '>' \
    |head -1 \
    |tr -d '\n' \
    |wc -m)

    echo "answer-6: $answer_6"
echo "answer-6:$answer_6">> answers.yml


genes="$datasets/genes.hg19.bed.gz"

answer_7=$(gzcat $genes \
    |awk '{print $4, $3-$2}' \
    |sort -k2nr \
    |head -n1 \
    |cut -f1 -d' ')

    echo "answer-7: $answer_7"
echo "answer-7:$answer_7">> answers.yml

answer_8=$(gzcat $genes \
    | cut -f1 \
    | sort \
    | uniq \
    | wc -l)
    
    echo "answer-8: $answer_8"
echo "answer-8:$answer_8">> answers.yml

peaks="$datasets/peaks.chr22.bed.gz"

answer_9=$(gzcat $peaks \
    |cut -f4 \
    |grep -v CTCFL \
    |grep CTCF \
    |wc -l)
    
    echo "answer-9: $answer_9"
echo "answer-9:$answer_9">> answers.yml

lamina="$datasets/lamina.bed"

answer_10=$(cat $lamina \
    |grep -v '^#' \
    |awk '{print $1, $3-$2}' \
    |sort -k2nr \
    |head -n1 \
    |cut -f1 -d ' ')
    
    echo "answer-10: $answer_10"
echo "answer-10:$answer_10">> answers.yml

