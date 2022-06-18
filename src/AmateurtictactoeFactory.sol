// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Amateurtictactoe} from "./Amateurtictactoe.sol"; 

contract AmateurTictactoeFactory{

Amateurtictactoe amateurtictactoe;

function newGame(address _playerOne, address _playerTwo) external returns(address gameInstance) {
     require(_playerOne != _playerTwo, "Invalid Players");
     require(_playerOne != address(0) && _playerTwo != address(0), "Invalid Players");
     
     amateurtictactoe = new Amateurtictactoe(_playerOne, _playerTwo);

}
}
