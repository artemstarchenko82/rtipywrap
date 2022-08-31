# Загружаем библиотеки 
from tinkoff.invest import Client

# Получить портфель
def client_operations_get_portfolio(ACCOUNT_ID, TOKEN):
  with Client(TOKEN) as client:
      portfolio = client.operations.get_portfolio(account_id = ACCOUNT_ID)

  return portfolio
