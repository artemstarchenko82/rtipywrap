# Официальнео python API https://github.com/Tinkoff/invest-python 

# Загружаем библиотеки 
from tinkoff.invest import Client

# Получить список валют
def client_instruments_currencies(TOKEN):
  with Client(TOKEN) as client:
    currencies = client.instruments.currencies(instrument_status = 1)
  return currencies


