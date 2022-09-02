# Методы для работы с классом 'tinkoff.invest.schemas.MoneyValue'

#' Перевод MoneyValue в double
#' 
#' @description Переводим класс [MoneyValue](https://tinkoff.github.io/investAPI/operations/#moneyvalue) 
#' (денежная сумма в определенной валюте) в [base::double].
#' 
#' @param x Объект класса 'tinkoff.invest.schemas.MoneyValue'
#' 
#' @export
as.double.tinkoff.invest.schemas.MoneyValue <- function(x){
    paste(x$units, abs(x$nano), sep = ".") |> 
        as.double()
}

#' MoneyValue в character
#' 
#' @description Переводим класс [MoneyValue](https://tinkoff.github.io/investAPI/operations/#moneyvalue) 
#' (денежная сумма в определенной валюте) в [base::character].
#' 
#' @param x Объект класса 'tinkoff.invest.schemas.MoneyValue'
#' 
#' @return Результат в формате `"123.6 rub"`, `"233.8 usd"` и т.п.
#' 
#' 
#' @export

as.character.tinkoff.invest.schemas.MoneyValue <- function(x){
    paste(as.double(x), x$currency)
}



#' Печать MoneyValue
#' 
#' @description Выводим класс [MoneyValue](https://tinkoff.github.io/investAPI/operations/#moneyvalue) 
#' на экран. 
#' 
#' @param x Объект класса 'tinkoff.invest.schemas.MoneyValue'
#' 
#' @return Выводим на экран применение к x метода [as.character.tinkoff.invest.schemas.MoneyValue()]
#' 
#' 
#' 
#' @export

print.tinkoff.invest.schemas.MoneyValue <- function(x){
    cat(as.character(x))
}

