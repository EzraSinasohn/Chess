class King extends Piece {
  public King(int f, int r, boolean w) {
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
        image(lightKing, file*100, rank*100, 100, 100);
      } else {
        image(lightKing, x-25, y-25, 100, 100);
      }
    } else {
      if(!held) {
        image(darkKing, file*100, rank*100, 100, 100);
      } else {
        image(darkKing, x-25, y-25, 100, 100);
      }
    }
  }
  
  public void legalMoves() {
    if(file > 0) {
      for(int f = file-1; f > file-2; f--) {
        if(board[toI(f, rank)].occupied) {
          if(board[toI(f, rank)].heldPiece.white != white) {legal.add(board[toI(f, rank)]);}
          break;
        }
        legal.add(board[toI(f, rank)]);
      }
    }
    if(file < 7) {
      for(int f = file+1; f < file+2; f++) {
        if(board[toI(f, rank)].occupied) {
          if(board[toI(f, rank)].heldPiece.white != white) {legal.add(board[toI(f, rank)]);}
          break;
        }
        legal.add(board[toI(f, rank)]);
      }
    }
    if(rank > 0) {
      for(int r = rank-1; r > rank-2; r--) {
        if(board[toI(file, r)].occupied) {
          if(board[toI(file, r)].heldPiece.white != white) {legal.add(board[toI(file, r)]);}
          break;
        }
        legal.add(board[toI(file, r)]);
      }
    }
    if(rank < 7) {
      for(int r = rank+1; r < rank+2; r++) {
        if(board[toI(file, r)].occupied) {
          if(board[toI(file, r)].heldPiece.white != white) {legal.add(board[toI(file, r)]);}
          break;
        }
        legal.add(board[toI(file, r)]);
      }
    }
    if(toI(file, rank)+9 < 64) {
      for(int i = toI(file, rank)+9; i < toI(file, rank)+10; i += 9) {
        if(board[i].occupied || board[i-9].rank == board[i].rank-2) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
    if(toI(file, rank)-9 >= 0) {
      for(int i = toI(file, rank)-9; i > toI(file, rank)-10; i -= 9) {
        if(board[i].occupied || board[i+9].rank == board[i].rank+2) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
    if(toI(file, rank)+7 < 64) {
      for(int i = toI(file, rank)+7; i < toI(file, rank)+8; i += 7) {
        if(board[i].occupied || board[i-7].rank == board[i].rank) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
    if(toI(file, rank)-7 >= 0) {
      for(int i = toI(file, rank)-7; i > toI(file, rank)-8; i -= 7) {
        if(board[i].occupied || board[i+7].rank == board[i].rank) {
          if(board[i].occupied && board[i].heldPiece.white != white) {legal.add(board[i]);}
          break;
        }
        legal.add(board[i]);
      }
    }
  }
}

