import gifAnimation.*;


import hypermedia.net.*;
import processing.sound.*;
SinOsc sine;

int PORT = 57222;
String IP = "192.168.1.2";

UDP udp;  // define the UDP object

int light;
int left;
int right;

// art
PImage space;
Gif sun;
SoundFile sos;
float size = 200;
float x = 720;
float y = 450;
float sun_x = 1300;

void setup() {
  udp = new UDP( this, PORT, IP );  // create a new datagram connection on port 6000
  //udp.log( true );         // <-- printout the connection activity
  udp.listen( true );           // and wait for incoming message
  //sine = new SinOsc(this);
  //sine.freq(0);
  //sine.play();
  
  // art
  fullScreen();
  background(0);
  
  space = loadImage("space.jpg");
  
  sun = new Gif(this, "sun.gif");
  sun.play();
  //sos = new SoundFile(this, "sun.mp3");
}

void draw()
{
  imageMode(CENTER);
  image(space, x, y, 3000, 900);
  image(sun, sun_x, y, size, size);
}

void receive( byte[] data ) {          // <-- default handler
  String value = new String(data);
  light = int(value.split(",")[0]);
  left = int(value.split(",")[1]);
  println(light + ", " + left);
  if (left > 1000){
    x = x - 8;
    sun_x = sun_x - 8;
  }
  size = light / 1.67;
  //void receive( byte[] data, String ip, int port ) {   // <-- extended handler
  //float data1 = 0;
  //for (int i=0; i < data.length; i++)
  //  print(float(data));
    //data1 = float(data[i]) / 1.67;
  //size = data1;
  //print(data1);
}
