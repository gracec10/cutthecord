import gifAnimation.*;


import hypermedia.net.*;
import processing.sound.*;
SinOsc sine;

UDP udp;  // define the UDP object

// art
PImage space;
Gif sun;
SoundFile sos;

void setup() {
  udp = new UDP( this, 57222 );  // create a new datagram connection on port 6000
  //udp.log( true );         // <-- printout the connection activity
  udp.listen( true );           // and wait for incoming message
  sine = new SinOsc(this);
  sine.freq(0);
  sine.play();
  
  // art
  fullScreen();
  background(0);
  
  space = loadImage("space.jpg");
  
  sun = new Gif(this, "sun.gif");
  sun.play();
  sos = new SoundFile(this, "sun.mp3");
}

void draw()
{
  
}

void receive( byte[] data ) {          // <-- default handler
  if (data != null) {
  //void receive( byte[] data, String ip, int port ) {   // <-- extended handler
  int data1 = 0;
  for (int i=0; i < data.length; i++)
    data1 = data1 * 10 + int(data[i]);
  sine.freq(data1);
  }
}
