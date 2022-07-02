var CCToken = artifacts.require("CCToken.sol");


require ('dotenv').config({path:'../.env'});
const chai = require ("./setup_chai.js");

const BN = web3.utils.BN;
const expect = chai.expect;

contract ("CCToken test", async (accounts) => {
    const [deployerAccount, anotherAccount] = accounts;

     //Hook funtion
    beforeEach(async()=>{
        this.CCToken = await CCToken.new(process.env.INITIAL_TOKENS);
    })


    it("all token should be in first account", async() => {
        let instance = await this.CCToken;
	    let totalSupply = await instance.totalSupply();
	    expect(await instance.balanceOf(accounts[0])).to.be.a.bignumber.equal(totalSupply);
    });
    it("is possible to send tokens between accounts", async() => {
        const sendToken = 1;
        let instance = await this.CCToken;
	    let totalSupply = await instance.totalSupply();

	    await expect(instance.balanceOf(deployerAccount)).to.eventually.be.a.bignumber.equal(totalSupply);
        await expect(instance.transfer(anotherAccount,sendToken)).to.eventually.be.fulfilled;
        await expect(instance.balanceOf(deployerAccount)).to.eventually.be.a.bignumber.equal(totalSupply.sub(new BN(sendToken)));
        await expect(instance.balanceOf(anotherAccount)).to.eventually.be.a.bignumber.equal(new BN(sendToken));
    });
    it("is possible to send more tokens than available in total", async() => {
        let instance = await this.CCToken;
	    let balanceOfDeployer = await instance.balanceOf(deployerAccount);

	    await expect(instance.transfer(anotherAccount,new BN(balanceOfDeployer +1))).to.eventually.be.rejected;
        await expect(instance.balanceOf(deployerAccount)).to.eventually.be.a.bignumber.equal(balanceOfDeployer);
        //await  expect(instance.balanceOf(anotherAccount)).to.eventually.be.a.bignumber.equal(new BN(sendToken);
    });
})

