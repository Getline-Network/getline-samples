var EscrowLib = artifacts.require("./EscrowLib.sol");
var Escrow = artifacts.require("./Escrow.sol");

module.exports = function(deployer) {
  deployer.deploy(EscrowLib);
  deployer.link(EscrowLib, Escrow);
};
