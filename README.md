# hackUST-2023
Code for Trend Track Transparency
Team One-Hit Wonder

# TrendingTopics Smart Contract

This is a smart contract written in Solidity that allows users to create and vote on topics. It uses the OpenZeppelin library for ERC20 tokens and safe operations.

## Features

- Creation of new topics by the contract owner
- Voting for topics by spending ERC20 tokens
- Withdrawal of tokens by the contract owner

## Requirements

- Solidity >= 0.8.0 <0.9.0
- @openzeppelin/contracts library

## Usage

1. Install the required dependencies by running `npm install @openzeppelin/contracts`.
2. Import the `TrendingTopics.sol` file into your own Solidity project.
3. Deploy the contract to your desired blockchain network (e.g., Ethereum, Binance Smart Chain).
4. Use the `createTopic` function to create new topics.
5. Use the `vote` function to vote for a topic by spending ERC20 tokens.
6. Use the `withdrawTokens` function to withdraw tokens from the contract.

## How it Works
Topic Creation
The contract owner can create a new topic by calling the createTopic function, which takes a title string as a parameter. Each topic is assigned a unique ID and stored in a mapping called topics.

Voting
Users can vote for a topic by calling the vote function and passing in the topicId they wish to vote for. The function requires the user to have enough tokens to pay for the vote, which is set to 1 ETH (or 1 * 10**18 Wei) in the constant VOTE_COST. When a user votes, the contract transfers the VOTE_COST amount of tokens from the user's account to the contract, and increments the vote count for the corresponding topic.

Token Withdrawal
The contract owner can withdraw tokens from the contract at any time by calling the withdrawTokens function and passing in the to address and the amount of tokens to be transferred.

Getting Started
To use this smart contract, you will need an Ethereum wallet and some tokens. You can deploy the contract to a local or test network (e.g., Ganache, Rinkeby, etc.) using a tool like Remix or Truffle.

## Requirements
- An Ethereum wallet (e.g., MetaMask)
- Solidity compiler (e.g., Remix, Truffle, etc.)

## Further Improvements

- Implement pagination for topic retrieval.
- Integrate with decentralized storage solutions (e.g., IPFS) to store topic information.
- Implement a DAO for community governance.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
