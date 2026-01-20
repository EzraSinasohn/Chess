Square[] board = new Square[64];
ArrayList<Piece> pieces = new ArrayList<Piece>();

void setup() {
  size(800, 800);
  background(100);
  noStroke();
  for(int i = 0; i < 64; i++) {
    board[i] = new Square(toFile(i), toRank(i));
  }
  lightKing = loadImage("LightKing.png");
  darkKing = loadImage("DarkKing.png");
  lightQueen = loadImage("LightQueen.png");
  darkQueen = loadImage("DarkQueen.png");
  lightRook = loadImage("LightRook.png");
  darkRook = loadImage("DarkRook.png");
  lightBishop = loadImage("LightBishop.png");
  darkBishop = loadImage("DarkBishop.png");
  lightKnight = loadImage("LightKnight.png");
  darkKnight = loadImage("DarkKnight.png");
  lightPawn = loadImage("LightPawn.png");
  darkPawn = loadImage("DarkPawn.png");
  pieces.add(new Rook(0, 7, true));
  pieces.add(new Knight(1, 7, true));
  pieces.add(new Bishop(2, 7, true));
  pieces.add(new Queen(3, 7, true));
  pieces.add(new King(4, 7, true));
  pieces.add(new Bishop(5, 7, true));
  pieces.add(new Knight(6, 7, true));
  pieces.add(new Rook(7, 7, true));
  pieces.add(new Rook(0, 0, false));
  pieces.add(new Knight(1, 0, false));
  pieces.add(new Bishop(2, 0, false));
  pieces.add(new Queen(3, 0, false));
  pieces.add(new King(4, 0, false));
  pieces.add(new Bishop(5, 0, false));
  pieces.add(new Knight(6, 0, false));
  pieces.add(new Rook(7, 0, false));
  for(int i = 0; i < 8; i++) {pieces.add(new Pawn(i, 6, true));}
  for(int i = 0; i < 8; i++) {pieces.add(new Pawn(i, 1, false));}
  for(int i = 0; i < pieces.size(); i++) {
     board[toI(pieces.get(i).file, pieces.get(i).rank)].heldPiece = pieces.get(i);
  }
}

void draw() {
  if(!promoting) {
    background(100);
    for(int i = 0; i < 64; i++) {
      board[i].show();
    }
    for(int i = 0; i < pieces.size(); i++) {
      pieces.get(i).show();
      pieces.get(i).promote();
    }
  } else {
    fill(0);
    rect(width/2-200, height/2-50, 400, 100);
    for(int i = 0; i < icons.size(); i++) {
      icons.get(i).show();
    }
  }
  fill(0);
  text((int) (Math.floor(mouseX/100)), 50, 50);
  text((int) (Math.floor(mouseY/100)), 100, 50);
}
