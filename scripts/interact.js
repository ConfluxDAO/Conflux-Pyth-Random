async function main() {
  const [deployer] = await ethers.getSigners();

  const RandomNumber = await ethers.getContractFactory("RandomNumber");
  const randomNumber = RandomNumber.attach(
    "0x9807945B3f004B7b9812FDd4E131693176749e12"
  ); // Replace with the actual contract address

  // Request a random number
  const tx = await randomNumber.getRandomNumber({
    value: ethers.parseEther("0.01"),
  }); // Adjust the value based on the required fee
  await tx.wait();
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
