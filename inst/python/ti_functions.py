# Официальнео python API https://github.com/Tinkoff/invest-python 

# Загружаем библиотеки 
from tinkoff.invest import Client


  
# Функция для перевода nano и unit во float
def from_units_nano(x):
  return float(str(x["units"]) + "." + str( abs(x["nano"])))    

# Та же функция, но для итеррируемого объекта 
def from_units_nano_iter(x):
  return [from_units_nano(element) for element in x]

# Функция для извлечения валюты 
def get_currency(x):
  return [p["currency"] for p in x]


      

# Получить портфель
def get_my_portfolio(ACCOUNT_ID, TOKEN):
  with Client(TOKEN) as client:
      portfolio = client.operations.get_portfolio(account_id = ACCOUNT_ID)
  
  portfolio_df = pd.DataFrame(portfolio.positions)
  
  # Убираем nano и unit и добавляем валюту
  portfolio_df['quantity'] = from_units_nano_iter(portfolio_df['quantity'])
  portfolio_df['average_position_price_currency'] = get_currency(portfolio_df['average_position_price'])
  portfolio_df['average_position_price'] = from_units_nano_iter(portfolio_df['average_position_price'])
  portfolio_df['expected_yield'] = from_units_nano_iter(portfolio_df['expected_yield'])
  portfolio_df['current_nkd_currency'] = get_currency(portfolio_df['current_nkd'])
  portfolio_df['current_nkd'] = from_units_nano_iter(portfolio_df['current_nkd'])
  portfolio_df['average_position_price_pt'] = from_units_nano_iter(portfolio_df['average_position_price_pt'])
  portfolio_df['current_price_currency'] = get_currency(portfolio_df['current_price'])
  portfolio_df['current_price'] = from_units_nano_iter(portfolio_df['current_price'])
  portfolio_df['average_position_price_fifo_currency'] = get_currency(portfolio_df['average_position_price_fifo'])
  portfolio_df['average_position_price_fifo'] = from_units_nano_iter(portfolio_df['average_position_price_fifo'])
  portfolio_df['quantity_lots'] = from_units_nano_iter(portfolio_df['quantity_lots'] )

  
  return portfolio_df


# Получить информацию по инструменту через FIGI
def get_instrument_by_figi(TOKEN, FIGI):
  with Client(TOKEN) as client:
    instrument = client.instruments.get_instrument_by(id_type = 1, id = FIGI)
  return pd.DataFrame(instrument.instruments)


# Получить список валют
def get_currencies(TOKEN):
  with Client(TOKEN) as client:
    currencies = client.instruments.currencies(instrument_status = 1)
  return pd.DataFrame(currencies.instruments)



# Получить последнюю цену инструмента
def get_candles(TOKEN, FIGI):
  with Client(TOKEN) as client:
    candles = client.market_data.get_candles(figi = FIGI)
  return candles



# Получить последнюю цену инструмента
def get_last_price(TOKEN, FIGIs):
  with Client(TOKEN) as client:
    price = client.market_data.get_last_prices(figi = FIGIs)
    
  price_df = pd.DataFrame(price.last_prices)
  
  price_df["price"] = from_units_nano_iter(price_df["price"])
  
  return price_df

