#' Получить последнюю цену по списку FIGI
#' 
#' @param figis character-ветор со значениями FIGI 
#' [Financial Instrument Global Identifier](https://en.wikipedia.org/wiki/Financial_Instrument_Global_Identifier)
#' @param token [токен](https://tinkoff.github.io/investAPI/token/) для работы с TINKOFF INVEST API 
#' 
#' @return Объект класса 'tinkoff.invest.schemas.GetLastPricesResponse' 
#' См. описание [GetLastPricesResponse](https://tinkoff.github.io/investAPI/marketdata/#getlastpricesresponse)
#' 
#' 
#' @export
rti_market_data_get_last_prices <- function(
    figis,
    token = Sys.getenv("rti_TOKEN")
){
    reticulate::source_python(
        system.file("python/client_market_data_get_last_prices.py", package = "rtipywrap")
    )
    
    client_market_data_get_last_prices(TOKEN = token, FIGIs = figis)
    
}


#' Переводим GetLastPricesResponse в data.frame
#' 
#' @param x Объект класса 'tinkoff.invest.schemas.GetLastPricesResponse' 
#' 
#' @export
as.data.frame.tinkoff.invest.schemas.GetLastPricesResponse <- function(x){
    lp  <- x$last_prices

    data.frame(
        figi = lp |> vapply(\(x) x$figi, character(1)),
        price = lp |> vapply(\(x) as.double(x$price), double(1)),
        time = do.call(c, lp |> lapply(\(x) x$time))
    )
}