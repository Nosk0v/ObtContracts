const SafeMath = artifacts.require("SafeMath.sol");
const BankDeposit = artifacts.require('BankDeposit.sol');

module.exports = function(deployer){
    deployer.deploy(SafeMath);
    deployer.link(SafeMath, BankDeposit);
    deployer.deploy(BankDeposit);
};