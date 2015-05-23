ArrayList list;

class Canvas {
  float x, y;
  float w, h;
  
  Canvas() {
    x = width-(width*0.8);
    y = 0;
    w = width*0.8;
    h = height;
    list = new ArrayList();
  }
  
  void display() {
    fill(51);
    noStroke();
    rectMode(CORNER);
    rect(x,y,w,h);
    
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      shape.display();
    }
  }
  
  void add_shape() {
    if( isActive() ) {
      switch(panel.get_shape()) {
        case SQUARE:   { list.add(new Shape(SQUARE));   break; }
        case ELLIPSE:  { list.add(new Shape(ELLIPSE));  break; }
        case LINE:     { list.add(new Shape(LINE));     break; }
        case TRIANGLE: { list.add(new Shape(TRIANGLE)); break; }
      }
    }
  }
  
  void remove_shape() {
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      if( shape.isActive() ) {
        list.remove(i);
        ++i;
      }
    }
  }
  
  void rotate_shape(int direction) {
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      if( shape.isActive() ) {
        shape.rotateTo(direction);
      }
    }
  }
  
  void move_shape() {
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      if( shape.isActive() ) {
        shape.move();
      }
    }    
  }
  
  void scale_shape(int size) {
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      if( shape.isActive() ) {
        shape.scaleTo(size);
      }
    }
  }
  
  void width_shape(int direction) {
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      if( shape.isActive() ) {
        shape.widthTo(direction);
      }
    }
  }
  
  void height_shape(int direction) {
    for(int i = 0; i < list.size(); ++i) {
      Shape shape = (Shape) list.get(i);
      if( shape.isActive() ) {
        shape.heightTo(direction);
      }
    }
  }
  
  boolean isActive() {
    return mouseX > x-w && mouseX < x+w && mouseY > y-h && mouseY < y+h;
  }
}
