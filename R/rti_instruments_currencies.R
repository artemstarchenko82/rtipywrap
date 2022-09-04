#' Список валют 
#' 
#' @description Получение списка валют по методу 
#' [Currencies](https://tinkoff.github.io/investAPI/instruments/#currencies)
#' 
#' @return Объект класса 'tinkoff.invest.schemas.CurrenciesResponse'
#' 
#' 
#' @param token [токен](https://tinkoff.github.io/investAPI/token/) для работы с TINKOFF INVEST API 
#' 
#' @export
rti_instruments_currencies <- function(token = Sys.getenv("rti_TOKEN")){
    reticulate::source_python(
        system.file("python/client_instruments_currencies.py", package = "rtipywrap")
    )
    
    client_instruments_currencies(token)   
}

#' Переводим список валют в data.frame
#'
#' @param x Объект класса 'tinkoff.invest.schemas.CurrenciesResponse'. Подробнее 
#' смотрите [CurrenciesResponse](https://tinkoff.github.io/investAPI/instruments/#currenciesresponse)
#' 
#' @export

as.data.frame.tinkoff.invest.schemas.CurrenciesResponse <- function(x){
    cur <-  x$instruments
    
    data.frame(
        figi = cur |> vapply(\(x) x$figi, character(1)),
        ticker = cur |> vapply(\(x) x$ticker, character(1)),
        class_code = cur |> vapply(\(x) x$class_code, character(1)),
        isin = cur |> vapply(\(x) x$isin, character(1)),
        lot = cur |> vapply(\(x) x$lot, integer(1)),
        currency = cur |> vapply(\(x) x$currency, character(1)),
        klong = cur |> vapply(\(x) as.double(x$klong), double(1)),
        kshort = cur |> vapply(\(x) as.double(x$kshort), double(1)),
        dlong = cur |> vapply(\(x) as.double(x$dlong), double(1)),
        dshort = cur |> vapply(\(x) as.double(x$dshort), double(1)),
        dlong_min = cur |> vapply(\(x) as.double(x$dlong_min), double(1)),
        dshort_min = cur |> vapply(\(x) as.double(x$dshort_min), double(1)),
        short_enabled_flag = cur |> vapply(\(x) x$short_enabled_flag, logical(1)),
        name = cur |> vapply(\(x) x$name, character(1)),       
        exchange = cur |> vapply(\(x) x$exchange, character(1)),
        nominal = cur |> vapply(\(x) as.double(x$nominal), double(1)),
        nominal_currency = cur |> vapply(\(x) x$currency, character(1)),
        country_of_risk = cur |> vapply(\(x) x$country_of_risk, character(1)),
        country_of_risk_name = cur |> vapply(\(x) x$country_of_risk_name, character(1)),
        trading_status = cur |> vapply(\(x) x$trading_status$real, integer(1)),
        otc_flag = cur |> vapply(\(x) x$otc_flag, logical(1)),
        buy_available_flag = cur |> vapply(\(x) x$buy_available_flag, logical(1)),
        sell_available_flag = cur |> vapply(\(x) x$sell_available_flag, logical(1)),
        iso_currency_name = cur |> vapply(\(x) x$iso_currency_name, character(1)),
        min_price_increment = cur |> vapply(\(x) as.double(x$min_price_increment), double(1)),
        api_trade_available_flag = cur |> vapply(\(x) x$api_trade_available_flag, logical(1)),
        uid = cur |> vapply(\(x) x$uid, character(1)),
        real_exchange = cur |> vapply(\(x) x$real_exchange$real, integer(1)),
        position_uid = cur |> vapply(\(x) x$position_uid, character(1)),
        for_iis_flag = cur |> vapply(\(x) x$for_iis_flag, logical(1)),
        first_1min_candle_date = do.call(c, lapply(cur, \(x) x$first_1min_candle_date)),
        first_1day_candle_date = do.call(c, lapply(cur, \(x) x$first_1day_candle_date))
    ) 
} 