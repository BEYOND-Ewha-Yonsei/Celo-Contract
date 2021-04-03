/** @format */
const MarkAtToken = artifacts.require("MarkAtToken");

const TOKENID = 0;
module.exports = async (callback) => {
	const mat = await MarkAtToken.deployed();
	console.log("Let's set the tokenURI of your characters");
	const tx = await mat.setTokenURI(
		0,
		"https://ipfs.io/ipfs/QmZBvndhGwA4QVMt8RkwdF1ex5SRLyXPbrB1U1ErNR1JvL?filename=footprint.json"
	);
	console.log("ㅅㅂ", tx);
	callback(tx.tx);
};
