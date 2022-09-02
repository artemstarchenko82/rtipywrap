#' Получение данных об инструменте по FIGI
#' 
#' @description Используется метод [GetInstrumentBy](https://tinkoff.github.io/investAPI/instruments/#getinstrumentby)
#' 
#' @param account_id идентификатор счёта пользователя. Список всех счетов можно получить
#' через вызов [rti_users_get_accounts()]
#' 
#' @param figi [Financial Instrument Global Identifier](https://en.wikipedia.org/wiki/Financial_Instrument_Global_Identifier)
#' @param token [токен](https://tinkoff.github.io/investAPI/token/) для работы с TINKOFF INVEST API 
#' 
#' @return Объект класса 'tinkoff.invest.schemas.InstrumentResponse'. 
#' Подробное описание на [InstrumentResponse](https://tinkoff.github.io/investAPI/instruments/#instrumentresponse) 
#' 
#' @export
rti_instruments_get_instrument_by<- function(
        figi,
        token = Sys.getenv("rti_TOKEN")
){
    
    reticulate::source_python(
        system.file("python/client_instruments_get_instrument_by.py", package = "rtipywrap")
    )
    
    client_instruments_get_instrument_by(TOKEN = token, FIGI = figi)
    
}

#' Переводим InstrumentResponse в data.frame
#' 
#' @description Переводим объект класса [InstrumentResponse](https://tinkoff.github.io/investAPI/instruments/#instrumentresponse)  
#' в data.frame 
#' 
#' @param x Объект класса 'tinkoff.invest.schemas.InstrumentResponse'. 
#' 
#' @export
as.data.frame.tinkoff.invest.schemas.InstrumentResponse <- function(x){
    x <- instrument$instrument
    
    data.frame(
        figi = x$figi, 
        ticker = x$ticker, 
        class_code = x$class_code,
        isin = x$isin, 
        lot = x$lot, 
        min_price_increment = x$min_price_increment |> as.double(), 
        currency = x$currency, 
        klong = x$klong |> as.double(),
        kshort = x$kshort |> as.double(),
        dlong = x$dlong |> as.double(),
        dshort = x$dshort |> as.double(),
        dlong_min = x$dlong_min |> as.double(),
        dshort_min = x$dshort_min |> as.double(),
        short_enabled_flag = x$short_enabled_flag,
        name = x$name,
        exchange = x$exchange,
        country_of_risk = x$country_of_risk,
        country_of_risk_name = x$country_of_risk_name,
        instrument_type = x$instrument_type,
        trading_status = x$trading_status$real,
        otc_flag = x$otc_flag,
        buy_available_flag = x$buy_available_flag,
        sell_available_flag = x$sell_available_flag,
        api_trade_available_flag = x$api_trade_available_flag,
        uid = x$uid,
        real_exchange = x$real_exchange$real,
        position_uid = x$position_uid,
        for_iis_flag = x$for_iis_flag,
        first_1min_candle_date = x$first_1min_candle_date,
        first_1day_candle_date = x$first_1day_candle_date
    )
}