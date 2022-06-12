var CCToken = artifacts.require("CCToken.sol");

module.exports = async function(deployer) {
  await deployer.deploy(CCToken,1000000000);
};
