# DeTweet smart contract

## Deployment

### Deploying contract to testnet - Ropsten

1. Get a Ropsten network eth address and some eth
   - open metamask extension and select Ropsten test network
   - go to https://faucet.metamask.io/ You should be recognized on the page shortly (user) through metamask.
   - request 1 ether from Ropsten. You will get a tx hash. 
     Click on it to check the transaction status @ https://ropsten.etherscan.io. Waiting time is approx. 30sec.
     Repeat the request for some more eth :)

2. In the project folder run  

   ```$ npm init```  
   
   ```$ npm install truffle-hdwallet-provider --save```
   
3. Sign up to Infura @ https://infura.io/signup
   On the next page, you will find the link to the Ropsten network with your access token as the last segment.
   Add that token to the truffle.js config file, along with the seed words from Metamask.

4. Deploy your smart contract  

   ```$ truffle migrate --network ropsten```
     
   You will get the deployed contract address (ContractName: 0x469e800fdaef46a43b913d4db047be115b290bef)

5. Check that the contract is live on the network by visiting 
   https://ropsten.etherscan.io/address/YourContractAddress


Congratulations!


### Deploy with geth - requires node sync on localhost (too much time/space)

1. Install geth
   - https://github.com/ethereum/go-ethereum  
      
      OSX example:  
      
      ```$ brew tap ethereum/ethereum```
      
      ```$ brew install ethereum```

2. Run geth  

   ```$ geth --testnet account new```
   
   Choose a password, and you will create a new ropsten account.
   
   Run the geth instance with permissions opened up
   
   ```$ geth --testnet --fast --rpc --rpcapi eth,net,web3,personal```  
   
   In a new terminal window, open up the geth console
   
   ```$ geth attach http://127.0.0.1:8545``` 
   
   You will see your ropsten eth address in the console info.
   
   From the geth console, unlock your account so you can spend the ropsten eth
   
   ```$ personal.unlockAccount(eth.accounts[0])```
   
   At this point, you will need to enter your account passphrase you chose when creating the account.
   
   From metamask, transfer some eth to this account address.
   
3. Deploy the contract

    ```$ truffle migrate --network ropsten```
