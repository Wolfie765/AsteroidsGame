//your variable declarations here
SpaceShip ssTurkey;
star [] staars = new  star[250];

//Asteroid [] rocks = new Asteroid[10];

ArrayList <Bullet> pellets;
ArrayList <Asteroid> boulders;

//Asteroid Color: fill(99,88,66);
public void setup() 
{
  //your code here
  size(400, 400);

boulders = new ArrayList <Asteroid>();
pellets = new ArrayList <Bullet>();
ssTurkey = new SpaceShip();

for(int i = 0; i < staars.length; i++)
  {
    staars[i] = new star();
  }



for(int i = 0; i < 10; i++)
  {
    boulders.add(new Asteroid());
  }
}

public void draw() 
{
  //your code here
  background(13, 10, 28);
  for(int i = 0; i < staars.length; i++)
  {
    staars[i].show();
  }

  for(int i = 0; i < boulders.size(); i++)
  {
  boulders.get(i).show();
  boulders.get(i).move();
  
    if(dist(ssTurkey.getX(), ssTurkey.getY(),boulders.get(i).getX(), boulders.get(i).getY()) < 15)
    {  
      boulders.remove(i);
    }

  }

  for(int i = 0; i < pellets.size(); i++)
    {
      pellets.get(i).show();
      pellets.get(i).move();
    }

  ssTurkey.show();
  ssTurkey.move();
  
  for(int j = 0; j < pellets.size(); j++)
  {
    for(int i = 0; i < boulders.size(); i++)
    {
      if(dist(pellets.get(j).getX(), pellets.get(j).getY(), boulders.get(i).getX(), boulders.get(i).getX())<15)
        boulders.remove(i);
    }
  }

}

public void keyPressed()
{
  if(key == 'h')
  {
    ssTurkey.setX((int)(Math.random()*400));
    ssTurkey.setY((int)(Math.random()*400));
    ssTurkey.setDirectionX(0);
    ssTurkey.setDirectionY(0);
    ssTurkey.setPointDirection((int)(Math.random()*360));
  }
  if(key == 'w')
  {
    ssTurkey.accelerate(0.3);
  }

  if(key == 's')
  {
    ssTurkey.accelerate(-0.3);
  }

  if(key == 'a')
  {
    ssTurkey.rotate(-5);
  }

  if(key == 'd')
  {
    ssTurkey.rotate(5);
  }

  if(key == ' ')
  {
    //System.out.println("adding bullet");
    pellets.add(new Bullet(ssTurkey));
  }
}

class SpaceShip extends Floater
{   
    //your code here  
  SpaceShip(){
    corners = 4;
    xCorners = new int [corners];
    yCorners = new int [corners];
    xCorners[0] = 4;
    xCorners[1] = -5;
    xCorners[2] = -2;
    xCorners[3] = -5;
    yCorners[0] = 0;
    yCorners[1] = -3;
    yCorners[2] = 0;
    yCorners[3] = 3;
    m_Color = 222;
    m_CenterX =  200;
    m_CenterY = 200;
    m_DirectionX = 0;
    m_DirectionY = 0;
    m_PointDirection = 0
    ;
  }

  public void setX(int x) {m_CenterX = x;}
  public int getX() {return (int) m_CenterX;}
  public void setY(int y) {m_CenterY = y;}
  public int getY() {return (int) m_CenterY;}
  public void setDirectionX(double x) {m_DirectionX = x;}
  public double getDirectionX() {return m_DirectionX;}
  public void setDirectionY (double y) {m_DirectionY = y;}
  public double getDirectionY() {return m_DirectionY;} 
  public void setPointDirection(int degrees) {m_PointDirection = degrees;}
  public double getPointDirection() {return m_PointDirection;}

}

class Asteroid extends Floater
{
  private int rotSpeed = (int)(Math.random()*5)-3;
public Asteroid(){
    corners = 4;
    int[] asteroidsX = {0, 5, 0, -5};
    int[] asteroidsY = {-5, 0, 5, 0};
    xCorners = asteroidsX;
    yCorners = asteroidsY;
    m_CenterX = (int)(Math.random()*400);
    m_CenterY = (int)(Math.random()*400);
    m_Color = 99;
    m_DirectionX = (int)(Math.random()*4)-2;
    m_DirectionY = (int)(Math.random()*5)-2;
    m_PointDirection = (int)(Math.random()*30);
  }
  
public void move()
  {
    rotate(rotSpeed);
    super.move();
  }

  public void setX(int x) {m_CenterX = x;}
  public int getX() {return (int) m_CenterX;}
  public void setY(int y) {m_CenterY = y;}
  public int getY() {return (int) m_CenterY;}
  public void setDirectionX(double x) {m_DirectionX = x;}
  public double getDirectionX() {return m_DirectionX;}
  public void setDirectionY (double y) {m_DirectionY = y;}
  public double getDirectionY() {return m_DirectionY;} 
  public void setPointDirection(int degrees) {m_PointDirection = degrees;}
  public double getPointDirection() {return m_PointDirection;}
}



abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int m_Color;   
  protected double m_CenterX, m_CenterY; //holds center coordinates   
  protected double m_DirectionX, m_DirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double m_PointDirection; //holds current direction the ship is pointing in degrees    
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
    double dRadians =m_PointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    m_DirectionX += ((dAmount) * Math.cos(dRadians));    
    m_DirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    m_PointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    m_CenterX += m_DirectionX;    
    m_CenterY += m_DirectionY;     

    //wrap around screen    
    if(m_CenterX >width)
    {     
      m_CenterX = 0;    
    }    
    else if (m_CenterX<0)
    {     
      m_CenterX = width;    
    }    
    if(m_CenterY >height)
    {    
      m_CenterY = 0;    
    }   
    else if (m_CenterY < 0)
    {     
      m_CenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(m_Color);   
    stroke(m_Color);    
    //convert degrees to radians for sin and cos         
    double dRadians = m_PointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+m_CenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+m_CenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

class star
{
private int m_x, m_y;
private int randomcolors;
star()
  {
    m_x = (int)(Math.random()*400);
    m_y = (int)(Math.random()*400);
  }

public void show()
  {

    point(m_x, m_y);


  }
}