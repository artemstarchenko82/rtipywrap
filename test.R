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
instrument <- rti_instruments_get_instrument_by(figi)

as.data.frame(instrument) |> View()
