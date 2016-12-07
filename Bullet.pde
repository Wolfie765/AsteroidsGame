class Bullet extends Floater
{
	Bullet(SpaceShip ssTurkey)
	{
		m_CenterX = ssTurkey.getX();
		m_CenterY = ssTurkey.getY();
		m_PointDirection = ssTurkey.getPointDirection();
		double dRadians = m_PointDirection*(Math.PI/180);
		m_DirectionX = 5*Math.cos(dRadians) + ssTurkey.getDirectionX();
		m_DirectionY = 5*Math.sin(dRadians) + ssTurkey.getDirectionY();
	
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

	public void show()
	{
		fill(244, 188, 66);
		noStroke();
		ellipse((float)m_CenterX, (float)m_CenterY, 3, 3);
	}	
	public void move()
	  {
		m_CenterX += m_DirectionX;    
    	m_CenterY += m_DirectionY;
	  }
}