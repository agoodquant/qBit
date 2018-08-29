.qinfra.loadDep[`env;"Q:/qr/env"];
.qinfra.loadDep[`quant;"Q:/qr/quant"];

.qinfra.load["env"];
.qinfra.load["thirdparty"];
.qinfra.load["quant"];
.qinfra.load["util"];


bitmexQuote:.qr.remote.rpc["localhost:26051"] "select from bitmexQuote where date = .z.d-1"
bitstampOrderBookL2:.qr.remote.rpc["localhost:26051"] "select from bitstampOrderBookL2 where date = .z.d-1"

bitmex:select timestamp:"z"$timestamp, bitmex_bid:bidPrice, bitmex_ask:askPrice from bitmexQuote
bitstamp:select timestamp:"p"$timestamp, bitstampPrice:price from bitstampLiveTrades

priceDiff:aj[`timestamp;bitmex;bitstamp]

-10000#update timestamp:"z"$timestamp from priceDiff

.qr.remote.rpc["localhost:26051"] "key `."

select timestamp, bitmex_bid from bitmex