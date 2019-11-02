String[] main_face, starting, starting2, starting_fail, starting3, starting3OK;
String[] face_A, face_B, face_C, face_D, face_E, face_F, face_G, face_H;
String firstLine = "sudo /etc/init.d/dbus restart";
PFont font, font2;
//String f, f2 = "starting.txt";
//String f2 = "starting2.txt";

int count = 0;

int yPos_main = 200, xPos_main;
int yPos_other, xPos_other;

String[] cursor = {"/", "+", "."}; 


int counter = 0;
int counter2 = 0;
int counter3 = 0;

int reverseCounter;
int stringCount;
int ypos;

color BLACK = 0;
color GREEN = #6FCF97;
color BLUE = #0029F3;
color WHITE = 255;

int blinkTime;
boolean blinkOn;
String nextChar;



TextDrawer firstLines, startingText, startingTextOK, mainFace, 
faceA, faceB, faceC, faceD, faceE, faceF, faceG, faceH,
faceAWhite, faceBWhite, faceCWhite, faceDWhite, faceEWhite, faceFWhite, faceGWhite, faceHWhite;

void setup() {
  size(1440, 1024);

  font = loadFont("Menlo-Regular-5.vlw");
  font2 = loadFont("IBMPlexMono-18.vlw");
  frameRate(20);


  //main_face = loadStrings("main_face.txt");
  //starting = loadStrings("starting.txt");
  //starting2 = loadStrings("starting2.txt");
  starting_fail = loadStrings("starting_fail.txt");
  starting3 = loadStrings("starting3.txt");

  //face_A = loadStrings("face_A.txt");
  //face_B = loadStrings("face_B.txt");
  //face_C = loadStrings("face_C.txt");
  //face_D = loadStrings("face_D.txt");
  //face_E = loadStrings("face_E.txt");
  //face_F = loadStrings("face_F.txt");
  //face_G = loadStrings("face_G.txt");
  //face_H = loadStrings("face_H.txt");

  smooth();

  firstLines = new TextDrawer("firstLine.txt", 75, 50, #6FCF97, 0, font2, 14);
  startingText = new TextDrawer("starting.txt", 70, 100, 255, 10, font2, 14);
  startingTextOK = new TextDrawer("starting2.txt", 70, 100, GREEN, 10, font2, 14);
  mainFace = new TextDrawer("main_face.txt", 525, 370, 255, 5, font, 4);
  faceA = new TextDrawer("face_A.txt", 100, 370, GREEN, 2, font, 1.5);
  faceB = new TextDrawer("face_B.txt", 325, 370, GREEN, 2, font, 1.5);
  faceC = new TextDrawer("face_C.txt", 975, 370, GREEN, 2, font, 1.5);
  faceD = new TextDrawer("face_D.txt", 1200, 370, GREEN, 2, font, 1.5);
  faceE = new TextDrawer("face_E.txt", 100, 605, GREEN, 2, font, 1.5);
  faceF = new TextDrawer("face_F.txt", 325, 605, GREEN, 2, font, 1.5);
  faceG = new TextDrawer("face_G.txt", 975, 605, GREEN, 2, font, 1.5);
  faceH = new TextDrawer("face_H.txt", 1200, 605, GREEN, 2, font, 1.5);
  faceAWhite = new TextDrawer("face_A.txt", 100, 370, WHITE, 2, font, 1.5);
  faceBWhite = new TextDrawer("face_B.txt", 325, 370, WHITE, 2, font, 1.5);
  faceCWhite = new TextDrawer("face_C.txt", 975, 370, WHITE, 2, font, 1.5);
  faceDWhite = new TextDrawer("face_D.txt", 1200, 370, WHITE, 2, font, 1.5);
  faceEWhite = new TextDrawer("face_E.txt", 100, 605, WHITE, 2, font, 1.5);
  faceFWhite = new TextDrawer("face_F.txt", 325, 605, WHITE, 2, font, 1.5);
  faceGWhite = new TextDrawer("face_G.txt", 975, 605, WHITE, 2, font, 1.5);
  faceHWhite = new TextDrawer("face_H.txt", 1200, 605, WHITE, 2, font, 1.5);


  blinkTime = millis();
  blinkOn = true;
}


void draw() {
  if (keyPressed) {
    count = 0;
    counter = 0;
    counter2 = 0;
    counter3 = 0;
  }

  background(#06090B);


  //firstLines.typewriter();
  typewriteText(firstLine, 75, 50); 
  //firstLines.typewriter();
  //xPos_main = width/2;
  //yPos_main = 470;
  //yPos_other = 300;
  //xPos_other = width/4;
  //ypos = 0;
  //translate(-200, -100);


  startingText.drawText();
  startingTextOK.drawText();
  mainFace.drawText();
  faceA.drawText();
  faceB.drawText();
  faceC.drawText();
  faceD.drawText();
  faceE.drawText();
  faceF.drawText();
  faceG.drawText();
  faceH.drawText();
  
  faceAWhite.drawText();
  faceBWhite.drawText();
  faceCWhite.drawText();
  faceDWhite.drawText();
  faceEWhite.drawText();
  faceFWhite.drawText();
  faceGWhite.drawText();
  faceHWhite.drawText();
  //count++;


  // All timed blinking cursors
  fill(GREEN);
  noStroke();
  if (count > 83 && count < 170) {
    if (blinkOn) 
      rect(1120, 304, 15, 20);
  }
  if (count > 240 && count < 310) {
    if (blinkOn) 
      rect(505, 375, 15, 20);
  }
  if (count > 450 && count < 620) {
    if (blinkOn) 
      rect(632, 375, 15, 20);
  }
  if (millis() - 500 > blinkTime) {
    blinkTime = millis();
    blinkOn = !blinkOn;
  }

  if (count > 620) {
    fill(BLUE);
    textFont(font2, 14);
    rect(636, 380, 40, 10);
    fill(255);
    text("[ OK ]", 632, 390);
  }


  // timers
  if (count > 160) {
    //if (count > 200) {
    //frameRate(10);
    textFont(font2, 14);
    fill(255);
    text("" + starting3[30] + "", 275, ypos-380);
    fill(GREEN);
    text("OK", 462, ypos-380);
  }

  // typewriting text
  if (count > 160 && count < 328) {
    //if (count > 170 && count < 328) {
    //frameRate(15);
    fill(255); 
    if (counter2 < starting3[31].length()) 
      counter2++;
    text(starting3[31].substring(0, counter2), 275, ypos-360);
  } 

  if (count > 330) {
    //frameRate(30);
    fill(255); 
    if (counter2 < starting3[32].length()) 
      counter2++;
    text(starting3[32].substring(0, counter2), 275, ypos-360);
  }

  //then draw top row of other faces
  //for (int i = 0; i < face_A.length; i++) {
  //  if (i < count) {
  //    fill(#6FCF97);
  //    textFont(font, 1.5);

  //    text("" + face_A[i] + "", xPos_other-50, yPos_other+200);
  //    text("" + face_B[i] + "", xPos_other+170, yPos_other+200);
  //    text("" + face_C[i] + "", xPos_other+835, yPos_other+200);
  //    text("" + face_D[i] + "", xPos_other+1055, yPos_other+200);
  //  }
  //  yPos_other += 2;
  //}

  count++;

  // then draw bottom row of other faces
  //for (int i = 0; i < face_A.length; i++) {
  //  //frameRate(120);
  //  if (i < count) {
  //    fill(#6FCF97);
  //    textFont(font, 1.5);
  //    //frameRate(120);
  //    text("" + face_E[i] + "", xPos_other-50, yPos_other+280);
  //    text("" + face_F[i] + "", xPos_other+170, yPos_other+280);
  //    text("" + face_G[i] + "", xPos_other+835, yPos_other+280);
  //    text("" + face_H[i] + "", xPos_other+1055, yPos_other+280);
  //  }
  //  yPos_other += 2;
  //}
  //count++;


  // Reset x and y pos
  yPos_other = 300;
  xPos_other = width/4;

  //  // white scan 1
  //for (int i = 0; i < face_A.length; i++) {
  //  if (i < count) {
  //    fill(255);
  //    textFont(font, 1.5);
  //    //frameRate(120);
  //    if (count > 230 && count < 392) {
  //      text("" + face_A[i] + "", xPos_other-50, yPos_other+200);
  //      text("" + face_H[i] + "", xPos_other+1055, yPos_other+431);
  //    }
  //  }
  //  yPos_other += 2;
  //}
  //  //count++;

  //  // white scan 2
  //for (int i = 0; i < face_A.length; i++) {
  //  if (i < count) {
  //    fill(255);
  //    textFont(font, 1.5);
  //    if (count > 392 && count < 471) {
  //      text("" + face_B[i] + "", xPos_other+170, yPos_other+50);
  //      text("" + face_G[i] + "", xPos_other+835, yPos_other+280);
  //    }
  //  }
  //  yPos_other += 2;
  //}
  //  //count++;

  //  // white scan 3
  //for (int i = 0; i < face_A.length; i++) {
  //  if (i < count) {
  //    fill(255);
  //    textFont(font, 1.5);
  //    if (count > 471 && count < 540) {
  //      text("" + face_C[i] + "", xPos_other+835, yPos_other-100);
  //      text("" + face_F[i] + "", xPos_other+170, yPos_other+129);
  //    }
  //  }
  //  yPos_other += 2;
  //}


  //  // white scan 4
  //for (int i = 0; i < face_A.length; i++) {

  //  if (i < count) {
  //    fill(255);
  //    textFont(font, 1.5);
  //    if (count > 540 && count < 630) {
  //      text("" + face_D[i] + "", xPos_other+1055, yPos_other-250);
  //      text("" + face_E[i] + "", xPos_other-50, yPos_other-21);
  //    }
  //  }
  //  yPos_other += 2;
  //}
  count++;

  fill(BLUE);
  rect(width/2+200, 950, 45, 60);
  textFont(font2, 60);
  fill(255);
  text("*", width/2+205, 1000);
}

void typewriteText(String lines, int w, int h) {
  fill(255);
  textFont(font2, 14);
  if (counter < lines.length()) 
    counter++;
  text(lines.substring(0, counter), w, h);
}
