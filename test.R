library(rtipywrap)

accounts <- rti_users_get_accounts()

id <- accounts$accounts[[1]]$id


portfolio <- rti_operations_get_portfolio(id)


exampleMoneyValue <- list(currency='usd', units=-89L, nano=-770000000L)


class(exampleMoneyValue) <- 'tinkoff.invest.schemas.MoneyValue'


saveRDS(exampleMoneyValue, "data/exampleMoneyValue.Rds")


exampleQuotation <- list(units=-8923L, nano=-990000000L)

class(exampleQuotation) <- 'tinkoff.invest.schemas.Quotation'

saveRDS(exampleQuotation, "data/exampleQuotation.Rds")


as.double(exampleQuotation)


x <- readRDS("data/exampleMoneyValue.Rds")

exampleMoneyValue[[1]] |> as.list()




x 



