// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Amateurtictactoe {

//stores the board positions. 1 corresponds to the first square in the 3 by 3 board,
//2 corresponds to the seconds square in the 3 by 3 board etc.
uint8[9] public boardPositions = [1,2,3,4,5,6,7,8,9];

//stores the player addresses
address[2] public playerIndex;

address public playerOne = playerIndex[0];
address public playerTwo = playerIndex[1];

//Stores number of plays per player to ensure turns
//NBBB: FIND A WAY TO UPDATE THIS MAPPING AFTER EVERY PLAY
mapping(address => uint8) public _numberOfPlays;
//stores the number if the position for if the move has been made or not(i.e 1 equals move made, 0 equals move is valid)
mapping(uint8 => uint8) public _isPositionOpen;

constructor(address _playerOne, address _playerTwo) payable {
    playerOne = _playerOne;
    playerTwo = _playerTwo;
}

modifier onlyPlayers(){
    require(msg.sender == playerOne || msg.sender == playerTwo);
    _;
}

function makeMove(uint8 _move) onlyPlayers public {
    require(checkTurn(msg.sender) == true, "Not your turn");
    require(positionStatus(_move) == true, "Positon Not Valid");
    
}

function checkTurn(address _nextMovePlayer) internal view returns(bool) {
    if (playerOne == _nextMovePlayer && _numberOfPlays[_nextMovePlayer] == _numberOfPlays[playerTwo]) {
         return true;
       } else{return false;}

}

function positionStatus(uint8 _move) internal returns(bool) {
    if(_isPositionOpen[_move] == 1) {
     _isPositionOpen[_move] == 0;
        return false;
    } else{return true;}

}
























}
