Particle [] particles;
void setup()
{
  size(600, 600);
  particles = new Particle[800];
  for (int i = 0; i < particles.length; i++)
  {  
    particles[i] = new NormalParticle();
  }
  for (int a = 0; a < 3; a++)
  {
    particles[a] = new OddballParticle();
  }
  particles[4] = new JumboParticle();
}

void draw()
{
  background(20);
  for (int i = 0; i < particles.length; i++)
  {
      particles[i].move();
      particles[i].show();
  }
}

void mousePressed()
{
  setup();
}

class NormalParticle implements Particle
{
  double x, y, angle, speed;
  int myColor, mySize;
  NormalParticle()
  {
    x = Math.random()*20+290;
    y = Math.random()*20+290;
    speed =  Math.random()*5;
    mySize = (int)(Math.random()*5)+4;
    angle = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*51), 0, (int)(Math.random()*102)+50);
  } 
  public void move()
  {
    x = x + speed*Math.cos(angle);
    y = y + speed*Math.sin(angle);
    if(x < 0 || x > 600 || y < 0 || y > 600)
    {
      x = 300;
      y = 300;
      angle = Math.random() * 2 * Math.PI;
    }
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)x, (float)y, mySize, mySize);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle //uses an interface
{
  double x, y, angle, speed;
  int myColor;
  OddballParticle()
  {
    x = Math.random()*20+290;
    y = Math.random()*20+290;
    speed = Math.random()*0.7+0.5;
    angle = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  public void move()
  {
    x = x + speed*Math.cos(angle);
    y = y + speed*Math.sin(angle);
    if(x < 0 || x > 600 || y < 0 || y > 600)
    {
      x = x - speed*Math.cos(angle);
      y = y - speed*Math.sin(angle);
      angle = Math.random() * 2 * Math.PI;
    }
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)x, (float)y, 15, 15);
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{
  JumboParticle()
  {
    myColor = color(50,0,100);
    mySize = 39;
    speed = 0.4;
  }
}

