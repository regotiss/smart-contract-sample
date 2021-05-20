const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode} = require('./compile'); 

const provider = new HDWalletProvider(process.env.HD_WALLET_PASSWORD, process.env.ETH_NETWORK_URL);
const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    account = accounts[0];  
    console.log('Attempting to deploy smart contract from account ', account);
    const result = await new web3.eth.Contract(JSON.parse(interface)).deploy({data: bytecode, 
        arguments: ["Hi there!"]}).send({from: account, gas: '1000000'});

    console.log('Contract deployed to ', result.options.address);    
}

deploy();