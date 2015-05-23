Canvas canvas;
Panel panel;
int keyPressedCode;
int mousePressedCode;
int bgnX, bgnY;
int endX, endY;

void setup() {
  size(800, 600);
  canvas = new Canvas();
  panel = new Panel();
}

void draw() {
  background(255);
  canvas.display();
  panel.display();
}

void keyPressed() {
  keyPressedCode = key;
}

void keyReleased() {
  keyPressedCode = '\0';
}

void mousePressed() {
  switch(mouseButton) {
    case LEFT: {
      bgnX = mouseX;
      bgnY = mouseY;
      
      if( panel.isActive() ) {
        panel.set_shape();
      } else {
        switch(keyPressedCode) {
          case 'n': { canvas.add_shape(); break; }
        }
      }
      break;
    }
    case RIGHT: {
      switch(keyPressedCode) {
        case 'n': { canvas.remove_shape(); break; }
      }
      break;
    }
  }
}

void mouseReleased() {
  mousePressedCode = 0;
  bgnX = bgnY = endX = endY = 0;
}

void mouseDragged() {
  endX = mouseX;
  endY = mouseY;
  
  switch(mouseButton) {
    case LEFT: {
      switch(keyPressedCode) {
        case 't': { canvas.move_shape(); break; }
      }
      break;
    }
    case RIGHT: {
      break;
    }
  }
  
  println("dragged("+endX+","+endY+")");
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  switch((int)e) {
    case -1: {
      switch(keyPressedCode) {
        case 's': { canvas.scale_shape(UP); break; }
        case 'r': { canvas.rotate_shape(LEFT); break; }
        case 'w': { canvas.width_shape(UP); break; }
        case 'h': { canvas.height_shape(UP); break; }
      }
      break;
    }
    case  1: {
      switch(keyPressedCode) {
        case 's': { canvas.scale_shape(DOWN); break; }
        case 'r': { canvas.rotate_shape(RIGHT); break; }
        case 'w': { canvas.width_shape(DOWN); break; }
        case 'h': { canvas.height_shape(DOWN); break; }
      }
      break;
    }
  }
}
