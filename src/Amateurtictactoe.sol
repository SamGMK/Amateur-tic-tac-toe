// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Amateurtictactoe {

uint8[9] boardPositions = [1,2,3,4,5,6,7,8,9];

struct Players{
    struct PlayerOne{
        address playerOne;
        mapping(address => uint8)_PlayerOneNumberOfPlays;
    }
    struct PlayerTwo{
        address playerTwo;
        mapping(address => uint8)_PlayerTwoNumberOfPlays;
    }
}

function makeMove(uint8 _move) public {
    require(checkTurn(msg.sender) == true, "Not your turn");
    require(positionStatus(_move) == false, "Positon Not Valid");
    
}

function checkTurn(address _player) internal returns(bool) {
   
}

function positionStatus(uint8 _movePosition) internal returns(bool) {

}






















}
