#' Получение портфолио
#' 
#' @description Используется метод [GetPortfolio](https://tinkoff.github.io/investAPI/operations/#portfoliorequest)
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

#' Перевеод в число объекта Quotation
#' 
#' @export
as.double.tinkoff.invest.schemas.Quotation <- function(x){
    paste(x$units, abs(x$nano), sep = ".") |> 
        as.numeric()
}



#' Перевод объекта PortfolioResponse в data.frame
#' 
#' @export
as.data.frame.tinkoff.invest.schemas.PortfolioResponse <- function(x){
    pd <- reticulate::import("pandas")
    
    # Переводим список позиций в data.frame
    df <- x$positions |> 
        pd$DataFrame()  
    
    # Добавляем аттрибуты из других полей объекта 
    attr(df, "expected_yield") <- as.double(x$expected_yield)
    attr(df, "total_amount_currencies") <- as.double(x$total_amount_currencies)
    attr(df, "total_amount_bonds") <- as.double(x$total_amount_bonds)
    attr(df, "total_amount_etf") <- as.double(x$total_amount_etf)
    attr(df, "total_amount_shares") <- as.double(x$total_amount_shares)
    attr(df, "total_amount_futures") <- as.double(x$total_amount_futures)
    
    df
}
