PImage lightKing, darkKing, lightQueen, darkQueen, lightRook, darkRook, lightBishop, darkBishop, lightKnight, darkKnight, lightPawn, darkPawn;
ArrayList<Square> legal = new ArrayList<Square>();
int mouseStartX, mouseStartY;
class Piece extends Square {
  protected int x, y;
  protected boolean held, white;
  public Piece(int f, int r, boolean w) {
    super(f, r);
    file = f;
    rank = r;
    x = file*100;
    y = rank*100;
    white = w;
  }
  
  public void show() {

  }
  
  public void legalMoves() {
    
  }
  
  public void captureCircle() {
    strokeWeight(7);
    stroke(100, 50);
    noFill();
    ellipse(file*100+50, rank*100+50, 100, 100);
    noStroke();
  }
  
  public void promote() {}
  
}


public void mousePressed() {
  if(!promoting) {
    if(mouseButton == LEFT) {
      mouseStartX = mouseX;
      mouseStartY = mouseY;
      legal.clear();
      for(int i = 0; i < 64; i++) {
        board[i].marked = false;
      }
      for(int i = 0; i < pieces.size(); i++) {
        if(((int) (Math.floor(mouseStartX/100)) == (int) (Math.floor(pieces.get(i).x/100)) && (int) (Math.floor(mouseStartY/100)) == (int) (Math.floor(pieces.get(i).y/100)))) {
          pieces.get(i).legalMoves();
        }
      }
    }
  } else {
    if(mouseX > width/2-200 && mouseX < width/2-100 && mouseY > height/2-50 && mouseY < height/2+50) {
      for(int i = 0; i < pieces.size(); i++) {
        if((pieces.get(i).white && pieces.get(i).rank == 0) || (!pieces.get(i).white && pieces.get(i).rank == 7)) {
          pieces.add(new Queen(pieces.get(i).file, pieces.get(i).rank, pieces.get(i).white));
          pieces.remove(i);
          promoting = false;
          break;
        }
      }
    } else if(mouseX > width/2-100 && mouseX < width/2 && mouseY > height/2-50 && mouseY < height/2+50) {
      for(int i = 0; i < pieces.size(); i++) {
        if((pieces.get(i).white && pieces.get(i).rank == 0) || (!pieces.get(i).white && pieces.get(i).rank == 7)) {
          pieces.add(new Rook(pieces.get(i).file, pieces.get(i).rank, pieces.get(i).white));
          pieces.remove(i);
          promoting = false;
          break;
        }
      }
    } else if(mouseX > width/2 && mouseX < width/2+100 && mouseY > height/2-50 && mouseY < height/2+50) {
      for(int i = 0; i < pieces.size(); i++) {
        if((pieces.get(i).white && pieces.get(i).rank == 0) || (!pieces.get(i).white && pieces.get(i).rank == 7)) {
          pieces.add(new Bishop(pieces.get(i).file, pieces.get(i).rank, pieces.get(i).white));
          pieces.remove(i);
          promoting = false;
          break;
        }
      }
    } else if(mouseX > width/2+100 && mouseX < width/2+200 && mouseY > height/2-50 && mouseY < height/2+50) {
      for(int i = 0; i < pieces.size(); i++) {
        if((pieces.get(i).white && pieces.get(i).rank == 0) || (!pieces.get(i).white && pieces.get(i).rank == 7)) {
          pieces.add(new Knight(pieces.get(i).file, pieces.get(i).rank, pieces.get(i).white));
          pieces.remove(i);
          promoting = false;
          break;
        }
      }
    }
  }
}

public void mouseDragged() {
  if(!promoting) {
    for(int i = 0; i < pieces.size(); i++) {
      if(((int) (Math.floor(mouseStartX/100)) == (int) (Math.floor(pieces.get(i).x/100)) && (int) (Math.floor(mouseStartY/100)) == (int) (Math.floor(pieces.get(i).y/100))) || pieces.get(i).held) {
        pieces.get(i).held = true;
        if(mouseX-25 > 0 && mouseX-25 < width-50) {
          pieces.get(i).x = mouseX-25;
        }
        if(mouseY-25 > 0 && mouseY-25 < height-50) {
          pieces.get(i).y = mouseY-25;
        }
      }
    }
  }
}

public void mouseReleased() {
  if(!promoting) {
    for(int i = 0; i < pieces.size(); i++) {
      if(pieces.get(i).held) {
        if(legal.contains((board[toI((int) (Math.floor((pieces.get(i).x+25)/100)), (int) (Math.floor((pieces.get(i).y+25)/100)))]))) {
          board[toI(pieces.get(i).file, pieces.get(i).rank)].occupied = false;
          pieces.get(i).file = (int) (Math.floor((pieces.get(i).x+25)/100));
          pieces.get(i).rank = (int) (Math.floor((pieces.get(i).y+25)/100));
          pieces.get(i).x = pieces.get(i).file*100;
          pieces.get(i).y = pieces.get(i).rank*100;
          if(board[toI(pieces.get(i).file, pieces.get(i).rank)].occupied) {
            pieces.remove(board[toI(pieces.get(i).file, pieces.get(i).rank)].heldPiece);
            i--;
          }
          board[toI(pieces.get(i).file, pieces.get(i).rank)].occupied = true;
          board[toI(pieces.get(i).file, pieces.get(i).rank)].heldPiece = pieces.get(i);
          legal.clear();
        } else {
          pieces.get(i).x = pieces.get(i).file*100;
          pieces.get(i).y = pieces.get(i).rank*100;
        }
        pieces.get(i).held = false;
      }
    }
    for(int i = 0; i < 64; i++) {
      if(!board[i].occupied) {board[i].heldPiece = new Piece(-1, -1, false);}
    }
  }
}

