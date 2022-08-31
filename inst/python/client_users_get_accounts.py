# Официальнео python API https://github.com/Tinkoff/invest-python 

# Загружаем библиотеки 
from tinkoff.invest import Client

# Получить список аккаунтов
def client_users_get_accounts(TOKEN):
  with Client(TOKEN) as client:
      accounts = client.users.get_accounts()
  return accounts
