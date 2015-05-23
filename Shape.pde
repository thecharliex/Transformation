class Shape {
  float angle;
  float x, y;
  float w, h;
  float scalePercent;
  float xOffset, yOffset;
  int icon;
  
  Shape(int shapeIcon) {
    angle = 0.0;
    x = mouseX;
    y = mouseY;
    w = 50;
    h = 50;
    scalePercent = 1;
    xOffset = 0.0;
    yOffset = 0.0;
    icon = shapeIcon;
  }
  
  void display() {
    if( isActive() ) {
      stroke(255);
    } else {
      noStroke();
    }
    fill(150,150,150,100);
    printShape();
  }
  
  boolean isActive() {
    return mouseX > x-w && mouseX < x+w && mouseY > y-h && mouseY < y+h;
  }
  
  void rotateTo(int direction) {
    switch(direction) {
      case LEFT:  { if(angle <  180) angle++; break; }
      case RIGHT: { if(angle > -180) angle--; break; }
    }
    
    println(angle);
  }
  
  void printShape() {
    pushMatrix();    
    translate(x, y);
    rotate(radians(angle));
    scale(scalePercent);
    switch(icon) {
      case TRIANGLE: {
        triangle(+w,h,(w)/100,-h,-w,h);
        break;
      }
      case SQUARE: {
        rectMode(RADIUS);
        rect(0,0,w,h);
        break;
      }
      case ELLIPSE: {
        ellipseMode(RADIUS);
        ellipse(0,0,w,h);
        break;
      }
      case LINE: {
        if(isActive()) {
          stroke(255);
        } else {
          stroke(150);          
        }
        line(0,0,w,h);
        break;
      }
    }
    noStroke();
    popMatrix();
  }
  
  void move() {
    x = mouseX-xOffset;
    y = mouseY-yOffset;
  }
  
  void scaleTo(int size) {
    switch(size) {
      case UP: {
        if(w < 200 || h < 200) {
          w += 1;
          h += 1;        
        }
        break;
      }
      case DOWN: {
        if(w > 10 || h > 10) {
          w -= 1;
          h -= 1;
        }
        break;
      }
    }
  }
  
  void widthTo(int size) {
    switch(size) {
      case UP: {
        if(w < 200 || h < 200) {
          w += 1;     
        }
        break;
      }
      case DOWN: {
        if(w > 10 || h > 10) {
          w -= 1;
        }
        break;
      }
    }
  }
  
  void heightTo(int size) {
    switch(size) {
      case UP: {
        if(h < 200) {
          h += 1;     
        }
        break;
      }
      case DOWN: {
        if(h > 10) {
          h -= 1;
        }
        break;
      }
    }
  }
}
