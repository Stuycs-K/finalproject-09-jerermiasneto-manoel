//image_decoder
import java.util.Arrays;
final static int ENCODE = 0;
final static int DECODE = 1;
final static int BW = 0;
final static int NRMLZTN = 1;

//default settings
String InputShown = "inputshown.png";
String InputHidden = "inputhidden.png";
PImage in1;
PImage in2;
PImage out;
String Output = "output.png";
int MODE1 = 0;
int MODE2 = 0;
int DISPLAYMODE = 1;

void draw(){
  if(DISPLAYMODE == 0){
    exit();
    return;
  }
  
}
void encode(){
  in2.filter(GRAY);
  in1.loadPixels();
  int[][] in1arr = new int[in1.height][in1.width];
  int[][] in2arr = new int[in2.height][in2.width];
  for(int i =0; i < in1.height; i ++){
    for (int k = 0; k < in1.width; k ++){
      in1arr[i][k] = 
    }
  }
}
void decode(){
  println("guh");
}



void setup(){
  in1 = loadImage(InputShown);
  in2 = loadImage(InputHidden);
  windowResize(in1.width, in1.height);
  if(in2.height > in1.height || in2.width > in1.width){
    println("ImageHidden (-i) is larger than ImageShown (-h)");
    exit();
  }
  if(MODE1 == ENCODE){
    encode();
  }
  else{
    decode();
  }
}

void settings() {
  if (args == null){
    println("no args provided");
    println("flags encode: -e -i IMAGETOHIDE -h IMAGETOHIDEINPUTIN -o OUPUTFILENAME -m MODE");
    println("flags decode: -d -i INPUT -o OUTPUTFILENAME -m MODE");
    //return;
  }
  //if(!parseArgs()){
    //println("parsing failure (bruh)");
    //return;
  //}
}

boolean parseArgs(){
  for(int i = 0; i < args.length; i ++){
    if (args[i].equals("-e")){
      MODE1 = 0;
    }
    if (args[i].equals("-d")){
      MODE1 = 1;
    }
    if (args[i].equals("-i")){
      if(args[i+1] != null){
        InputHidden = args[i+1];
      }
      else{
        println ("-i requires filename as next argument");
        return false;
      }
    }
    if (args[i].equals("-h")){
      if(args[i+1] != null){
        InputShown = args[i+1];
      }
      else{
        println ("-h requires filename as next argument");
        return false;
      }
    }
    if (args[i].equals("-o")){
      if(args[i+1] != null){
        Output = args[i+1];
      }
      else{
        println ("-o requires filename as next argument");
        return false;
      }
    }
    if (args[i].equals("-m")){
      if(args[i+1] != null){
        if((args[i+1].toLowerCase()).equals("bw") || (args[i+1].toLowerCase()).equals("blackwhite")){
          MODE2 = BW;
        }
        else if((args[i+1].toLowerCase()).equals("nrmlztn") || (args[i+1].toLowerCase()).equals("normalization")){
          MODE2 = NRMLZTN;
        }
        else{
          println ("-m requires mode as next argument (bw / nrmztn)");
          return false;
        }
      }
      else{
        println ("-m requires mode as next argument");
        return false;
      }
    }
    if (args[i].equals("-v")){
      DISPLAYMODE = 1;
    }
  }
  return true;
}
