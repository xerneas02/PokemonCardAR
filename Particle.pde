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
   private float distTransitionColor;
   private color bottom;
   private float alphaB;
   private float alphaTransi;
   private PVector colorTransi;
   
   public Particle(float x, float y, float z, float r, int life, float distTransitionColor,color bottom, color top)
   {
       this.distTransitionColor = distTransitionColor;
       this.r = r;
       this.rotationStart = rotation;
       center = new PVector(x, y, z);
       
       pos = new PVector();
       getRandomPos();
       this.bottom = bottom;
       
       this.alphaB = alpha(bottom);
       alphaTransi = alpha(top)-alpha(bottom);
       colorTransi = new PVector((red(top)-red(bottom)), (green(top)-green(bottom)), (blue(top)-blue(bottom)));
       
       
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
       this.life = !doRoatate ? life : life/3;
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
       float dist = pos.dist(center);
       colore = color(colorTransi.x*distTransitionColor*(dist+rotationDist)+red(bottom), colorTransi.y*distTransitionColor*(dist+rotationDist)+green(bottom), colorTransi.z*distTransitionColor*(dist+rotationDist)+blue(bottom), alphaTransi*distTransitionColor*(dist+rotationDist)+alphaB);
       sphere.setFill(color(colore));
       pos.add(speed.x*30/(float)frameRate, speed.y*30/(float)frameRate, speed.z*30/(float)frameRate);
       noStroke();
       if(doRoatate) pos.z -= 11*speed.z;       
       translate(-pos.x, pos.y, pos.z);    
       shape(sphere);
       lifeSpam++;
       translate(pos.x, -pos.y, -pos.z);
       rotateY(-rotationStart);
       rotateY(rotation);
       return (life < lifeSpam);
   }
  
  
  
  
}
