// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Amateurtictactoe} from "./Amateurtictactoe.sol"; 

contract AmateurTictactoeFactory{


function newGame(address _playerOne, address _playerTwo) external returns(address gameInstance) {
     require(_playerOne != _playerTwo, 'Invalid Players');
     

}
