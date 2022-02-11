class Flame
{
   private int lifespamMax;
  
   private PVector pos;
   private int nbrParticle;
   private float size;
   private float speed;
   private List<Particle> P;
   private PVector rotation;
   
   
   public Flame(float x, float y, float z, float xR, float yR, float zR, int nbrParticle, float size, float speed, int lifespamMax, float distTransitionColor, color bottom, color top)
   {
      this.lifespamMax = lifespamMax;
      this.pos = new PVector(x, y, z);
      this.nbrParticle = nbrParticle;
      this.size = size;
      this.speed = speed;
      this.rotation = new PVector(radians(xR), radians(yR), radians(zR));
      P = new ArrayList();
      for(int i = 0 ; i < nbrParticle ; i++)
      {
         P.add(new Particle(x, y, z, size/2, (int)random(0, lifespamMax), distTransitionColor, bottom, top));
         P.get(i).speedY(speed*2 - random(0, (speed*2)-0.01));
         setSpeed(i);
      }
   }
   
   public void setSpeed(int i)
   {
  
       P.get(i).speedZ(random(-speed, speed));
       P.get(i).speedX(random(-speed, speed));
     
   }
   
   public void draw()
   {
    
    scale(0.25);
    rotateX(rotation.x);
    rotateY(rotation.y);
    rotateZ(rotation.z);
    for(int i = 0 ; i < P.size() ; i++)
    {
       if(P.get(i).draw())
       {
         P.get(i).reset((int)random(0, lifespamMax)); 
       } 
      setSpeed(i);
     }
    rotateX(-rotation.x);
    rotateY(-rotation.y);
    rotateZ(-rotation.z);
     scale(4);
   }
}
