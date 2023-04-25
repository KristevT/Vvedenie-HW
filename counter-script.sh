#!/bin/bash
#if [[ ! -n $1 ]]
#then
#	echo "спользованиe $0 в качестве папки"
#fi

i=0
png_cnt=0
txt_cnt=0
misc_cnt=0
for file in $(ls $0)
do
	from="$0/$file"
	if [[ $file == *.png ]]
	then
		png_cnt+=1
	elif [[ $file == *.txt ]]
	then
		txt_cnt+=1
	else
		misc_cnt+=1
	fi
done

echo "Найдено $png_cnt файлов формата .png"
echo "Найдено $txt_cnt файлов формата .txt"
echo "Найдено $misc_cnt файлов с прочими форматами"
