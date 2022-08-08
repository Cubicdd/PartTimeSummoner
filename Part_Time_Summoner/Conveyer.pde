class button{
  monsterPart part;
  int conveyerRow;
  int conveyerSlot;
  float xOffset;
  float yOffset;
  boolean active;
  
  button(monsterPart part, int row, int collum){
    this.part = part;
    conveyerRow = row;
    conveyerSlot = collum;
    xOffset = 18;
    yOffset = 36;
  }
  
  void drawButton(){
    //main button
    if(mouseX>(xOffset*ratio+10.5*conveyerSlot*ratio) && mouseX<((10+xOffset)*ratio+10.5*conveyerSlot*ratio) && mouseY>(yOffset*ratio+10.5*conveyerRow*ratio) && mouseY<((10+yOffset)*ratio+10.5*conveyerRow*ratio)){
      fill(200);
    }else{
      fill(160);
    }
    pushMatrix();
    translate(xOffset*ratio+10.5*conveyerSlot*ratio,yOffset*ratio+10.5*ratio*conveyerRow);
    noStroke();
    if(active){
      stroke(50);
      strokeWeight(10);
    }
    rect(0,0,10*ratio,10*ratio,1*ratio);
    
    //monster part
    translate(5*ratio,6*ratio);
    part.drawPart();
    
    //title
    translate(0,2*ratio);
    fill(0);
    textSize(2*ratio);
    textAlign(CENTER);
    if(part.part==0){
      text("Head",0,0.5*ratio);
    }else if(part.part==1){
      text("Body",0,0.5*ratio);
    }else{
      text("Legs",0,0.5*ratio);
    }
    popMatrix();
  }
  
  
  void clicked(){
    if(mouseX>(xOffset*ratio+10.5*conveyerSlot*ratio) && mouseX<((10+xOffset)*ratio+10.5*conveyerSlot*ratio) && mouseY>(yOffset*ratio+10.5*conveyerRow*ratio) && mouseY<((10+yOffset)*ratio+10.5*conveyerRow*ratio)){
      for(int i=0;i<conveyer.size();i++){
        button x = conveyer.get(i);
        if(x.part.part == this.part.part && x != this){
          x.active = false;
        }
      }
      if(active){
        active = false;
        if(part.part==0){
          head = null;
        }else if(part.part==1){
          body = null;
        }else{
          legs = null;
        }
      }else{
        active = true;
        if(part.part==0){
          head = part;
        }else if(part.part==1){
          body = part;
        }else{
          legs = part;
        }
      }
    }
  }
}
    
    
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void buttons(){
  for (int i=0;i<conveyer.size();i++){
    conveyer.get(i).drawButton();
  }
}


    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void mouseClicked(){
  //check buttons
  for (int i=0;i<conveyer.size();i++){
    conveyer.get(i).clicked();
  }
  
  //summon monster
  if(head!=null && body!=null && legs!=null && mouseX>-1.25*mouseY+61*ratio && mouseX<-1.25*mouseY+69*ratio && mouseY<32*ratio && mouseY>20*ratio){
    advanceTurn();
    
    int position=0;
    if(mouseY>24*ratio && mouseY<28*ratio){
      position = 1;
    }else if(mouseY>28*ratio && mouseY<32*ratio){
      position = 2;
    }
    //grid.add(new monster(true,1,position,head,body,legs));
    if(grid[position][0]==null)grid[position][0]=new monster(true,0,position,head,body,legs);
    head = null;
    body = null;
    legs = null;
    for(int i=0;i<conveyer.size();i++){
      conveyer.get(i).active = false;
    }
  }
}
