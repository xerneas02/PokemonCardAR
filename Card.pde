import java.util.*;
import java.io.*;

class Card
{
    private PShape model;
    private MultiNft nft;
    private String name;
    private boolean isLoad;
    private Flame F;
    private boolean flame = false;
    private PVector flamePos;
    private PVector flameRotation;
    private int nbrPart;
    private float size;
    private float speed;
    private int maxLifeSpam;
    private float distTransitionColor;
    private color bottom;
    private color top;
    
    public Card(String name, PApplet parent)
    
    {
      this.name = name;
      nft = new MultiNft(parent, widthCapture, heightCapture,
      "camera_para.dat",
      NyAR4PsgConfig.CONFIG_PSG);
      nft.addNftTarget(name + "/Marker_" + name,80);
      initFlame();
    }
    
    private void load()
    {
       if(!isLoad)
       {
          model = new PShape();
          model = loadShape(name + "/" + name + ".obj"); 
          isLoad = true;
          println(name + " load");
          if(flame) F = new Flame(flamePos.x, flamePos.y, flamePos.z, flameRotation.x, flameRotation.y, flameRotation.z, nbrPart, size, speed, maxLifeSpam, distTransitionColor, bottom, top);
       }
    }
    
    private void initFlame()
    {
      File flameFile = new File(sketchPath() + "/data/" + name + "/flame.config");
      if(flameFile.exists())
      {
          flame = true;
          try{
            Scanner sc = new Scanner(flameFile);
            sc.useDelimiter(" |\\n");
            flamePos = new PVector();
            if(sc.hasNextLine()) 
            {                
                sc.next();
                flamePos.add(Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()));
            }
            flameRotation = new PVector();
            if(sc.hasNextLine()) 
            {
                sc.next();
                flameRotation.add(Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()));
            }
            nbrPart = 1;
            if(sc.hasNextLine()) 
            {
                sc.next();
                nbrPart = Integer.parseInt(sc.next().trim());
            }
            size = 1;
            if(sc.hasNextLine()) 
            {
                sc.next();
                size = Float.parseFloat(sc.next().trim());
            }
            speed = 0.0;
            if(sc.hasNextLine()) 
            {
                sc.next();
                speed = Float.parseFloat(sc.next().trim());
            }
            maxLifeSpam = 1;
            if(sc.hasNextLine()) 
            {
                sc.next();
                maxLifeSpam = Integer.parseInt(sc.next().trim());
            }
            distTransitionColor = 1;
            if(sc.hasNextLine()) 
            {
                sc.next();
                distTransitionColor = Float.parseFloat(sc.next().trim());
            }
            bottom = color(RGB, 0, 0, 0);
            if(sc.hasNextLine()) 
            {
                sc.next();
                bottom = color(Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()));
            }
            top = color(RGB, 0, 0, 0);
            if(sc.hasNextLine()) 
            {
                sc.next();
                top = color(Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()), Float.parseFloat(sc.next().trim()));
            }
            
          }catch(Exception e){println(e);}   
       }
       else
       {
          flame = false;      
       }
    }
    
    public void reload()
    {
       initFlame();
       if(flame) F = new Flame(flamePos.x, flamePos.y, flamePos.z, flameRotation.x, flameRotation.y, flameRotation.z, nbrPart, size, speed, maxLifeSpam, distTransitionColor, bottom, top);
    }
    
    public boolean testAndDraw()
    {
      nft.detect(webCam);
      if (nft.isExist(0)) {
         load();
         nft.beginTransform(0);
         translate(-40, 40,  20); 
         scale(40.0);
         rotateX(PI/2);
         rotateY(rotation);
         shape(model);

         if(flame)F.draw();
         nft.endTransform();
         
         return true;
      }
      return false;
  }
}
