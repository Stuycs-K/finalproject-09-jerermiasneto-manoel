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

void setup() {
  size(1200, 600);
  if (args == null){
    println("no args provided");
    println("flags encode: -e -i INPUTFILENAME -h IMAGETOHIDEINPUTIN -o OUPUTFILENAME -m MODE");
    println("flags decode: -d -i INPUTFILENAME -o OUTPUTFILENAME -m MODE");
    return;
  }
}
