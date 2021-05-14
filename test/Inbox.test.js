const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const {interface, bytecode} = require('../compile');
const web3 = new Web3(ganache.provider());

describe('Inbox', () => {
    let inbox = null, account = null;

    before(async () => {
        const accounts = await web3.eth.getAccounts();
        account = accounts[0];
        inbox = await new web3.eth.Contract(JSON.parse(interface)).deploy({data: bytecode, 
            arguments: ["Hi there!"]}).send({from: account, gas: '1000000'});
    });
    it('deploy a contract', async () => {
        assert.ok(inbox.options.address);
    });

    it('has default message', async () => {
        const actualMessage = await inbox.methods.message().call();
        assert.strictEqual("Hi there!", actualMessage);
    }); 

    it('can update the message', async () => {
        await inbox.methods.setMessage("bye").send({from: account});
        const actualMessage = await inbox.methods.message().call();
        assert.strictEqual("bye", actualMessage);
    });
});