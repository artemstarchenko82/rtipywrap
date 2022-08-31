#' Загружаем список аккаунтов Тинькофф
#' 
#' @description Используется метод [GetAccounts](https://tinkoff.github.io/investAPI/users/#getaccountsrequest)
#'
#' @return Результат <-  объект класса `tinkoff.invest.schemas.GetAccountsResponse`
#' 
#' @param token [Токен](https://tinkoff.github.io/investAPI/token/) для работы с TINKOFF INVEST API
#'
#' @export
rti_users_get_accounts <- function(token = Sys.getenv("rti_TOKEN")){
    
    reticulate::source_python(
        system.file("python/client_users_get_accounts.py", package = "rtipywrap")
    )
    
    client_users_get_accounts(token)
    
}


#' Переводим список аккантов GetAccountsResponse в data.frame
#' 
#' @description Используется pandas для перевода объекта класса 
#' `tinkoff.invest.schemas.GetAccountsResponse` в data.frame
#'
#' @export
as.data.frame.tinkoff.invest.schemas.GetAccountsResponse <- function(x){
    pd <- reticulate::import("pandas")
    
    x$accounts |> 
        pd$DataFrame()
}
