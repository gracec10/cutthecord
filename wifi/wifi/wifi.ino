#include <WiFi.h>
#include <WebServer.h>
#include <WiFiUdp.h>
//#include <OSCMessage.h>


/* Put your SSID & Password */
const char* ssid = "ESP32_Grace";  // Enter SSID here
const char* password = "12345678";  //Enter Password here
char* lightStr;

float lightVal = 0;

/* Put IP Address details */
IPAddress local_ip(192,168,1,1);
IPAddress gateway(192,168,1,1);
IPAddress subnet(255,255,255,0);

WebServer server(80);

WiFiUDP udp;

void setup() {
  pinMode(32, INPUT);
  Serial.begin(115200);

  WiFi.softAP(ssid, password);
  WiFi.softAPConfig(local_ip, gateway, subnet);
  
    server.begin();
}

void loop(){
    lightVal = analogRead(32);
    udp.beginPacket("192.168.1.2",57222);
    udp.print(String(lightVal));
    udp.endPacket();
  
  //Wait for 1 second
  delay(1000);
  
}
