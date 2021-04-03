/** @format */

const MarkAtToken = artifacts.require("MarkAtToken");

module.exports = async function (deployer) {
	await deployer.deploy(MarkAtToken);
	const erc721 = await MarkAtToken.deployed();
};
