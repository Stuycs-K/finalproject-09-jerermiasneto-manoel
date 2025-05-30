//image_decoder
import java.util.Arrays;
final static int ENCODE = 0;
final static int DECODE = 1;
final static int BW = 0;
final static int COLOR = 1;

//default settings
String InputShown = "input.png";
String InputHidden = "input2.png";
PImage in1;
PImage in2;
PImage out;
String Output = "output.png";
int MODE1 = 1;
int MODE2 = 1;
int DISPLAYMODE = 1;

void draw(){
  if(DISPLAYMODE == 0){
    exit();
    return;
  }
  image(in1, 0 ,0);
}
int getpixel(int x, int y, int h){
  return y * h + x;
}
int[] tobitbw(int in){
  int[] out = new int[9];
  out[0] = 0;
  out[1] = in&128;
  out[2] = in&64;
  out[3] = in&32;
  out[4] = in&16;
  out[5] = in&8;
  out[6] = in&4;
  out[7] = in&2;
  out[8] = in&1;
  for(int i = 0; i < 9; i ++){
    if(out[i] > 0){
      out[i] = 1;
    }
  }
  return out;
}

int toint(int[] in){
  int c =  (in[1]*128) + (in[2]*64) + (in[3]*32) + (in[4]*16) + (in[5]*8) + (in[6]*4) + (in[7]*2) + (in[8]*1);
  return c;
}

