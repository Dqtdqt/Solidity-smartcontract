var CCToken = artifacts.require("CCToken.sol")
var MyTokenSale = artifacts.require("MyTokenSale.sol");
var KycContract = artifacts.require("KycContract.sol");


require ('dotenv').config({path:'../.env'});
const chai = require ("./setup_chai.js");

const BN = web3.utils.BN;
const expect = chai.expect;

contract ("MyTokenSale test", async (accounts) => {
    const [deployerAccount, anotherAccount] = accounts;

     //Hook funtion
    //beforeEach(async()=>{
        //this.CCToken = await CCToken.new(process.env.INITIAL_TOKENS);
    //})


    //it("all token should be empty in first account", async() => {
    //    let instance = await CCToken.deployed();
	    //let totalSupply = await instance.totalSupply();
	//    expect(await instance.balanceOf(deployerAccount)).to.be.a.bignumber.equal(new BN(0));
    //});
    //it("all tokens should be in the TokenSale Smart contract by default", async() => {
    //    let instance = await CCToken.deployed();
    //    let totalSupply = await instance.totalSupply();

    //    let balanceOfTKS = await instance.balanceOf(MyTokenSale.address);
    //    await expect (balanceOfTKS).to.be.a.bignumber.equal(totalSupply);
    //});
    //it("should be possible to buy one token by simpy sending ether to the smart contract", async() => {
      //  let instance = await CCToken.deployed();
        //let TokenSaleInstance = await MyTokenSale.deployed();

        //let balanceBefore = await instance.balanceOf.call(anotherAccount);
        //await expect (TokenSaleInstance.sendTransaction({from: anotherAccount, value: web3.utils.toWei("1","wei")}));
        //await expect (balanceBefore + 1).to.be.bignumber.equal(await instance.balanceOf.call(anotherAccount));
    //});
    it ("can't possible to buy one token if you're not in whitelist", async ()=>{
        let instance = await CCToken.deployed();
        let TokenSaleInstance = await MyTokenSale.deployed();
        let balanceBefore = await instance.balanceOf.call(anotherAccount);

        await expect(TokenSaleInstance.sendTransaction({from:anotherAccount, value: web3.utils.toWei("1","wei")})).to.be.rejected;
        await expect(balanceBefore).to.be.bignumber.equal(await instance.balanceOf.call(anotherAccount));
    })
    it ("shoulb be possible to buy one token by simply sending ether to the smart contract after adding to whitelist", async ()=>{
        let instance = await CCToken.deployed();
        let tokenSaleInstance = await MyTokenSale.deployed();
        let balanceBefore = await instance.balanceOf.call(anotherAccount);

        let KycContractInstance = await KycContract.deployed();
        await KycContractInstance.setKyc(anotherAccount);
        
        await expect(tokenSaleInstance.sendTransaction({form: anotherAccount, value: web3.utils.toWei("1","wei")})).to.be.fulfilled;
        await expect(balanceBefore+1).to.be.bignumber.equal(await instance.balanceOf.call(anotherAccount));
    })
})

