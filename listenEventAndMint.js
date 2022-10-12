const { ethers } = require("hardhat");
require("dotenv").config({ path: ".env" });

export default async function listenEventAndMint(_contractAddr, _mintAddress) {
  // Set Provider
  const rpc = "YOUR RPC";
  const provider = new ethers.providers.JsonRpcProvider(rpc);

  // Contract Instance
  const contractInstance = new ethers.Contract(
    contractAddress,
    contractABI,
    provider
  );

  // For view function
  var result = await contractInstance.getValue();

  // on() listen for an event
  // the second argument in on() is a callback function to be called when the avent occurs in the entire blockchain
  // to restrict the event for a specific contract it's necessary to use a filter

  filter = {
    address: _contractAddr,
    topics: [
      // the name of the event, parnetheses containing the data type of each event, no spaces
      utils.id("Transfer(address,address,uint256,string)"),
    ],
  };
  //function needs to be improved
  provider.on(filter, async function mint() {
    console.log(filter);
    var result = await contractInstance.safeMint(_addr);
  });
}
