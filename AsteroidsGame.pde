//Vivian Lam, AP Computer Science, Mod 6/7, AsteroidsGame Part4
SpaceShip fly;
ArrayList<Star> shiny;
ArrayList<Asteroid> rock;
ArrayList<Bullets> power;
 public void setup() 
{
  size(700,700,P2D);
  fly=new SpaceShip();
  power=new ArrayList<Bullets>();
  shiny=new ArrayList<Star>();
  for(int i=0; i<100;i++){
    shiny.add(new Star());
  }
  rock=new ArrayList<Asteroid>();
  for(int i=0;i<50;i++){
    rock.add(new Asteroid());
  }
}
 public void draw() 
{
  background(0);
  for(int i=0;i<100;i++){
    shiny.get(i).show();
  }
 
  for(int i=0; i<rock.size();i++){
  if(dist(fly.getX(), fly.getY(), rock.get(i).getX(), rock.get(i).getY())>30){
    rock.get(i).setCrash(false);
  }else{
    rock.get(i).setCrash(true);
  }
}
  for(int i=0; i<rock.size();i++)
  {
    for(int j=0; j<power.size();j++)
    {
      if(j!=power.size()){
      if(dist(rock.get(i).getX(), rock.get(i).getY(),power.get(j).getX(),power.get(j).getY())<13){
       rock.remove(i);
       power.remove(j);
  }
}
}
}
  for(int i=0; i<rock.size(); i++){
    if (i!=rock.size()){
    if(rock.get(i).getCrash()==false){
      rock.get(i).move();
      rock.get(i).show();
    }else{
      rock.remove(i);
      if(rock.size()<45){
        rock.add(new Asteroid());
      }
    }
  }
}
for(int j=0; j<power.size(); j++){
  if(j!=power.size()){
    power.get(j).move();
    power.get(j).show();
  }
  if(power.get(j).getX()>=height || power.get(j).getX()<=0 || power.get(j).getY()>height || power.get(j).getY()<0){
    power.remove(j);
    }  
}
for(int j=0; j<power.size();j++){
  if(power.get(j).getCrash()==true){
    power.remove(j);
  }
}
fly.move();
fly.show();
}
 public void keyPressed()
 {
  if(key==CODED && keyCode==LEFT){fly.rotate(-5);} //Rotate Left
  if(key==CODED && keyCode==RIGHT){fly.rotate(5);} //Rotate Right
  if(key==CODED && keyCode==UP){fly.accelerate(0.05);}//accelerate forward
  if(key==CODED && keyCode==DOWN){fly.accelerate(-0.05);}//accelerate backward
  if(keyPressed==true && key==' '){
    fly.setX(350);
    fly.setY(350);
    fly.setDirectionX(0);
    fly.setDirectionY(0);
    fly.accelerate(0);
    fly.setPointDirection(0);
  }//hyperspace
  if(keyPressed==true && key=='x'){
    power.add(new Bullets(fly));
    for(int i=0; i<power.size(); i++){
    power.get(i).move();
    power.get(i).show();
  }
  }
 }
 class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners= 12;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = 32;
    yCorners[0] = 0;
    xCorners[1] = 20;
    yCorners[1] = -12;
    xCorners[2] = 20;
    yCorners[2] = -6;
    xCorners[3] = -16;
    yCorners[3] = -6;
    xCorners[4] = -24;
    yCorners[4] = -20;
    xCorners[5] = -24;
    yCorners[5] = -6;
    xCorners[6] = -32;
    yCorners[6] = 0;
    xCorners[7] = -24;
    yCorners[7] = 6;
    xCorners[8] = -24;
    yCorners[8] = 20;
    xCorners[9] = -16;
    yCorners[9] = 6;
    xCorners[10] = 20;
    yCorners[10] = 6;
    xCorners[11] = 20;
    yCorners[11] = 12; 
    myColor= color(44, 144, 100);
    myCenterX=350;
    myCenterY=350;
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
  public void setX(int x) {myCenterX=x;}  
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY=y;} 
  public int getY() {return (int) myCenterY;}   
  public void setDirectionX(double x) {myDirectionX=x;}  
  public double getDirectionX() {return (double) myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY =y;}   
  public double getDirectionY() {return (double) myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection=degrees;}  
  public double getPointDirection() {return (int) myPointDirection;}    
}

 class Star
{
  private int starX, starY;
  public Star()
  {
    starX=(int)(Math.random()*height);
    starY=(int)(Math.random()*height);
  }
  public void show()
  {
    fill(255);
    noStroke();
    ellipse(starX,starY,5,5);
  }
}
 class Asteroid extends Floater
 {
 private int speedOfRotations;
 private boolean crash;
 public Asteroid()
 {
  corners=6;
  xCorners = new int [corners];
  yCorners = new int [corners];
  xCorners[0]=-11;
  yCorners[0]=-8;
  xCorners[1]=7;
  yCorners[1]=-8;
  xCorners[2]=13;
  yCorners[2]=0;
  xCorners[3]=6;
  yCorners[3]=10;
  xCorners[4]=-11;
  yCorners[4]=8;
  xCorners[5]=-5;
  yCorners[5]=0;
  myColor= color(167);
  myCenterX=(int)(0);
  myCenterY=(int)(Math.random()*height);
  myDirectionX=(int)(Math.random()*10)-5;
  myDirectionY=(int)(Math.random()*10)-5;
  if(myDirectionX==0 && myDirectionY==0){
    myDirectionX=1;
    myDirectionY=2;
  }
  myPointDirection=(int)(Math.random()*180);
  speedOfRotations=(int)(Math.random()*10)-5;
  crash=false;
 }
 public void move()
 {   
    rotate(speedOfRotations);
    frameRate(30);
    super.move();
    
 }  
  public void setX(int x) {myCenterX=x;}  
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY=y;} 
  public int getY() {return (int) myCenterY;}   
  public void setDirectionX(double x) {myDirectionX=x;}  
  public double getDirectionX() {return (double) myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY =y;}   
  public double getDirectionY() {return (double) myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection=degrees;}  
  public double getPointDirection() {return (int) myPointDirection;} 
  public void setCrash(boolean check){crash=check;}
  public boolean getCrash() {return crash;}
 }

 class Bullets extends Floater
 {
  private boolean crash;
  public Bullets(SpaceShip theShip)
  {
  myColor=color(0,255,0);
  myCenterX=theShip.getX();
  myCenterY=theShip.getY();
  myPointDirection=theShip.getPointDirection();
  double dRadians=myPointDirection*(Math.PI/180);
  myDirectionX=5*(Math.cos(dRadians))+theShip.getDirectionX();
  myDirectionY=5*(Math.sin(dRadians))+theShip.getDirectionY();
  crash=false;
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((int) myCenterX, (int)myCenterY, 10, 8);
  }
  public void move()
  {
    /*if(fly.getDirectionX()>0)
    {
    myCenterX += myDirectionX; 
    }else{
    myCenterX -= myDirectionX;
    }
     if(fly.getDirectionY()>0)
    {   
    myCenterY += myDirectionY;   
    }else{
    myCenterY -= myDirectionY;
    }*/
    myCenterX+=myDirectionX;
    myCenterY+=myDirectionY;
  }
  public void setX(int x) {myCenterX=x;}  
  public int getX() {return (int)myCenterX;}   
  public void setY(int y) {myCenterY=y;} 
  public int getY() {return (int) myCenterY;}   
  public void setDirectionX(double x) {myDirectionX=x;}  
  public double getDirectionX() {return (double) myDirectionX;}   
  public void setDirectionY(double y) {myDirectionY =y;}   
  public double getDirectionY() {return (double) myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection=degrees;}  
  public double getPointDirection() {return (int) myPointDirection;} 
  public void setCrash(boolean check){crash=check;}
  public boolean getCrash() {return crash;} 
 }
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 