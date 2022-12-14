% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rti_operations_get_portfolio.R
\name{rti_operations_get_portfolio}
\alias{rti_operations_get_portfolio}
\title{Получение портфолио}
\usage{
rti_operations_get_portfolio(account_id, token = Sys.getenv("rti_TOKEN"))
}
\arguments{
\item{account_id}{идентификатор счёта пользователя. Список всех счетов можно получить
через вызов \code{\link[=rti_users_get_accounts]{rti_users_get_accounts()}}}

\item{token}{\href{https://tinkoff.github.io/investAPI/token/}{токен} для работы с TINKOFF INVEST API}
}
\value{
Объект класса \code{tinkoff.invest.schemas.PortfolioResponse}
}
\description{
Используется метод \href{https://tinkoff.github.io/investAPI/operations/#portfoliorequest}{GetPortfolio}
}
