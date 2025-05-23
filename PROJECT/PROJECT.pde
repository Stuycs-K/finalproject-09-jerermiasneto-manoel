//image_decoder
import java.util.Arrays;
final static int ENCODE = 0;
final static int DECODE = 1;
final static int BW = 0;
final static int NRMLZTN = 1;

//default settings
String InputShown = "inputshown.png";
String InputHidden = "inputhidden.png";
String Output = "output.png";
int MODE1 = 0;
int MODE2 = 0;
int DISPLAYMODE = 0;

void draw(){
  if(DISPLAYMODE == 0){
    exit();
    return;
  }
}

void setup(){
  settings();
  check();
  
}
void check(){
  
}

void settings() {
  size(1200, 600);
  if (args == null){
    println("no args provided");
    println("flags encode: -e -i IMAGETOHIDE -h IMAGETOHIDEINPUTIN -o OUPUTFILENAME -m MODE");
    println("flags decode: -d -i INPUT -o OUTPUTFILENAME -m MODE");
    return;
  }
  if(!parseArgs()){
    println("parsing failure (bruh)");
    return;
  }
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
