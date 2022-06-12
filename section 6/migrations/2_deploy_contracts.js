var MyToken = artifacts.require("myToken.sol");

module.exports = function(deployer) {
  deployer.deploy(MyToken,1000000000);
};
