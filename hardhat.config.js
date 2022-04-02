require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: "https://rinkeby.infura.io/v3/f2cc3e36c65c47b2a6ade04f6fc9fb05", //Infura url with projectId
      accounts: ["5c5ff0bc6d7d4e5426dbc1f4f18797b0589db6426de035cd9fef844415bf7ea5"] // add the account that will deploy the contract (private key)
    },
    poly: {
      url: "https://rpc-mumbai.matic.today", //Infura url with projectId
      accounts: ["5c5ff0bc6d7d4e5426dbc1f4f18797b0589db6426de035cd9fef844415bf7ea5"] // add the account that will deploy the contract (private key)
    },
  }
};
