ArrayList<PromotionIcon> icons = new ArrayList<PromotionIcon>();
boolean promoting = false;
class Pawn extends Piece {
  public Pawn(int f, int r, boolean w) {
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
        image(lightPawn, file*100, rank*100, 100, 100);
      } else {
        image(lightPawn, x-25, y-25, 100, 100);
      }
    } else {
      if(!held) {
        image(darkPawn, file*100, rank*100, 100, 100);
      } else {
        image(darkPawn, x-25, y-25, 100, 100);
      }
    }
  }
  
  public void legalMoves() {
    if(white) {
      if(!board[toI(file, rank-1)].occupied) {
        legal.add(board[toI(file, rank-1)]);
        if(rank == 6 && !board[toI(file, rank-2)].occupied) {
          legal.add(board[toI(file, rank-2)]);
        }
      }
      if(file > 0 && board[toI(file-1, rank-1)].occupied && board[toI(file-1, rank-1)].heldPiece.white != white) {legal.add(board[toI(file-1, rank-1)]);}
      if(file < 7 && board[toI(file+1, rank-1)].occupied && board[toI(file+1, rank-1)].heldPiece.white != white) {legal.add(board[toI(file+1, rank-1)]);}
    } else {
      if(!board[toI(file, rank+1)].occupied) {
        legal.add(board[toI(file, rank+1)]);
        if(rank == 1 && !board[toI(file, rank+2)].occupied) {
          legal.add(board[toI(file, rank+2)]);
        }
      }
      if(file > 0 && board[toI(file-1, rank+1)].occupied && board[toI(file-1, rank+1)].heldPiece.white != white) {legal.add(board[toI(file-1, rank+1)]);}
      if(file < 7 && board[toI(file+1, rank+1)].occupied && board[toI(file+1, rank+1)].heldPiece.white != white) {legal.add(board[toI(file+1, rank+1)]);}
    }
  }
  
  public void promote() {
    if(white && rank == 0) { 
      promoting = true;
      for(int i = 0; i < 4; i++) {icons.add(new PromotionIcon(i, true));}
    } else if(!white && rank == 7) {
      promoting = true;
      for(int i = 0; i < 4; i++) {icons.add(new PromotionIcon(i, false));}
    }
  }
}

