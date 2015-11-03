{
     x = Math.random()*20+290;
     y = Math.random()*20+290;
-    speed = Math.random()*0.5+0.3;
+    speed = Math.random()*0.7+0.5;
     angle = Math.random()*2*Math.PI;
     myColor = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
   }
 @@ -83,8 +83,8 @@ class OddballParticle implements Particle //uses an interface
     y = y + speed*Math.sin(angle);
     if(x < 0 || x > 600 || y < 0 || y > 600)
     {
-      x = 300;
-      y = 300;
+      x = x - speed*Math.cos(angle);
+      y = y - speed*Math.sin(angle);
       angle = Math.random() * 2 * Math.PI;
     }
   }
 @@ -99,7 +99,9 @@ class JumboParticle extends NormalParticle//uses inheritance
 {
   JumboParticle()
   {
-    mySize = 30;
+    myColor = color(50,0,100);
+    mySize = 39;
     speed = 0.4;
   }
 }
