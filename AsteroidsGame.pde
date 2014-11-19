//Vivian Lam, AP Computer Science, Mod 6/7, AsteroidsGame Part1
SpaceShip fly;
ArrayList<Star> shiny;
ArrayList<Asteroid> rock;
 public void setup() 
{
  size(700,700);
  fly=new SpaceShip();
  shiny=new ArrayList<Star>();
  for(int i=0; i<10;i++){
    shiny.add(new Star());
  }
  rock=new ArrayList<Asteroid>();
  for(int i=0;i<10;i++){
    rock.add(new Asteroid());
  }
}
 public void draw() 
{
  background(0);
  fly.move();
  fly.show();
  for(int i=0;i<10;i++){
    shiny.get(i).show();
  }
 
  for(int i=0; i<rock.size();i++){
  if(dist(fly.getX(), fly.getY(), rock.get(i).getX(), rock.get(i).getY())>75){
    rock.get(i).setCrash(false);
  }else{
    rock.get(i).setCrash(true);
  }
}
  for(int i=0; i<rock.size(); i++){
    if (i!=rock.size()){
    if(rock.get(i).getCrash()==false){
      rock.get(i).move();
      rock.get(i).show();
     //fly.myColor= color(255);
    }else{
      fly.myColor=color(255,0,0);
      rock.remove(i);
      fly.myColor=color(255);
      if(rock.size()<9){
        rock.add(new Asteroid());
      }
    }
  }
}

}
 public void keyPressed()
 {
  if(key==CODED && keyCode==LEFT){fly.rotate(-5);} //Rotate Left
  if(key==CODED && keyCode==RIGHT){fly.rotate(5);} //Rotate Right
  if(key==CODED && keyCode==UP){fly.accelerate(0.1);}//accelerate forward
  if(key==CODED && keyCode==DOWN){fly.accelerate(-0.1);}//accelerate backward
  if(keyPressed==true && key==' '){
    fly.setX((int)(Math.random()*height));
    fly.setY((int)(Math.random()*height));
    fly.myDirectionX=0;
    fly.myDirectionY=0;
  }//hyperspace
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
    myColor= color(255,255,255);
    myCenterX=height/2;
    myCenterY=height/2;
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
  corners=10;
  xCorners = new int [corners];
  yCorners = new int [corners];
  xCorners[0]=48;
  yCorners[0]=0;
  xCorners[1]=30;
  yCorners[1]=-25;
  xCorners[2]=0;
  yCorners[2]=-48;
  xCorners[3]=-20;
  yCorners[3]=-36;
  xCorners[4]=-48;
  yCorners[4]=0;
  xCorners[5]=-26;
  yCorners[5]=21;
  xCorners[6]=-15;
  yCorners[6]=26;
  xCorners[7]=-3;
  yCorners[7]=38;
  xCorners[8]=3;
  yCorners[8]=38;
  xCorners[9]=15;
  yCorners[9]=48;
  myColor= color(167);
  myCenterX=(int)(0);
  myCenterY=(int)(Math.random()*height);
  myDirectionX=(int)(Math.random()*10)-5;
  myDirectionY=(int)(Math.random()*10)-5;
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

