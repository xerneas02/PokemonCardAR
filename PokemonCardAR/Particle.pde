class Particle
{
   private float size;
   private color colore;
   private PVector speed;
   private PVector pos;
   private PVector center;
   private PShape sphere;
   private int life;
   private int lifeSpam = 0;
   private float r;
   private float rotationStart;
   
   public Particle(float x, float y, float z, float r, int life)
   {
       this.r = r;
       this.rotationStart = rotation;
       center = new PVector(x, y, z);
       
       pos = new PVector();
       getRandomPos();
       
       colore = color(RGB, 255, 0, 0);
       speed = new PVector(0, 0, 0);
       this.size = random(0.1, 0.2);
       sphere = createShape(SPHERE, size/2);
       this.life = life;
   }
   
   private void getRandomPos(){
    pos.x = 0;
    pos.y = 0;
    pos.z = 0;
    float randomAngleXZ = random(0, TWO_PI);
    float randomAngleY = random(0, TWO_PI);
    float randomDist = random(0, r);
    pos.x = cos(randomAngleY)*(cos(randomAngleXZ+PI)*randomDist);
    pos.y = cos(PI/2+randomAngleY)*randomDist;
    pos.z = cos(randomAngleY)*(cos(PI/2-randomAngleXZ)*randomDist);
    pos.x += center.x;
    pos.y += center.y;
    pos.z += center.z;
    
    
   }
   
   public void speedX(float s)
   {
     speed.x = s;
   }
   
   public void speedY(float s)
   {
     speed.y = s;
   }
   
   public void speedZ(float s)
   {
     speed.z = s;
   }
   
   public void reset(int life)
   {
       this.rotationStart = rotation;
       this.life = !doRoatate ? life : life/2;
       getRandomPos();
       speed.x = 0;
       speed.z = 0;
       lifeSpam = 0;
   }
   
   public boolean draw()
   {
       rotateY(-rotation);
       rotateY(rotationStart);
       float rotationDist = abs((rotation >= rotationStart ? rotation : rotation + TWO_PI) - rotationStart);
       colore = color(255, 255*1.5/(pos.dist(center)+0.01+rotationDist)/2, 0);
       sphere.setFill(color(colore));
       pos.add(speed.x*30/frameRate, speed.y*30/frameRate, speed.z*30/frameRate);
       noStroke();
       if(doRoatate) pos.z -= 11*speed.z;       
       translate(-pos.x, pos.y, pos.z);    
       shape(sphere);
       lifeSpam++;
       translate(pos.x, -pos.y, -pos.z);
       rotateY(-rotationStart);
       rotateY(rotation);
       return (life < lifeSpam && !doRoatate)|| (life/2 < lifeSpam && doRoatate);
   }
  
  
  
  
}
