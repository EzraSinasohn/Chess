class Square {
  protected int file, rank;
  protected boolean white, green, marked = false, occupied;
  public Piece heldPiece;
  public Square(int f, int r) {
    file = f;
    rank = r;
    white = (file%2 == 0 && rank%2 == 0) || (file%2 == 1 && rank%2 == 1);
    green = !(file%2 == 0 && rank%2 == 0) || (file%2 == 1 && rank%2 == 1);
  }
  
  public void show() {
    if(white && marked) {fill(213, 132, 110);}
    else if(green && marked) {fill(191, 115, 86);}
    else if(white) {fill(235, 236, 211);}
    else {fill(125, 148, 90);}
    square(file*100, rank*100, 100);
    if(legal.contains(board[toI(file, rank)])) {
      if(pieces.contains(heldPiece)) {
        heldPiece.captureCircle();
      } else {
        fill(100, 80);
        ellipse(file*100+50, rank*100+50, 25, 25);
      }
    }
    /*if(occupied) {
      fill(255, 0, 0);
      ellipse(file*100+50, rank*100+50, 50, 50);
    }*/
  }
}

public int toRank(int i) {return (i-(i%8))/8;}
public int toFile(int i) {return i%8;}
public int toI(int c, int r) {return r*8+c;}

public void mouseClicked() {
  if(mouseButton == RIGHT) {
    for(int i = 0; i < 64; i++) {
      if((int) (Math.floor(mouseX/100)) == board[i].file && (int) (Math.floor(mouseY/100)) == board[i].rank) {
        board[i].marked = !board[i].marked;
        break;
      }
    }
  }
}
