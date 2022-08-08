float ratio;
int gamePhase; //indicates current phase; 0 = menus, 1 = dialouge, 2 = building, 3 = watching animations
monsterPart head;
monsterPart body;
monsterPart legs;
monster[][] grid;
ArrayList<button> conveyer;

  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void setup(){
  fullScreen();
  frameRate(60);
  ratio = width/100;
  conveyer = new ArrayList<button>();
  //grid = new ArrayList<monster>();
  grid = new monster[3][8];
  
  
  summon();
}

  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void draw(){
  background(20);
  grid();
  drawMonsters();
  buttons();
}

  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void grid(){
  stroke(255);
  strokeWeight(5);
  
  //Horizontal Lines
  line(36*ratio,20*ratio,100*ratio,20*ratio);
  line(31*ratio,24*ratio,95*ratio,24*ratio);
  line(26*ratio,28*ratio,90*ratio,28*ratio);
  line(21*ratio,32*ratio,85*ratio,32*ratio);
  
  //Vertical line
  int xAxis = 36;
  int loopCount = 0;
  while(loopCount < 9){
    strokeWeight(5);
    if(loopCount==5){
      stroke(255,0,0);
    }
    else{
      stroke(255);
    }
    line(xAxis*ratio,20*ratio,(xAxis-15)*ratio,32*ratio);
    xAxis += 8;
    loopCount++;
  }
  
  //summoning circle
  fill(100);
  noStroke();
  pushMatrix();
  translate(21.5*ratio,25.5*ratio);
  rotate(6.1);
  ellipse(0,0,6.5*ratio,3.5*ratio);
  popMatrix();
  
  //building backgrounds
  noStroke();
  fill(200,200);
  circle(21.5*ratio,12*ratio,6.5*ratio);
  circle(21.5*ratio,17*ratio,6.5*ratio);
  circle(21.5*ratio,22*ratio,6.5*ratio);
}

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void summon(){
  conveyer.add(new button(new monsterPart(0,20,255,20,3),0,0));
  conveyer.add(new button(new monsterPart(1,255,20,20,4),1,1));
  conveyer.add(new button(new monsterPart(1,255,255,20,4),2,0));
  conveyer.add(new button(new monsterPart(2,20,20,255,4),0,2));
}

void drawMonsters(){
  if(head!=null){
    pushMatrix();
    translate(21.5*ratio,14*ratio);
    head.drawPart();
    popMatrix();
  }
  if(body!=null){
    pushMatrix();
    translate(21.5*ratio,19.5*ratio);
    body.drawPart();
    popMatrix();
  }
  if(legs!=null){
    pushMatrix();
    translate(21.5*ratio,24.5*ratio);
    legs.drawPart();
    popMatrix();
  }
  
  //for(int i=0;i<grid.size();i++){
  //  grid.get(i).render();
  //}
  for(int y=0;y<3;y++){
    for(int x=0;x<8;x++){
      if(grid[y][x]!=null){
        grid[y][x].render();
      }
    }
  }
}

    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    
void advanceTurn(){
  for(int y=0;y<3;y++){
    grid[y][7]=null;
    for(int x=7;x>=0;x--){
      if(grid[y][x]!=null){
        grid[y][x].advance();
      }
    }
  }
}
