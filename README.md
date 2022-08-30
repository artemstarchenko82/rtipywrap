# rtipywrap
Пакет-обертка для python SDK

## Tinkoff Invest API python R wrapper
Документация https://tinkoff.github.io/investAPI/  
Python SDK https://tinkoff.github.io/invest-python/

## Установка необходимых библиотек python
Для работы необходимо установить следующие библиотеки: 

```shell

$ pip3 install tinkoff-investments
$ pip3 install numpy
$ pip3 install pandas 

```



## Сохранение токена в .Renviron

Большинство функций использует конструкцию: 
```r 

Sys.getenv("rti_TOKEN")

```
Поэтому для удобства работы предлагается сразу сохранить токен в файле .Renviron. Для этого откройте файл, воспользовавшись одной из команд: 

```r 

# base R
file.edit(normalizePath("~/.Renviron"))

# или пакет usethis
usethis::edit_r_environ()

```
Напишите в файле строчку: 
```r 

# Вместо *** вставьте ваш токен 
rti_TOKEN = "***"


```
