# Официальнео python API https://github.com/Tinkoff/invest-python 


# Получить список валют
def client_instruments_currencies(TOKEN):
  with Client(TOKEN) as client:
    currencies = client.instruments.currencies(instrument_status = 1)
  return pd.DataFrame(currencies.instruments)


