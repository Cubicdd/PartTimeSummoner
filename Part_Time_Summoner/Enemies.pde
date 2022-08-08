class monster{
  monsterPart Head;
  monsterPart Body;
  monsterPart Legs;
  
  int x;
  int y;
  
  boolean controlled;
  int chains;
  
  monster(boolean player,int x,int y,monsterPart headPart,monsterPart bodyPart,monsterPart legsPart){
    controlled = player;
    Head = headPart;
    Body = bodyPart;
    Legs = legsPart;
    this.x = x;
    this.y = y;
    chains = 5;
    controlled = true;
  }
  
  void render(){
    pushMatrix();
    translate(x*8*ratio+38*ratio-5*ratio*y,y*4*ratio+22*ratio);
    Legs.drawPart();
    translate(0,-Legs.partHeight*ratio);
    Body.drawPart();
    translate(0,-Body.partHeight*ratio);
    Head.drawPart();
    popMatrix();
  }
  
  void advance(){
    Legs.move();
  }
}


  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class monsterPart{
  int part; //0 = head, 1 = body, 2 = legs
  int partRed;
  int partGreen;
  int partBlue;
  float partHeight;
  
  monsterPart(int slot, int red, int green, int blue, float   partHeight){
    part = slot;
    partRed=red;
    partGreen=green;
    partBlue=blue;
    this.partHeight = partHeight;
  }
  
  void drawPart(){
    float radius;
    if(part==0){
      radius=2;
    }else{
      radius=2.5;
    }
    noStroke();
    fill(partRed,partBlue,partGreen);
    circle(0,-radius*ratio,radius*ratio*2);
  }
  
  
  //location specific parts
  void move(){}
  
  void onAttack(){}
  
  void onHit(){}
}

  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

class testPart extends monsterPart{
  testPart(){
  }
}
