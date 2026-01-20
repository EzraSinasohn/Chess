class Bishop extends Piece {
  public Bishop(int f, int r, boolean w) {
    super(f, r, w);
    file = f;
    rank = r;
    x = file*100;
    y = rank*100;
    white = w;
    board[toI(file, rank)].occupied = true;
  }
  
  public void show() {
    if(white) {
      if(!held) {
        image(lightBishop, file*100, rank*100, 100, 100);
      } else {
        image(lightBishop, x-25, y-25, 100, 100);
      }
    } else {
      if(!held) {
        image(darkBishop, file*100, rank*100, 100, 100);
      } else {
        image(darkBishop, x-25, y-25, 100, 100);
      }
    }
  }
  
  public void legalMoves() {
    if(toI(file, rank)+9 < 64) {
      for(int i = toI(file, rank)+9; i < 64; i += 9) {
        if(board[i].occupied || board[i-9].rank == board[i].rank-2) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
    if(toI(file, rank)-9 >= 0) {
      for(int i = toI(file, rank)-9; i >= 0; i -= 9) {
        if(board[i].occupied || board[i+9].rank == board[i].rank+2) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
    if(toI(file, rank)+7 < 64) {
      for(int i = toI(file, rank)+7; i < 64; i += 7) {
        if(board[i].occupied || board[i-7].rank == board[i].rank) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
    if(toI(file, rank)-7 >= 0) {
      for(int i = toI(file, rank)-7; i >= 0; i -= 7) {
        if(board[i].occupied || board[i+7].rank == board[i].rank) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
  }
}


