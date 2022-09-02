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
    
    a <- x$accounts
    
    data.frame(
        id = a |> vapply(\(x) x$id, character(1)),
        type = a |> vapply(\(x) x$type$real, integer(1)),
        type = a |> vapply(\(x) x$type$real, integer(1)),
        opened_date = do.call(c, a |> lapply(\(x) x$opened_date)),
        closed_date = do.call(c, a |> lapply(\(x) x$closed_date)),
        access_level = a |> vapply(\(x) x$access_level$real, integer(1))
    ) 
    
}
