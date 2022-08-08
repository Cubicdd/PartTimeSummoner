interface monsterLeg {
  void move();
  void drawPart();
  void setLeg(int x,int y,monster body);
  float getHeight();
}

interface monsterBody {
  void onHit(boolean controlled);
  void drawPart();
}

interface monsterHead {
  void onAttack(boolean controlled);
  void drawPart();
}


  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


class basicLeg implements monsterLeg {
  monster body;
  int x, y;
  int red, green, blue;
  float partHeight;
  
  //creating
  basicLeg(float Height, int red, int green, int blue){
    partHeight = Height;
    this.red = red;
    this.green = green;
    this.blue = blue;
  }
  
  void setLeg(int x, int y, monster body){
    this.x = x;
    this.y = y;
    this.body = body;
  }
  
  void move(){
    if(body == null) return;
    if(body.controlled){
      x++;
      grid[y][x]=body;
      grid[y][x-1]=null;
    }
  }
  
  void drawPart(){
    noStroke();
    fill(red,blue,green);
    circle(0,-2.5*ratio,2.5*ratio*2);
  }
  
  
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  
  //Setters and Getters
  
  
  float getHeight(){
    return partHeight;
  }
}
