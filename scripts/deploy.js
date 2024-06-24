async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  // eSpace Testnet
  const entropyAddress = "0xdF21D137Aadc95588205586636710ca2890538d5"; // Replace with the actual Entropy contract address

  const RandomNumber = await ethers.getContractFactory("RandomNumber");
  const randomNumber = await RandomNumber.deploy(entropyAddress);

  await randomNumber.waitForDeployment(); // Ensure the contract is deployed

  console.log("RandomNumber contract deployed to:", randomNumber.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
