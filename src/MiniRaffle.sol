// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MiniRaffle {
    address payable[] public players;

    // Anyone can enter by sending ETH
    function enter() public payable {
        require(msg.value > 0, "Send ETH to enter");
        players.push(payable(msg.sender));
    }

    // Pick a random winner and send them all ETH
    function pickWinner() public {
        require(players.length > 0, "No players");

        // Pseudo-random (unsafe for mainnet, fine for learning)
        uint256 random = uint256(
            keccak256(
                abi.encodePacked(
                    block.timestamp,
                    block.prevrandao,
                    players.length
                )
            )
        );

        uint256 winnerIndex = random % players.length;
        address payable winner = players[winnerIndex];

        // Send all ETH to winner
        (bool success, ) = winner.call{value: address(this).balance}("");
        require(success, "Transfer failed");

        // Reset players
        delete players;
    }

    function getPlayersCount() public view returns (uint256) {
        return players.length;
    }
}
