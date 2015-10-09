NormalParticle [] particles;
void setup()
{
  size(600,600);
  particles = new NormalParticle[10];
  for(int i = 0; i < particles.length; i++)
  {  
    particles[i] = new NormalParticle();
  }
  //particles = new NormalParticle();
}
void draw()
{
  for(int i = 0; i < particles.length; i++)
  {
    particles[i].move();
    particles[i].show();
  }
}
class NormalParticle implements Particle
{
  double x, y, angle, speed;
  int myColor;
  NormalParticle()
  {
    x = Math.random()*200+200;
    y = Math.random()*200+200;
    myColor = color((int)(Math.random()*51), 0, (int)(Math.random()*102)+50);
  } 
  void move()
  {
    x = x + speed*Math.cos(angle);
    y = y + speed*Math.sin(angle);
  }
  void show()
  {
    fill(myColor);
    ellipse((float)x, (float)y, 10, 10);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle //uses an interface
{
  
}
class JumboParticle //uses inheritance
{
  
}
