var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "YourInfuraApiKey";
var mnemonic = "meta mask seed words for your address";

module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*"
        },
        ropsten: {
            provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
            network_id: 3,
            gas: 4300000,
            gasPrice: 20000000000
        }
    }
};