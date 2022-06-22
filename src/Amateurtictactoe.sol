// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Amateurtictactoe {
  /// @title An unoptimized yet functional Tic tac toe game
  /// @author SamaterPhi7
  /// @notice This is a Tic tac toe game
  /// @dev this contract is unoptimized intentionally

//stores the board positions. 1 corresponds to the first square in the 3 by 3 board,
//2 corresponds to the seconds square in the 3 by 3 board etc.
uint8[9] public boardPositions;
//Ensures first player is playerOne
uint8 public makeMoveCounter = 0;

    
//stores the player addresses
address[2] public playerIndex;

address public playerOne = playerIndex[0];
address public playerTwo = playerIndex[1];

enum AllowedPlays{X, O}

//Stores number of plays per player to ensure turns
//NBBB: FIND A WAY TO UPDATE THIS MAPPING AFTER EVERY PLAY
mapping(address => uint8) public _numberOfPlays;
//stores the number if the position for if the move has been made or not(i.e 1 equals move made, 0 equals move is valid)
mapping(uint8 => uint8) public _isPositionOccupied;


constructor(address _playerOne, address _playerTwo) payable {
    playerOne = _playerOne;
    playerTwo = _playerTwo;
    
}

modifier onlyPlayers(){
    require(msg.sender == playerOne || msg.sender == playerTwo);
    _;
}

modifier onlyEmptyPosition(uint8 _move){
    require(_isPositionOccupied[_move] == 0, "Move not Valid");
    _;
}

modifier onlyPlayerOneStarts(){
    if(makeMoveCounter == 0){
        require(msg.sender == playerOne, "Not Player One");
    }
    _;
}

function makeMove(uint8 _move) onlyPlayers onlyPlayerOneStarts onlyEmptyPosition(_move) public {
    require(checkTurn(msg.sender) == true, "Not your turn");
    require(_move >= 0 && _move <= 8, "Move Not Valid");
    makeMoveCounter++;

    //update the position to occupied 
    _isPositionOccupied[_move] = 1;

    //assigning its value depending on user
    //If playerOne then assign X. If playerTwo then assing O.
    if(msg.sender == playerOne) {
        boardPositions[_move] = uint8(AllowedPlays.X);
        _numberOfPlays[playerOne]++;

        if(checkWinner() == uint8(AllowedPlays.X)) {
            selfdestruct(payable(playerOne));
            }

    } else{
        boardPositions[_move] = uint8(AllowedPlays.O);
        _numberOfPlays[playerTwo]++;
        if(checkWinner() == uint8(AllowedPlays.O)) {
            selfdestruct(payable(playerTwo));
            }

    }

    
}

function checkTurn(address _nextMovePlayer) internal view returns(bool) {
    if (playerOne == _nextMovePlayer && _numberOfPlays[_nextMovePlayer] == _numberOfPlays[playerTwo]) {
         return true;
       } else if (playerTwo == _nextMovePlayer && _numberOfPlays[_nextMovePlayer] < _numberOfPlays[playerOne]) {
         return true;
       } 
       else{return false;}

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