void printarr(int[] arr){
  for(int i = 0; i < arr.length; i ++){
    print(arr[i]);
  }
  println("");
}
void encode(){
  if(MODE2 == BW){
    in2.filter(GRAY);
    in1.loadPixels();
    in2.loadPixels();
    for(int i = (in1.height - in2.height)/2, i2 = 0; i < (in1.height - in2.height)/2 + in2.height; i++, i2 ++){
      for(int k = (in1.width - in2.width)/2, k2 = 0; k < (in1.width - in2.width)/2 + in2.width; k++, k2 ++){
        //extract value from in2 pixel
        //turn it into 3 seperate values that can be stored in red green and bluc of in1
        //put it in
        int pixelval = (int)red(color(in2.pixels[getpixel(k2, i2, in2.width)]));
        // ^ value of the BW pixel
        int[] valarr = tobitbw(pixelval);
        // ^ bit array of the BW pixel
        int pixelvalr = (int)red(color(in1.pixels[getpixel(k, i, in1.width)]));
        int pixelvalg = (int)green(color(in1.pixels[getpixel(k, i, in1.width)]));
        int pixelvalb = (int)blue(color(in1.pixels[getpixel(k, i, in1.width)]));
        //color values of in1 pixel (to hide the BW bits of color in)
        int []valarrr = tobitbw(pixelvalr);
        int []valarrg = tobitbw(pixelvalg);
        int []valarrb = tobitbw(pixelvalb);
        valarrr[6] = valarr[0];
        valarrr[7] = valarr[1];
        valarrr[8] = valarr[2];
        valarrg[6] = valarr[3];
        valarrg[7] = valarr[4];
        valarrg[8] = valarr[5];
        valarrb[6] = valarr[6];
        valarrb[7] = valarr[7];
        valarrb[8] = valarr[8];
        //inscribing the bw value into the R,G,B values
        pixelvalr = toint(valarrr);
        pixelvalg = toint(valarrg);
        pixelvalb = toint(valarrb);
        //turning it back into rgb values
        in1.pixels[getpixel(k, i, in1.width)] = color(pixelvalr, pixelvalg,pixelvalb);
      }
    }  
  }
  else if (MODE2 == COLOR){
    in2.loadPixels();
    in1.loadPixels();
    for(int i = (in1.height - in2.height)/2, i2 = 0; i < (in1.height - in2.height)/2 + in2.height; i++, i2 ++){
      for(int k = (in1.width - in2.width)/2, k2 = 0; k < (in1.width - in2.width)/2 + in2.width; k++, k2 ++){
        int pixelvalr = (int)red(color(in2.pixels[getpixel(k2, i2, in2.width)]));
        int pixelvalg = (int)green(color(in2.pixels[getpixel(k2, i2, in2.width)]));
        int pixelvalb = (int)blue(color(in2.pixels[getpixel(k2, i2, in2.width)]));
        int[] valarrr = tobitbw(pixelvalr);
        int[] valarrg = tobitbw(pixelvalg);
        int[] valarrb = tobitbw(pixelvalb);
        int bigvalr = (int)red(color(in1.pixels[getpixel(k, i, in1.width)]));
        int bigvalb = (int)blue(color(in1.pixels[getpixel(k, i, in1.width)]));
        int bigvalg = (int)green(color(in1.pixels[getpixel(k, i, in1.width)]));
        int[] bigarrr = tobitbw(bigvalr);
        int[] bigarrg = tobitbw(bigvalg);
        int[] bigarrb = tobitbw(bigvalb);
        bigarrr[6] = valarrr[1];
        bigarrr[7] = valarrr[2];
        bigarrr[8] = valarrr[3];
        bigarrg[6] = valarrg[1];
        bigarrg[7] = valarrg[2];
        bigarrg[8] = valarrg[3];
        bigarrb[6] = valarrb[1];
        bigarrb[7] = valarrb[2];
        bigarrb[8] = valarrb[3];
        pixelvalr = toint(bigarrr);
        pixelvalg = toint(bigarrg);
        pixelvalb = toint(bigarrb);
        in1.pixels[getpixel(k, i, in1.width)] = color(pixelvalr, pixelvalg,pixelvalb);
      }
    }
  }
  in1.updatePixels();
  in1.save(Output);
}
void decode(){
  if(MODE2 == BW){
    in1.loadPixels();
    for(int i = 0; i < (in1.pixels).length; i ++){
      int pixelvalr = (int)red(color(in1.pixels[i]));
      int pixelvalg = (int)green(color(in1.pixels[i]));
      int pixelvalb = (int)blue(color(in1.pixels[i]));
      //getting rgb vals
      int []valarrr = tobitbw(pixelvalr);
      int []valarrg = tobitbw(pixelvalg);
      int []valarrb = tobitbw(pixelvalb);
      //getting bits of rgb values
      int[] valarr = new int[9];
      valarr[1]=valarrr[6];
      valarr[2]=valarrr[7];
      valarr[2]=valarrr[8];
      valarr[3]=valarrg[6];
      valarr[4]=valarrg[7];
      valarr[5]=valarrg[8];
      valarr[6]=valarrb[6];
      valarr[7]=valarrb[7];
      valarr[8]=valarrb[8];
      int pixelval = toint(valarr);
      in1.pixels[i] = color(pixelval);
    }
  }
  else if (MODE2 == COLOR){
    for(int i = 0 ; i < (in1.pixels).length; i++){
      int pixelvalr = (int)red(color(in1.pixels[i]));
      int pixelvalg = (int)green(color(in1.pixels[i]));
      int pixelvalb = (int)blue(color(in1.pixels[i]));
      //getting rgb vals
      int []valarrr = tobitbw(pixelvalr);
      int []valarrg = tobitbw(pixelvalg);
      int []valarrb = tobitbw(pixelvalb);
      for(int k = 0; k < 6; k ++){
        valarrr[k] = 0;
        valarrg[k] = 0;
        valarrb[k] = 0;
      }
      int valr = toint(valarrr);
      int valg = toint(valarrg);
      int valb = toint(valarrb);
      valr = (valr ) * 36;
      valg = (valg ) * 36;
      valb = (valb ) * 36;
      in1.pixels[i] = color(valr, valg,valb);
    }
  }
  in1.updatePixels();
  in1.save(Output);
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
        else if((args[i+1].toLowerCase()).equals("color") || (args[i+1].toLowerCase()).equals("clr")){
          MODE2 = COLOR;
        }
        else{
          println ("-m requires mode as next argument (bw / clr)");
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
