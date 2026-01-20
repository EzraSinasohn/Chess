class Knight extends Piece {
  public Knight(int f, int r, boolean w) {
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
        image(lightKnight, file*100, rank*100, 100, 100);
      } else {
        image(lightKnight, x-25, y-25, 100, 100);
      }
    } else {
      if(!held) {
        image(darkKnight, file*100, rank*100, 100, 100);
      } else {
        image(darkKnight, x-25, y-25, 100, 100);
      }
    }
  }
  
  public void legal() {
    if(file > 0 && rank > 1 && !(board[toI(file, rank)-17].occupied && board[toI(file, rank)-17].heldPiece.white == white)) {legal.add(board[toI(file,rank)-17]);}
    if(file < 7 && rank > 1 && !(board[toI(file, rank)-15].occupied && board[toI(file, rank)-15].heldPiece.white == white)) {legal.add(board[toI(file,rank)-15]);}
    if(file > 1 && rank > 0 && !(board[toI(file, rank)-10].occupied && board[toI(file, rank)-10].heldPiece.white == white)) {legal.add(board[toI(file,rank)-10]);}
    if(file < 6 && rank > 0 && !(board[toI(file, rank)-6].occupied && board[toI(file, rank)-6].heldPiece.white == white)) {legal.add(board[toI(file,rank)-6]);}
    if(file < 7 && rank < 6 && !(board[toI(file, rank)+17].occupied && board[toI(file, rank)+17].heldPiece.white == white)) {legal.add(board[toI(file,rank)+17]);}
    if(file > 0 && rank < 6 && !(board[toI(file, rank)+15].occupied && board[toI(file, rank)+15].heldPiece.white == white)) {legal.add(board[toI(file,rank)+15]);}
    if(file < 6 && rank < 7 && !(board[toI(file, rank)+10].occupied && board[toI(file, rank)+10].heldPiece.white == white)) {legal.add(board[toI(file,rank)+10]);}
    if(file > 1 && rank < 7 && !(board[toI(file, rank)+6].occupied && board[toI(file, rank)+6].heldPiece.white == white)) {legal.add(board[toI(file,rank)+6]);}
  }
}
