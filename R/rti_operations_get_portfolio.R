#' Получение портфолио
#' 
#' @description Используется метод [GetPortfolio](https://tinkoff.github.io/investAPI/operations/#portfoliorequest)
#' 
#' @param account_id идентификатор счёта пользователя. Список всех счетов можно получить
#' через вызов [rti_users_get_accounts()]
#' 
#' @param token [токен](https://tinkoff.github.io/investAPI/token/) для работы с TINKOFF INVEST API 
#' 
#' @return Объект класса `tinkoff.invest.schemas.PortfolioResponse`
#' 
#' @export
rti_operations_get_portfolio <- function(
        account_id,
        token = Sys.getenv("rti_TOKEN")
    ){
    
    reticulate::source_python(
        system.file("python/client_operations_get_portfolio.py", package = "rtipywrap")
    )
    
    client_operations_get_portfolio(account_id, token)
    
}


#' Перевод объекта PortfolioResponse в data.frame
#' 
#' @description Конструируем data.frame из данных объекта 
#' [PortfolioResponse](https://tinkoff.github.io/investAPI/operations/#portfolioresponse)
#' 
#' @param x объект класса 'tinkoff.invest.schemas.PortfolioResponse'
#' 
#' @export
as.data.frame.tinkoff.invest.schemas.PortfolioResponse <- function(x){
    pd <- reticulate::import("pandas")
    
    # Переводим список позиций в data.frame
    position <- x$positions
    
    df <- data.frame(
        figi = 
            position |> 
            vapply(\(x) x$figi, character(1)),
        
        instrument_type = 
            position |> 
            vapply(\(x) x$instrument_type, character(1)),
        
        quantity = 
            position |> 
            lapply(\(x) x$quantity) |> 
            vapply(as.double, double(1)),
        
        average_position_price = 
            position |> 
            lapply(\(x) x$average_position_price) |> 
            vapply(as.double, double(1)), 
        
        average_position_price_currency = 
            position |> 
            lapply(\(x) x$average_position_price$currency) |> 
            vapply(as.character, character(1)), 
        
        expected_yield = 
            position |> 
            lapply(\(x) x$expected_yield) |> 
            vapply(as.double, double(1)),
        
        current_nkd = 
            position |> 
            lapply(\(x) x$current_nkd) |> 
            vapply(as.double, double(1)), 
        
        current_nkd_currency = 
            position |> 
            lapply(\(x) x$current_nkd$currency) |> 
            vapply(as.character, character(1)), 
        
        average_position_price_pt = 
            position |> 
            lapply(\(x) x$average_position_price_pt) |> 
            vapply(as.double, double(1)), 
        
        current_price = 
            position |> 
            lapply(\(x) x$current_price) |> 
            vapply(as.double, double(1)),
        
        current_price_currency = 
            position |> 
            lapply(\(x) x$current_price$currency) |> 
            vapply(as.character, character(1)), 
        
        average_position_price_fifo = 
            position |> 
            lapply(\(x) x$average_position_price_fifo) |> 
            vapply(as.double, double(1)),       
        
        average_position_price_fifo_currency =
            position |> 
            lapply(\(x) x$average_position_price_fifo$currency) |> 
            vapply(as.character, character(1)), 
        
        quantity_lots =
            position |> 
            lapply(\(x) x$quantity_lots) |> 
            vapply(as.double, double(1)),
        
        blocked = 
            position |> 
            vapply(\(x) x$blocked, logical(1))
    )
    
    
    # Добавляем аттрибуты из других полей объекта 
    attr(df, "expected_yield") <- as.double(x$expected_yield)
    attr(df, "total_amount_currencies") <- as.double(x$total_amount_currencies)
    attr(df, "total_amount_bonds") <- as.double(x$total_amount_bonds)
    attr(df, "total_amount_etf") <- as.double(x$total_amount_etf)
    attr(df, "total_amount_shares") <- as.double(x$total_amount_shares)
    attr(df, "total_amount_futures") <- as.double(x$total_amount_futures)
    
    df
}
