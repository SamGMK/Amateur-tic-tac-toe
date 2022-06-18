// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Amateurtictactoe {

//stores the board positions. 1 corresponds to the first square in the 3 by 3 board,
//2 corresponds to the seconds square in the 3 by 3 board etc.
uint8[9] public boardPositions;

//stores all the possible win combinations
mapping(uint8 => uint8[8]) public _winCombos;
    
//stores the player addresses
address[2] public playerIndex;

address public playerOne = playerIndex[0];
address public playerTwo = playerIndex[1];

//checks if the board position is empty or occupied
//0 if empty and 1 if occupied
mapping(uint8 => uint8) public _positionChecker;

enum AllowedPlays{X, O}
AllowedPlays allowedPlays;


//Stores number of plays per player to ensure turns
//NBBB: FIND A WAY TO UPDATE THIS MAPPING AFTER EVERY PLAY
mapping(address => uint8) public _numberOfPlays;
//stores the number if the position for if the move has been made or not(i.e 1 equals move made, 0 equals move is valid)
mapping(uint8 => uint8) public _isPositionOpen;

//stores the possible win combos


constructor(address _playerOne, address _playerTwo) payable {
    playerOne = _playerOne;
    playerTwo = _playerTwo;
    
}

modifier onlyPlayers(){
    require(msg.sender == playerOne || msg.sender == playerTwo);
    _;
}

modifier onlyEmptyPosition(uint8 _move){
    require(_isPositionOpen[_move] == 0, "Move not Valid");
    _;
}

function makeMove(uint8 _move) onlyPlayers onlyEmptyPosition(_move) public {
    require(checkTurn(msg.sender) == true, "Not your turn");
    require(positionStatus(_move) == true, "Position Not Valid");
    require(_move >= 0 && _move <= 8, "Move Not Valid");

    //update the position to occupied 
    _isPositionOpen[_move] = 1;

    //assigning its value depending on user
    //If playerOne then assign X. If playerTwo then assing O.
    if(msg.sender == playerOne) {
        boardPositions[_move] = uint8(AllowedPlays.X);

        if(checkWinner() == uint8(AllowedPlays.X)) {
            selfdestruct(payable(playerOne));
            }

    } else{
        boardPositions[_move] = uint8(AllowedPlays.O);
        if(checkWinner() == uint8(AllowedPlays.O)) {
            selfdestruct(payable(playerTwo));
            }

    }

    
}

function checkTurn(address _nextMovePlayer) internal view returns(bool) {
    if (playerOne == _nextMovePlayer && _numberOfPlays[_nextMovePlayer] == _numberOfPlays[playerTwo]) {
         return true;
       } else{return false;}

}

function positionStatus(uint8 _move) internal view returns(bool) {
    if(_isPositionOpen[_move] == 0) {
     _isPositionOpen[_move] == 1;
       return true;
    } else{return false;}
}

function checkWinner()internal view returns(uint8) {
//if a winner is found, then self destruct and print Game Over
if(boardPositions[0] == boardPositions[1] && boardPositions[0] == boardPositions[2]) {
    return boardPositions[0];
} 
if(boardPositions[3] == boardPositions[4] && boardPositions[3] == boardPositions[5]) {
    return boardPositions[3];
} 
if(boardPositions[6] == boardPositions[7] && boardPositions[6] == boardPositions[8]) {
    return boardPositions[6];
} 
if(boardPositions[0] == boardPositions[3] && boardPositions[0] == boardPositions[6]) {
    return boardPositions[0];
} 
if(boardPositions[1] == boardPositions[4] && boardPositions[1] == boardPositions[7]) {
    return boardPositions[1];
} 
if(boardPositions[2] == boardPositions[5] && boardPositions[2] == boardPositions[8]) {
    return boardPositions[2];
} 
if(boardPositions[0] == boardPositions[4] && boardPositions[0] == boardPositions[8]) {
    return boardPositions[0];
} 
if(boardPositions[2] == boardPositions[4] && boardPositions[2] == boardPositions[6]) {
    return boardPositions[2];
} 
    
}


























}
