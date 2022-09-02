# Загружаем библиотеки 
from tinkoff.invest import Client

# Получить информацию по инструменту через FIGI
def client_instruments_get_instrument_by(TOKEN, FIGI):
  with Client(TOKEN) as client:
    instrument = client.instruments.get_instrument_by(id_type = 1, id = FIGI)
  return instrument
