// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/MiniRaffle.sol";

contract MiniRaffleTest is Test {
    MiniRaffle raffle;

    address player1 = address(1);
    address player2 = address(2);
    address player3 = address(3);

    function setUp() public {
        raffle = new MiniRaffle();

        // Give fake ETH to players
        vm.deal(player1, 10 ether);
        vm.deal(player2, 10 ether);
        vm.deal(player3, 10 ether);
    }

    function testPlayersCanEnter() public {
        vm.prank(player1);
        raffle.enter{value: 1 ether}();

        vm.prank(player2);
        raffle.enter{value: 1 ether}();

        assertEq(raffle.getPlayersCount(), 2);
    }

    function testWinnerGetsAllETH() public {
        vm.prank(player1);
        raffle.enter{value: 10 ether}();

        vm.prank(player2);
        raffle.enter{value: 10 ether}();

        vm.prank(player3);
        raffle.enter{value: 10 ether}();

        uint256 prize = address(raffle).balance;

        uint256 bal1 = player1.balance;
        uint256 bal2 = player2.balance;
        uint256 bal3 = player3.balance;

        raffle.pickWinner();

        // Contract must be empty
        assertEq(address(raffle).balance, 0);

        // One of them must have received the prize
        bool someoneWon = player1.balance == bal1 + prize ||
            player2.balance == bal2 + prize ||
            player3.balance == bal3 + prize;

        assertTrue(someoneWon);

        // Players reset
        assertEq(raffle.getPlayersCount(), 0);
    }
}
