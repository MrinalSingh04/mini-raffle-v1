# Mini Raffle Smart Contract 🎟️

A simple Ethereum smart contract that lets players enter a raffle by sending ETH. A winner is picked randomly, and they receive all the ETH in the contract.

This project is part of my #360DaysOfCoding journey, focused on Web3 and Solidity smart contracts.

---

## Features ✅

- Enter the raffle by sending ETH  
- Pick a random winner (pseudo-random, for learning purposes)  
- Track number of players  
- Fully tested using **Foundry**  
- Deploy locally with **Anvil** and interact using **Cast**  

---

## Tech Stack 🛠️

- **Solidity 0.8.19** – Smart contract language  
- **Foundry** – Testing & deployment framework  
- **Anvil** – Local Ethereum node  
- **Cast** – CLI for sending transactions & calling contract functions  

---

## Why This Project? 🤔

This project is beginner-friendly and teaches:

- Using `address payable` and handling ETH transfers  
- Writing and testing smart contracts locally  
- Deploying contracts and interacting with them via CLI  
- Understanding pseudo-randomness in Ethereum (safe for learning, not production)  

It’s a simple but powerful way to get started with Ethereum development.

---

## Project Structure 📂

mini-raffle-v1/
│
├─ contracts/
│ └─ MiniRaffle.sol # Smart contract code
├─ script/
│ └─ DeployMiniRaffle.s.sol # Deployment script
├─ test/
│ └─ MiniRaffle.t.sol # Foundry tests
├─ .gitignore
├─ foundry.toml
└─ README.md

### 2. Compile & Test
forge build
forge test

### 3. Start Local Ethereum Node (in another terminal)
anvil

### 4. Deploy Contract Locally
forge script script/DeployMiniRaffle.s.sol \
--rpc-url http://127.0.0.1:8545 \
--broadcast \
--private-key <YOUR_PRIVATE_KEY>

### 5. Interact with Contract Using Cast

-> Enter the Raffle

cast send <CONTRACT_ADDRESS> "enter()" \
--value 1ether \
--private-key <YOUR_PRIVATE_KEY> \
--rpc-url http://127.0.0.1:8545


-> Pick a Winner

cast send <CONTRACT_ADDRESS> "pickWinner()" \
--private-key <YOUR_PRIVATE_KEY> \
--rpc-url http://127.0.0.1:8545


-> Check Players Count

cast call <CONTRACT_ADDRESS> "getPlayersCount()(uint256)" \
--rpc-url http://127.0.0.1:8545

## Results 🎉

Successfully deployed on a local Ethereum node
Multiple accounts entered the raffle
Winner picked automatically, ETH transferred
Tested & verified using Foundry