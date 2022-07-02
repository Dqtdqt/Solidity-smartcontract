const { default: Web3 } = require("web3");

var CCToken = artifacts.require("CCToken.sol");
var MyTokenSale = artifacts.require("MyTokenSale.sol");
var KycContract = artifacts.require("KycContract.sol");

require ('dotenv').config({path:'../.env'});
//console.log(process.env);

module.exports = async function(deployer) {
  //console.log(deployer);
  let addr = await web3.eth.getAccounts();

  await deployer.deploy(CCToken, process.env.INITIAL_TOKENS);
  await deployer.deploy(KycContract);
  await deployer.deploy(MyTokenSale,1, addr[0],CCToken.address,KycContract.address);

  let tokenInstance = await CCToken.deployed();
  await tokenInstance.transfer(MyTokenSale.address,process.env.INITIAL_TOKENS);
};
