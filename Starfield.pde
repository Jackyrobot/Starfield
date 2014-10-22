Particle[] particles;
void setup()
{
	size(600, 600);
	background(22, 23, 36);
	particles = new Particle[801];
	for(int i = 0; i < 799; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[799] = new JumboParticle();
	particles[800] = new OddballParticle();
}
void draw()
{
	background(22, 23, 36);
	for(int i = 0; i < particles.length; i++)
	{
		particles[i].move();
		particles[i].show();
	}
}
void mousePressed()
{
	for(int i = 0; i < 799; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[799] = new JumboParticle();
	particles[800] = new OddballParticle();
}
class NormalParticle implements Particle
{
	int myColor;
	double x, y, angle, speed, mySize;
	NormalParticle()
	{
		myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
		x = Math.random() * 200 + 200;
		y = Math.random() * 200 + 200;
		angle = Math.random() * 2 * Math.PI;
		speed = (Math.random() * 2) +2;
		mySize = Math.random() * 10 + 1;
	}
	public void move()
	{
		x = x + Math.cos(angle) * speed;
		y = y + Math.sin(angle) * speed;
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
		fill(myColor, 150);
		ellipse((float) x, (float) y, (float)mySize, (float)mySize);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int myColor;
	double x, y, angleX, angleY, speed;
	OddballParticle()
	{
		myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
		x = Math.random() * 200 + 200;
		y = Math.random() * 200 + 200;
		angleX = Math.random() * 2 * Math.PI;
		angleY = Math.random() * 2 * Math.PI;
		speed = (Math.random() * 3) - 3;
	}
	public void move()
	{
		x = x + Math.cos(angleX) * speed;
		y = y + Math.sin(angleY) * speed;
		if(x < 0 || x > 600 || y < 0 || y > 600)
		{
			x = 300;
			y = 300;
			angleY = Math.random() * 2 * Math.PI;
		}
	}
	public void show()
	{
		noStroke();
		fill(myColor);
		ellipse((float) x, (float) y, 30, 30);
		strokeWeight(8);
		stroke(150, 150, 150, 200);
		noFill();
		arc((float) x-15, (float) y-10, 60, 30, 0, PI/2);
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		mySize = 40;
	}
}

