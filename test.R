# Тестируем в боевых условиях основные функции 

library(rtipywrap)

# Получаем список аккаунтов 
accounts <- rti_users_get_accounts()

# Переводим в data.frame
as.data.frame(accounts) |> View()

# account_id первого аккаунта 
account_id <- accounts$accounts[[1]]$id

# получаем портфель 
portfolio <- rti_operations_get_portfolio(id)

as.data.frame(portfolio) |> View()

# Запрашиваем информацию по иснтрументу
figi <- portfolio$positions[[1]]$figi
instrument <- rti_instruments_get_instrument_by_figi(figi)

as.data.frame(instrument) |> View()


# Получаем последнюю цену

figis <- portfolio$positions |> vapply(\(x) x$figi, character(1))

last_prices <- rti_market_data_get_last_prices(figis)

as.data.frame(last_prices)


# Получаем список валют 

currencies <- rti_instruments_currencies()

as.data.frame(currencies) 


