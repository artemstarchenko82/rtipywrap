# Тестируем в боевых условиях основные функции 

library(rtipywrap)

# Получаем список аккаунтов 
accounts <- rti_users_get_accounts()

# Переводим в data.frame
as.data.frame(accounts) |> View()

# account_id первого аккаунта 
id <- accounts$accounts[[1]]$id

# получаем портфель 
portfolio <- rti_operations_get_portfolio(id)

# Переводим в data.frame
as.data.frame(portfolio) |> View()
