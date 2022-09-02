# rtipywrap
Пакет-обертка для python SDK

## Tinkoff Invest API python R wrapper
Документация https://tinkoff.github.io/investAPI/  
Python SDK https://tinkoff.github.io/invest-python/

## Установка необходимых библиотек python
Для работы необходимо установить [SDK Python Tinkoff Invest](https://tinkoff.github.io/invest-python/). Для этого укажите введите в терминале: 

```shell

$ pip install tinkoff-investments

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

# Пример использования

```r

library(rtipywrap)

# Получаем список аккаунтов 
accounts <- rti_users_get_accounts()

# Переводим в data.frame
as.data.frame(accounts) |> View()

# account_id первого аккаунта 
id <- accounts$accounts[[1]]$id

# получаем портфель 
portfolio <- rti_operations_get_portfolio(id)

# Переводим в data.frame
as.data.frame(portfolio) |> View()

```