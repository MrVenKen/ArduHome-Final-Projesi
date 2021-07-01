#include <SPI.h>                          //SPI kütüphanemizi tanımlıyoruz.
#include <MFRC522.h>                      //MFRC522 kütüphanemizi tanımlıyoruz.
#define sled 7                        // Kırmızı ve yeşil ledlerimizi tanımladık
#define yled 6
MFRC522 rfid(10,9);             //Reset ve Chip Select pinlerini tanımladık.
   
   //Alt kısımda yer alan sayılar kartın kimlik numaralarıdır.

byte anahtarlik[4] = {122, 183, 249, 63};          //Yetkili kart Kimlik tanımlıyoruz.
byte kart[4] = {249, 176, 232, 193};          //Yetkili anahtarlı
k tanımlıyoruz.


void setup() 
{
  Serial.begin(9600);                     //Seri haberleşmeyi başlatıyoruz.
  SPI.begin();                            //SPI iletişimini başlatıyoruz.
  rfid.PCD_Init();                        //RC522 modülünü başlatıyoruz.
  pinMode(sled,OUTPUT);
 pinMode(yled,OUTPUT);        //ledlerimizi çıkış olarak tanımladık
}
 

void loop() 
{
        digitalWrite(yled,0);
        digitalWrite(sled,0);
  if ( ! rfid.PICC_IsNewCardPresent())    //Yeni kartın okunmasını bekliyoruz.
    return;
  if ( ! rfid.PICC_ReadCardSerial())      //Kart okunmadığı zaman bekliyoruz.
    return;

  if (rfid.uid.uidByte[0] == kart[0] &&     //Okunan numara ile Kart değişkenini karşılaştırıyoruz.

    rfid.uid.uidByte[1] == kart[1] &&
    rfid.uid.uidByte[2] == kart[2] &&
    rfid.uid.uidByte[3] == kart[3] ) {
        Serial.println("Dogru Kart");
        ekranaYazdir();
        digitalWrite(yled,1);
        digitalWrite(sled,0);
        delay(10000);
    }

   else if (rfid.uid.uidByte[0] == anahtarlik[0] &&     //Okunan numara ile anahtarlık değişkenini karşılaştırıyoruz.
    rfid.uid.uidByte[1] == anahtarlik[1] &&
    rfid.uid.uidByte[2] == anahtarlik[2] &&
    rfid.uid.uidByte[3] == anahtarlik[3] ) {
        Serial.println("Komutan Logar Hoşgeldiniz");
        ekranaYazdir();
       digitalWrite(yled,0);
        digitalWrite(sled,1);
        delay(10000);
    }
    else{                                 //Yetkisiz girişte içerideki komutlar çalıştırılır.
      Serial.println("Yetkisiz Kart");
      ekranaYazdir();
       
    }
  rfid.PICC_HaltA();
}

void ekranaYazdir(){
  Serial.print("Kimlik Numarasi: ");
  for(int sayac = 0; sayac < 4; sayac++){
    Serial.print(rfid.uid.uidByte[sayac]);
   Serial.print(" ");
  }
  Serial.println("");
}
