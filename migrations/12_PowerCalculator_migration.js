const PowerCaluclator = artifacts.require("PowerCalculator");

module.exports = function(deployer){
    deployer.deploy(PowerCaluclator);
};