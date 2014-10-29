import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

//Vivian Lam, AP Computer Science, Mod 6/7, AsteroidsGame Part1
SpaceShip bum;
Star[] shiny;
 public void setup() 
{
  size(400,400);
  bum=new SpaceShip();
  shiny=new Star[(int)(Math.random()*75)];
  for(int i=0; i<shiny.length;i++){
    shiny[i]=new Star();
  }
}
 public void draw() 
{
  background(0);
  bum.move();
  bum.show();
  for(int i=0;i<shiny.length;i++){
    shiny[i].show();
  }

}
 public void keyPressed()
 {
  if(key==CODED && keyCode==LEFT){bum.rotate(-5);} //Rotate Left
  if(key==CODED && keyCode==RIGHT){bum.rotate(5);} //Rotate Right
  if(key==CODED && keyCode==UP){bum.accelerate(0.05f);}//accelerate forward
  if(key==CODED && keyCode==DOWN){bum.accelerate(-0.05f);}//accelerate backward
  if(keyPressed==true && key==' '){
    bum.setX((int)(Math.random()*400));
    bum.setY((int)(Math.random()*400));
    bum.myDirectionX=0;
    bum.myDirectionY=0;
  }//hyperspace
 }
 class SpaceShip extends Floater  
{   
  public SpaceShip()
  {
    corners= 12;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = 16;
    yCorners[0] = 0;
    xCorners[1] = 10;
    yCorners[1] = -6;
    xCorners[2] = 10;
    yCorners[2] = -3;
    xCorners[3] = -8;
    yCorners[3] = -3;
    xCorners[4] = -12;
    yCorners[4] = -10;
    xCorners[5] = -12;
    yCorners[5] = -3;
    xCorners[6] = -16;
    yCorners[6] = 0;
    xCorners[7] = -12;
    yCorners[7] = 3;
    xCorners[8] = -12;
    yCorners[8] = 10;
    xCorners[9] = -8;
    yCorners[9] = 3;
    xCorners[10] = 10;
    yCorners[10] = 3;
    xCorners[11] = 10;
    yCorners[11] = 6;  
    myColor= color(255,255,255);
    myCenterX=200;
    myCenterY=200;
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
    starX=(int)(Math.random()*400);
    starY=(int)(Math.random()*400);
  }
  public void show()
  {
    fill(255);
    noStroke();
    ellipse(starX,starY,5,5);
  }
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

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
