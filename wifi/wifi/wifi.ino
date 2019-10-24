#include <WiFi.h>
#include <WebServer.h>
#include <WiFiUdp.h>
//#include <OSCMessage.h>


/* Put your SSID & Password */
const char* ssid = "ESP32_GRACE";  // Enter SSID here
const char* password = "1234567890";  //Enter Password here

float light = 0;
float right = 0;

/* Put IP Address details */
IPAddress local_ip(192,168,1,1);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);

WebServer server(80);

WiFiUDP udp;

void setup() {  
  Serial.begin(115200);

  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_ip, gateway, subnet);
  pinMode(right, INPUT);
    server.begin();
}

void loop(){
    light = analogRead(33); 
    right = analogRead(32); // green
    udp.beginPacket("192.168.1.2",57222);
    udp.print(String(light) + "," + String(right));
    udp.endPacket();
  
  //Wait for 1 second
  delay(100);
  
}
