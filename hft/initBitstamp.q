// init script of loader
.qinfra.load["env"];
.qinfra.load["thirdparty"];
.qinfra.load["util"];

.qr.setParams[
    .qr.param[`rdb; `$"localhost:26041"],
    .qr.param[`hdb; `$"localhost:26051"],
    .qr.param[`hdbwriter; `$"localhost:26052"]
    ];

.qinfra.load["exchange"];
.qinfra.include["tickerplant";"loader.q"];

.qbit.loader.init[
    .qr.type.toString .qr.getParam`rdb;
    .qr.type.toString .qr.getParam`hdb;
    .qr.type.toString .qr.getParam`hdbwriter
    ];

.qr.setSev[`INFO];

//bitstamp
.qbit.bitstamp.sub[];
.qbit.bitstamp.orderbook[1b;`btcusd];
.qbit.bitstamp.orderbookFull[1b;`btcusd];
.qbit.bitstamp.liveorders[1b;`btcusd];
.qbit.bitstamp.livetrades[1b;`btcusd];