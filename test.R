library(rtipywrap)

# Получаем список аккаунтов 
accounts <- rti_users_get_accounts()

as.data.frame(accounts) |> View()

# account_id первого аккаунта 
id <- accounts$accounts[[1]]$id

# получаем портфель 
portfolio <- rti_operations_get_portfolio(id)

as.data.frame(portfolio) |> View()
