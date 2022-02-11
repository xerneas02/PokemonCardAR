import processing.video.*;    
import jp.nyatla.nyar4psg.*;
import java.util.*; 


//Camera setting
final int widthCapture = 640;  
final int heightCapture = 480; 
final int numPixels=widthCapture*heightCapture;
final int fpsCapture=30;

//Speed of the rotation
float speed = 0.1;
public boolean doRoatate = false;

//To know if a camera as been selected
boolean cameraSelected = false;

//The default rotion of the pokemon
float rotation = -PI/2;

//Camera init
String[] cameras;    
Capture webCam;

//The file of the code
File mainFile;

//The list of all the pokemon in the file
List<Card> pokemon;

//The list of all pokemon curently load
List pokemonLoad; 


char lastKey;
int i = 0;

final int maxNumberOfCrad = 6;



void setup() {
  //The setup function who initialize all the variable
  noStroke();
  size(1280, 920, P3D); 
  surface.setTitle("PokemonCardRA");
  colorMode(RGB, 255, 255, 255);
  surface.setResizable(true);
  
  pokemonLoad = new ArrayList();
  pokemon = new ArrayList();
  
  mainFile = new File(sketchPath() + "/data");
  for(String name:mainFile.list())
  {
     if(!name.equals("camera_para.dat"))pokemon.add(new Card(name, this)); 
  }
  
  
  cameras = Capture.list();
  if (cameras.length == 0) {
      println("Pas de Webcam sur cet ordinateur !");
      exit();
  }
  else if (cameras.length > 1)
  {
    println("Which webcam do you want ?");
    for(int j = 0; j < cameras.length; j++)
    {
      println(j + " : " + cameras[j]);
    }
  }
}


void draw() {
    
  if(!cameraSelected) 
  {
    //Get the webCam selected
    int indexCam = 0;
    if(cameras.length > 1){indexCam = keyAnalyzer(lastKey);}
    
    if(indexCam >= 0 && indexCam < cameras.length)
    {
      webCam = new Capture(this, widthCapture, heightCapture, cameras[indexCam], fpsCapture);
      webCam.start();
      cameraSelected = true;
    }
  }
  else if (webCam.available() == true) {
    i = (i + 1)%pokemon.size(); //Change the id of the pokemon check
    lights();
    
    if(doRoatate) 
    {
      //If the pokmon should rotate this apply the rotation
      rotation += speed*30/frameRate;;
      rotation = rotation%(2*PI);
    }
    
    webCam.read();
    webCam.loadPixels();
    
    background(0); 
    image(webCam, 0, 0, width, height);

    boolean testPok = true;
    for(int j = 0; j < pokemonLoad.size(); j++)
    {
       //test the pokemon in the pokemonLoad list to see if there are still on screen
       int k = (int)pokemonLoad.get(j);
       if(!pokemon.get(k).testAndDraw())pokemonLoad.remove(j);
       if(k == i) testPok = false;
    }
    
    //test the pokemon i if he isn't alerady in the pokemonLoad list
    if(pokemonLoad.size() <= maxNumberOfCrad && testPok && pokemon.get(i).testAndDraw())pokemonLoad.add(i); 
    
    webCam.updatePixels();
  }
}

int keyAnalyzer(char c)
{
    if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
    {
        return int(c)-48;
    }
    else
    {
        return -1;
    }
}

void keyPressed(){
  lastKey = key;
  if(!cameraSelected) print(lastKey + "\n");
  switch(key){
    case 'r' : doRoatate = !doRoatate; break;
    case 'l' :
    {
       for(int j = 0; j < pokemonLoad.size(); j++)
       {
          pokemon.get((int)pokemonLoad.get(j)).reload();
       }
    }
  }
}
