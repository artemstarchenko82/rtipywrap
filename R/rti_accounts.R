#' Загружаем список аккаунтов Тинькофф
#'
#' @param token ваш токен API Tinkoff Invest
#'
#' @export
rti_accounts <- function(token = Sys.getenv("rti_TOKEN")){
    
    reticulate::source_python("python/ti_functions.py")
    
    get_my_accounts(token)
    
}
