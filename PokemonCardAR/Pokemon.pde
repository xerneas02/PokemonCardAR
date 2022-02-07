class Pokemon
{
    private PShape model;
    private MultiNft nft;
    private String name;
    private boolean isLoad;
    
    public Pokemon(String name, PApplet parent)
    
    {
      this.name = name;
      nft = new MultiNft(parent, widthCapture, heightCapture,
      "camera_para.dat",
      NyAR4PsgConfig.CONFIG_PSG);
      nft.addNftTarget(name + "/Marker_" + name,80);
    }
    
    private void load()
    {
       if(!isLoad)
       {
          model = new PShape();
          model = loadShape(name + "/" + name + ".obj"); 
          isLoad = true;
          println(name + " load");
       }
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
         nft.endTransform();
         return true;
      }
      return false;
  }
}
