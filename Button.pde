class Button {
  float x;
  float y;
  float size;
  boolean over = false;
  boolean active = false;
  int icon;
  
  Button(int buttonIcon) {
    x = 0;
    y = 0;
    //size = 10;
    icon = buttonIcon;
    
    rectMode(RADIUS);
  }
  
  void display() {     
    if (mouseX > x-size && mouseX < x+size && mouseY > y-size && mouseY < y+size) {
      over = true;
      if(!active) { 
        stroke(255); 
        fill(153);
      } else {
        stroke(153);
        fill(255);
      }
    } else {
      stroke(153);
      fill(255);
      over = false;
    }
    
    // panel
    rect(x, y, size, size);
    
    if(active) stroke(51);
    
    switch(icon) {
      case ELLIPSE: {
        ellipseMode(CENTER);
        rect(x, y, size*0.5, size*0.5);
        break;
      }
      case SQUARE: {
        ellipse(x, y, size, size);
        break;
      }
      case LINE: {
        line(x-size*0.5, y+size*0.5, x+size*0.5, y-size*0.5 );
        break;
      }
      case TRIANGLE: {
        triangle(x-size*0.5,y+size*0.5,x,y-size*0.5,x+size*0.5,y+size*0.5);
      }
    };
    
    noStroke();
  }
};
