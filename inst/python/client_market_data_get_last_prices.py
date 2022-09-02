# Загружаем библиотеки 
from tinkoff.invest import Client

# Получить последнюю цену по списку инструментов
def client_market_data_get_last_prices(TOKEN, FIGIs):
  with Client(TOKEN) as client:
    price = client.market_data.get_last_prices(figi = FIGIs)
  return price
