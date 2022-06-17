// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Amateurtictactoe {

//stores the board positions. 1 corresponds to the first square in the 3 by 3 board,
//2 corresponds to the seconds square in the 3 by 3 board etc.
uint8[9] public boardPositions = [1,2,3,4,5,6,7,8,9];
//stores all the possible win combinations
mapping(uint8 => uint8[8]) public _winCombos;
    
//stores the player addresses
address[2] public playerIndex;

address public playerOne = playerIndex[0];
address public playerTwo = playerIndex[1];

uint8[5] public playerOneMoves;
uint8[5] public playerTwoMoves;
uint8 public ptr1 = 0;
uint8 public ptr2 = 0;

//Stores number of plays per player to ensure turns
//NBBB: FIND A WAY TO UPDATE THIS MAPPING AFTER EVERY PLAY
mapping(address => uint8) public _numberOfPlays;
//stores the number if the position for if the move has been made or not(i.e 1 equals move made, 0 equals move is valid)
mapping(uint8 => uint8) public _isPositionOpen;

//stores the possible win combos


constructor(address _playerOne, address _playerTwo) payable {
    playerOne = _playerOne;
    playerTwo = _playerTwo;
    
    _winCombos[0] = [1,2,3];
    _winCombos[1] = [4,5,6];
    _winCombos[2] = [7,8,9];
    _winCombos[3] = [3,5,7];
    _winCombos[4] = [1,4,7];
    _winCombos[5] = [2,5,8];
    _winCombos[6] = [3,6,9];
    _winCombos[7] = [1,5,9];
    

}

modifier onlyPlayers(){
    require(msg.sender == playerOne || msg.sender == playerTwo);
    _;
}

function makeMove(uint8 _move) onlyPlayers public {
    require(checkTurn(msg.sender) == true, "Not your turn");
    require(positionStatus(_move) == true, "Position Not Valid");
    
    if(msg.sender == playerOne) {
       playerOneMoves[ptr1] = _move;
       ptr1++;
       checkWinner(playerOneMoves);
     } else{
        playerTwoMoves[ptr2] = _move;
        ptr2++;
        checkWinner(playerTwoMoves);
     }
}

function checkTurn(address _nextMovePlayer) internal view returns(bool) {
    if (playerOne == _nextMovePlayer && _numberOfPlays[_nextMovePlayer] == _numberOfPlays[playerTwo]) {
         return true;
       } else{return false;}

}

function positionStatus(uint8 _move) internal returns(bool) {
    if(_isPositionOpen[_move] == 0) {
     _isPositionOpen[_move] == 1;
        return true;
    } else{return false;}
}

function checkWinner(uint8[5] storage _playersCombos)internal pure returns(bool) {
//if a winner is found, then self destruct and print Game Over
//iterate over the elements of each _winCombos and match with elements of playerMoves
if(tx.origin == playerOne)   //Zackyyyyyyyyyyyyy
    
}


























}
