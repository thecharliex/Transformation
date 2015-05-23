class Panel {
  float x = 0;
  float y = 0;
  float w = width * 0.1;;
  float h = height;
  boolean locked = false;
  int paddgin = 10;
  boolean over = false;
  Button btnSquare;
  Button btnCircle;
  Button btnLine;
  Button btnTriangle;
  
  Panel() {
    x = w;
    y = 0;
    
    btnSquare = new Button(ELLIPSE);
    btnCircle = new Button(SQUARE);
    btnLine = new Button(LINE);
    btnTriangle = new Button(TRIANGLE);
    
    btnSquare.active = true;
  }
  
  void display() {
    if(mouseX > x-w && mouseX < x+w && mouseY > y-h && mouseY < y+h) {
      over = true;
    } else {
      over = false;
    }
    
    // Panel
    fill(153);
    rectMode(RADIUS);
    rect(x, y, w, h);
    noStroke();
    
    // Boton cuadrado
    btnSquare.x = x;
    btnSquare.y = (y+btnSquare.size) + paddgin;
    btnSquare.size = w*0.5;
    btnSquare.display();
    
    // Boton circulo
    btnCircle.x = x;
    btnCircle.y = (btnSquare.y + btnCircle.size + btnSquare.size) + paddgin;
    btnCircle.size = w*0.5;
    btnCircle.display();
    
    // Boton linea
    btnLine.x = x;
    btnLine.y = (btnCircle.y + btnLine.size + btnCircle.size) + paddgin;
    btnLine.size = w*0.5;
    btnLine.display();
    
    // Boton linea
    btnTriangle.x = x;
    btnTriangle.y = (btnLine.y + btnTriangle.size + btnLine.size) + paddgin;
    btnTriangle.size = w*0.5;
    btnTriangle.display();
  }
  
  int get_shape() {    
    if(btnSquare.active) { return  SQUARE; }
    else if(btnCircle.active) { return ELLIPSE; }
    else if(btnLine.active) { return  LINE; }
    else if(btnTriangle.active) { return  TRIANGLE; }
    
    return SQUARE;
  }
  
  void set_shape() {
    if(btnSquare.over) {
      btnSquare.active   = true;
      btnCircle.active   = false;
      btnLine.active     = false;
      btnTriangle.active = false;
    }
    else if(btnCircle.over) {
      btnSquare.active   = false;
      btnCircle.active   = true;
      btnLine.active     = false;
      btnTriangle.active = false;
    }
    else if(btnLine.over) {
      btnSquare.active   = false;
      btnCircle.active   = false;
      btnLine.active     = true;
      btnTriangle.active = false;
    }
    else if(btnTriangle.over) {
      btnSquare.active   = false;
      btnCircle.active   = false;
      btnLine.active     = false;
      btnTriangle.active = true;
    }
  }
  
  boolean isActive() {
    return mouseX > x-w && mouseX < x+w && mouseY > y-h && mouseY < y+h;
  }
};
