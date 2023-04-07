
// npm install @openzeppelin/contracts

// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.1/contracts/token/ERC20/IERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.1/contracts/token/ERC20/utils/SafeERC20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.1/contracts/utils/Counters.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.1/contracts/access/Ownable.sol";


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TrendingTopics is Ownable {
    using SafeERC20 for IERC20;
    using Counters for Counters.Counter;

    IERC20 public token;
    Counters.Counter private _topicIds;

    uint256 public constant VOTE_COST = 1 * 10**18;

    struct Topic {
        uint256 id;
        string title;
        uint256 votes;
    }

    mapping(uint256 => Topic) public topics;

    event TopicCreated(uint256 indexed topicId, string title);
    event Voted(uint256 indexed topicId, address indexed voter);

    constructor(address _token) {
        token = IERC20(_token);
    }

    function createTopic(string memory title) public onlyOwner {
        _topicIds.increment();
        uint256 newTopicId = _topicIds.current();
        topics[newTopicId] = Topic(newTopicId, title, 0);
        emit TopicCreated(newTopicId, title);
    }

    function vote(uint256 topicId) public {
        require(topics[topicId].id != 0, "Topic not found");
        require(token.balanceOf(msg.sender) >= voteCost, "Not enough tokens to vote");

        token.safeTransferFrom(msg.sender, address(this), VOTE_COST);
        topics[topicId].votes ++;
        emit Voted(topicId, msg.sender);
    }

    function withdrawTokens(address to, uint256 amount) public onlyOwner {
        token.safeTransfer(to, amount);
    }

    function getTopicCount() public view returns (uint256) {
        return _topicIds.current();
    }

    receive() external payable {
        revert("Do not send ether directly to this contract.");
    }

    fallback() external payable {
        revert("Do not send ether directly to this contract.");
    }
}


// This smart contract example uses the OpenZeppelin library for ERC20 tokens and safe operations. It provides functions for creating new topics, voting for topics, and withdrawing the tokens by the contract owner.

// For a more complete and robust implementation, additional features like pagination for topic retrieval, integration with decentralized storage solutions (e.g., IPFS), and implementation of a DAO for community governance should be considered.

