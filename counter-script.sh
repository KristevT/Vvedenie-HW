#!/bin/bash

if [[ -d $1 ]]
then
    echo "Папка найдена. Подсчитываем файлы в $1..."
fi

if [[ ! -d $1 ]]
then
	echo "Папка не найдена. Подсчитываем файлы в текущей директории"
fi

i=0
png_cnt=0
txt_cnt=0
misc_cnt=0
result=result.txt

if [[ -d $1 ]]
then
	for file in $(ls $1)
	do
		from="$1/$file"
		if [[ $from == *.png ]]
		then
			png_cnt=$(($png_cnt+1))
		elif [[ $from == *.txt ]]
		then
			txt_cnt=$(($txt_cnt+1))
		else
			misc_cnt=$(($misc_cnt+1))
		fi
	done
else
	for file in $(ls)
	do
		if [[ $file == *.png ]]
		then
			png_cnt=$(($png_cnt+1))
		elif [[ $file == *.txt ]]
		then
			txt_cnt=$(($txt_cnt+1))
		else
			misc_cnt=$(($misc_cnt+1))
		fi
	done
fi

if [[ -d $1 ]]
then
	if [[ -f $1/$result ]]
	then 
	txt_cnt=$(($txt_cnt-1)) #файл с результатами подсчёта не учитывается
	fi
else
	if [[ -f $result ]]
	then 
	txt_cnt=$(($txt_cnt-1))
	fi
fi

echo "Результаты подсчёта:"
echo "Найдено $png_cnt файлов формата .png"
echo "Найдено $txt_cnt файлов формата .txt"
echo "Найдено $misc_cnt файлов с прочими форматами"
echo "Вы можете повторно посмотреть статистику в файле $result в указанной папке"

if [[ -d $1 ]]
then
    touch $1/$result
	echo "Дата проверки: `date`" >> $1/$result
	echo "Найдено $png_cnt файлов формата .png" >> $1/$result
	echo "Найдено $txt_cnt файлов формата .txt" >> $1/$result
	echo "Найдено $misc_cnt файлов с прочими форматами" >> $1/$result
	echo "" >> $1/$result
	exit 0
else
	touch $result
	echo "Дата проверки: `date`" >> $result
	echo "Найдено $png_cnt файлов формата .png" >> $result
	echo "Найдено $txt_cnt файлов формата .txt" >> $result
	echo "Найдено $misc_cnt файлов с прочими форматами" >> $result
	echo "" >> $result
	exit 0
fi