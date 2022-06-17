// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Amateurtictactoe} from "./Amateurtictactoe.sol"; 

contract AmateurTictactoeFactory{

uint[] public boardNumber;

function newGame(address _playerOne, address _playerTwo) external returns(uint256 _boardNumber) {
    _boardNumber = boardNumber.length + 1;
    boardNumber.push(_boardNumber);
    address newGame = new Amateurticktacktoe(address(uint160(_boardNumber)));


}

}
