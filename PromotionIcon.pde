class PromotionIcon {
  protected int type;
  protected boolean white;
  public PromotionIcon(int t, boolean w) {
    type = t;
    white = w;
  }
  
  public void show() {
    if(white) {
      if(type == 0) {
        image(lightQueen, width/2-200, height/2-50, 100, 100);
      } else if(type == 1) {
        image(lightRook, width/2-100, height/2-50, 100, 100);
      } else if(type == 2) {
        image(lightBishop, width/2, height/2-50, 100, 100);
      } else if(type ==3) {
        image(lightKnight, width/2+100, height/2-50, 100, 100);
      }
    } else {
      if(type == 0) {
        image(darkQueen, width/2-200, height/2-50, 100, 100);
      } else if(type == 1) {
        image(darkRook, width/2-100, height/2-50, 100, 100);
      } else if(type == 2) {
        image(darkBishop, width/2, height/2-50, 100, 100);
      } else if(type ==3) {
        image(darkKnight, width/2+100, height/2-50, 100, 100);
      }
    }
  }
  
}
