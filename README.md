# Ethereum Dapp Demo

Hi! This repo contains a blockchain demo that uses a basic smart contract to manage a pet adoption agency. A deployed demo can be found [here](https://src-teal.now.sh/).

## Required Tools

1. Download ["MetaMask"](https://chrome.google.com/webstore/search/metamask) from the extensions section of your Chrome/Firefox/Brave browser.

*Note: Write down or copy+paste your 12 word Mnemonic phrase because you will need it*

2. Create an account at [Infura.io](https://infura.io/), verify email, and create a new project to obtain your "PRODUCT ID". Save this for later.

3. Install [Ganache](https://www.trufflesuite.com/ganache), your localhost blockchain 

4. Install [NVM](https://github.com/nvm-sh/nvm) (Node Version Manager) if you do not have nodeJS version 10.0.0 or higher. 
5. `source ~/.bashrc`
6. `nvm install lts/dubnium`

7. Install Yarn Package Manager
8. `npm install -g yarn`

9. Install [Truffle Suite](https://www.trufflesuite.com/)

10. `npm install -g truffle`   


# Setup your local blockchain

We are going to run the project locally, but first we have to start up our local blockchain.

 1. Open the Ganache Program you downloaded and click Quick Start

2. Your RPC Server should read "HTTP://127.0.0.1:7545" from the sub-navigation
 
 3. Copy your RPC server information to your clipboard and open MetaMask browser extension.
 
 4. Click the Mainnet dropdown at the top and click Custom RPC at the bottom of the list. Enter any name for the network in the first field, and paste the url from Ganache into the "New RPC" field. Click save.
 
 5. Go back to Ganache and make sure you are on the main screen with the account balances. Click the key icon of the first account on the right.
 
 6. Copy the Private Key being displayed inside the modal
 
 7. Go back to MetaMask, make sure you have the Ganache Network (port 7545) selected,  click the profile icon on the right and click "IMPORT ACCOUNT". 
 
 8. Paste the Private Key from Ganache into this field, and make sure the dropdown select reads "PRIVATE KEY". Click Import. Switch to that account. You should see your account balance match the one you imported from Ganache.
 
 9. Congratulations. Your blockchain and crypto wallet is now ready. 

## Inside the project folder

**Assuming you cloned this repository already, you should now be at the root level of the project folder.**

    yarn install
*Everything should install successfully. If you get red errors, verify that you are using nodeJS version 10+*

**Create your .env file**

    touch .env
**Copy and paste the contents of .env.example into your new .env file. Replace the value for INFURA_KEY with your PROJECT ID you copied from infura. Paste your MNEMONIC phrase you copied from MetaMask into the string quotes and save the .env file.**

*This enables you to successfully deploy your smart contract to the ethereum testnet later on. It is important.*

**Inside the root of the project folder run:**

    truffle test

**All 3 tests should pass.**

    truffle compile
   *Your solidity code should compile successfully.*

    truffle migrate

*This writes your smart contract to your local blockchain. Check Ganache to verify.*

**Open a new terminal window or tab.**

    yarn dev

*This should start your localhost up for your frontend at localhost:3000*.
![enter image description here](https://res.cloudinary.com/ddxzdm8df/image/upload/v1582895814/Screenshot_from_2020-02-28_08-15-27_xorpvw.png)

**Try adopting a few new pets. The buttons should auto-refresh once each transaction is confirmed.**

Congratulations, you successfully setup a blockchain decentralized application!

## Deploying to Ethereum's TestNet

This is a huge deal now! Deploying your smart contract to the Ropsten Testnet is a live test environment that simulates the mainnet - however, it is still a real blockchain that is publicly accessible to the public.

 - **Go to your MetaMask and switch to the "Ropsten" Network**
 - **Copy your current wallet address to the clipboard**
 - **Go grab some test Ether from [the faucet](https://faucet.metamask.io/) - 1-2 ETH should be enough**
 
**After you get 1-2 ETH deposited into your Ropsten wallet, go back to the root project directory**

    truffle migrate --network ropsten
*Deploying to the Ropsten testnet will be slower than using your personal blockchain because it is public. Deploying contracts is not free so you will have a little less Ether*.

**Now, stop your frontend from running with CMD/CTRL + C**

Globally install a package called [now](https://github.com/zeit/now):

    npm install -g now

**Navigate to the /src folder:**

    cd src

**Run this command to create a symlink to Adoption.json located in build/contracts:**

    ln -s ../build/contracts/Adoption.json
Next, we will run the now command to deploy our frontend to an instant CDN/static web server for free:

    now --prod

*If you do not have an account, it will ask you a series of questions. It is faster to just use Github OAuth*

**Now should return your production URL, and an inspection url to manage**

You should be able to use the Dapp from anywhere with this new URL, which can be added to any domain name with a simple CNAME DNS record. The application should work with your local Ganache blockchain, as well as the ropsten network. You can test this by switching networks with your MetaMask browser extension.

Congratulations, you deployed a Dapp to the Ethereum blockchain. It is always important to deploy here first to test your application rigorously before attempting to publish it to the mainnet. Mistakes can be expensive.

## Bonus Step

There will come a time when you run out of pets to adopt. You can reset all adoptions on your localhost with:

    truffle migrate --reset

You can also reset the testnet with another command:

    truffle migrate --network ropsten --reset

There are also shortcuts located inside the package.json file. That concludes this demonstration!
