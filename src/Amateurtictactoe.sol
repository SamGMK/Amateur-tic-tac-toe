// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Amateurtictactoe {

uint8[9] boardPositions = [1,2,3,4,5,6,7,8,9];



function makeMove(uint8 _position) public {
    require(checkTurn(msg.sender) == true, "Not your turn");
    require(positionStatus(_position) == false, "Positon Not Valid");
    
}

function checkTurn(address _player) internal returns(bool) {
   if(player1Plays == player2Plays)
}

function positionStatus(uint8 _position) internal returns(bool) {

}






















}
