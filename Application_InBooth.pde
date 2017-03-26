import processing.sound.*;
import ddf.minim.*;

PFont font_DINBold30;
PFont font_DINBold48;
PFont font_DINBlack48;
PFont font_DINBlack52;

PImage pic_logo; //logo
PImage pic_StartScreen; //StartScreen
PImage pic_ParentResult;
PImage pic_FriendResult;
PImage pic_LoverResult;
PImage pic_ParentLines;
PImage pic_FriendLines;
PImage pic_LoverLines;
PImage pic_thankyou;

SoundFile sound;

Minim minim;
AudioInput in;
AudioRecorder recorder;
int countname; //change the audio name
int name = 000000; //set the number in key's' function

int i = 0; // step counter

int j1; // quiz1 answer saver
int j2; // quiz2 answer saver
int j3; // quiz3 answer saver
int j4; // quiz4 answer saver

int c1_parent; // character1 - parent quiz points
int c2_friend; // character2 - friend quiz points
int c3_lover;  // character3 - lover quiz points

String charactorname;

int k = 0; // quiz result (decide which character's video to be displayed)

//-----time count down-----//
int time_left_millis; // time left - milli
int time_left_sec; // time left - seconds
int time_left_min; //time left - minutes
int time_limit_line = 1; // 1 min countdown for each line 

int time_used_b4line1 = 0; // used time before line1
int time_used_b4line2 = 0; // used time before line2
int time_used_b4line3 = 0; // used time before line3

int time_used_b4keypress = 0;     //used time before key pressed
int time_used_afterkeypress = 0; //used time after key pressed
int time_limit_whole = 2*60000; // whole time limit 5 minutes

void newFile()
{      
 countname =(name + 1);
 recorder = minim.createRecorder(in, "VoiceRecord_user" + countname + "_" + charactorname + ".wav", true);
 // println("file/" + countname + ".wav");
}


void setup() {
  frameRate(30);
 
  //-----Background setup-----//
  size(1440, 900,P2D); //size for real booth
  //size(1440,840); //size for competition
  
  //------Audio Recoding Setup-----//
   minim = new Minim(this);

 // get a stereo line-in: sample buffer length of 2048
 // default sample rate is 44100, default bit depth is 16
 in = minim.getLineIn(Minim.STEREO, 2048);
 // create a recorder that  will record from the input to the filename specified, using buffered recording
 // buffered recording means that all captured audio will be written into a sample buffer
 // then when save() is called, the contents of the buffer will actually be written to a file
 // the file will be located in the sketch's root folder.
 
   newFile();//go to change file name
  
//-----Picture Loading-----//
    pic_logo = loadImage("pic_logo.jpg");
    pic_StartScreen = loadImage("StartScreen.jpg");
    
    pic_ParentResult = loadImage("ParentResult.jpg");
    pic_FriendResult = loadImage("FriendResult.jpg");
    pic_LoverResult = loadImage("LoverResult.jpg");
    
    pic_ParentLines = loadImage("ParentLines.jpg");
    pic_FriendLines = loadImage("FriendLines.jpg");
    pic_LoverLines = loadImage("LoverLines.jpg");
    
    pic_thankyou = loadImage("thankyou.jpg");

    
//-----Sound Loading-----//
   sound = new SoundFile(this, "quiz_instructions.mp3");
   
//-----Font Loading-----//
   font_DINBold30 = loadFont("DINBold30.vlw");
   font_DINBold48 = loadFont("DINBold48.vlw");
   font_DINBlack48 = loadFont("DINBlack48.vlw");
   font_DINBlack52 = loadFont("DINBlack52.vlw");
}  




void draw() {
  
  //If there is no input for 5 minutes, the system will restart.
  time_used_afterkeypress = millis()-time_used_b4keypress;
  
  if (time_used_afterkeypress > time_limit_whole){
    i = 0;
    }
  

  
//-----Firsrt image-----//
  
  if  (i == 0) {
   recorder.endRecord();
   sound.stop();

   j1 = 0; 
   j2 = 0; 
   j3 = 0; 
   j4 = 0; 
   c1_parent = 0; 
   c2_friend = 0;
   c3_lover = 0;  
   
   background(255,255,255);
   noStroke();
   
   fill(0,0,0);
   rect(0, 0, 1440, 30);
   rect(0, 870, 1440, 30);
    
   fill(218,41,28);
   rect(0, 30, 1440, 60);
   rect(0, 30, 60, 820);
   rect(1380, 30, 60, 820);
   rect(0, 810, 1440, 60);
  
   image(pic_logo,115,90); 
   textFont(font_DINBold30);
   fill(0, 0, 0);
   textAlign(LEFT);
   text("Press '#' to start",1100,770);
  }
  
  
  if  (i == 1) {
    background(255,255,255);
    noStroke();
   
    fill(0,0,0);
    rect(0, 0, 1440, 30);
    rect(0, 870, 1440, 30);
    
    image(pic_StartScreen,0,30,1440,840);
  }

//-----quiz------//
//A. Would you rather have a night out or a night at home? 
//1.Night Out [friend]
//2.Night Home [parent]

//B. Do you consider yourself a romantic?
//1.Yes [lover]
//2.No [friend]

//C. Do you tend to make plans or join ones already made? 
//1.I usually make the plans [lover]
//2.I usually join in on plans [parent]

//D. What genre of movie would you want to star in?
//1.Drama [parent]
//2.Comedy [friend]
//3.Romance [lover]

//-----quiz1-----// 
  if  (i == 2) {
  sound.stop();
   background(255,255,255);
   noStroke();
   
   fill(0,0,0);
   rect(0, 0, 1440, 30);
   rect(0, 870, 1440, 30);
    
   fill(218,41,28);
   rect(0, 30, 1440, 60);
   rect(0, 30, 60, 820);
   rect(1380, 30, 60, 820);
   rect(0, 810, 1440, 60);
   
   //question
   textFont(font_DINBold48);
   fill(0, 0, 0);
   textAlign(CENTER);
   text("Would you rather have a night out or a night at home?",160,150,1120,150);
   textFont(font_DINBlack52);
   text("1) Night Out",160,350,1120,150);
   text("2) Night Home",160,450,1120,150);
   
   textFont(font_DINBold30);
   fill(0, 0, 0);
   text("Press '1' or '2' to select",160,650,1120,150);
   
   //highlight users's selection
   if (j1 == 1){
     stroke(218,41,28);
     noFill();
     rect(520, 330, 400, 80);
   }
   
   if (j1 == 2){
     stroke(218,41,28);
     noFill();
     rect(520, 430, 400, 80);
   }
   
   // display the "Press '#' to continue" instruction after the user select an answer
   if (j1 != 0){
     textFont(font_DINBold30);
     fill(0, 0, 0);
     textAlign(LEFT);
     text("Press '#' to continue",1070,770);
     //image(pic_q1,2/width,2/height);
   }
   
  }
 
//-----quiz2-----// 
  if  (i == 3) {
   //image(pic_q2,2/width,2/height);
   background(255,255,255);
   noStroke();
   
   fill(0,0,0);
   rect(0, 0, 1440, 30);
   rect(0, 870, 1440, 30);
    
   fill(218,41,28);
   rect(0, 30, 1440, 60);
   rect(0, 30, 60, 820);
   rect(1380, 30, 60, 820);
   rect(0, 810, 1440, 60);
   
   //question
   textFont(font_DINBold48);
   fill(0, 0, 0);
   textAlign(CENTER);
   text("Do you consider yourself a romantic?",160,150,1120,150);
   textFont(font_DINBlack52);
   text("1) Yes",160,350,1120,150);
   text("2) No",160,450,1120,150);
   
   textFont(font_DINBold30);
   fill(0, 0, 0);
   text("Press '1' or '2' to select",160,650,1120,150);
   
   //highlight user's selection
   if (j2 == 1){
     stroke(218,41,28);
     noFill();
     rect(520, 330, 400, 80);
   }
   
   if (j2 == 2){
     stroke(218,41,28);
     noFill();
     rect(520, 430, 400, 80);
   }
   
   // display the "Press '#' to continue" instruction after the user select an answer
   if (j2 != 0){
     textFont(font_DINBold30);
     fill(0, 0, 0);
     textAlign(LEFT);
     text("Press '#' to continue",1070,770);
     //image(pic_q1,2/width,2/height);
   }
  }
  
//-----quiz3-----// 
  if  (i == 4) {
   //image(pic_q3,2/width,2/height);
   background(255,255,255);
   noStroke();
   
   fill(0,0,0);
   rect(0, 0, 1440, 30);
   rect(0, 870, 1440, 30);
    
   fill(218,41,28);
   rect(0, 30, 1440, 60);
   rect(0, 30, 60, 820);
   rect(1380, 30, 60, 820);
   rect(0, 810, 1440, 60);
   
   //question
   textFont(font_DINBold48);
   fill(0, 0, 0);
   textAlign(CENTER);
   text("Do you tend to make plans or join ones already made?",160,150,1120,150);
   textFont(font_DINBlack52);
   text("1) I usually make the plans",160,350,1120,150);
   text("2) I usually join in on plans",160,450,1120,150);
   
   textFont(font_DINBold30);
   fill(0, 0, 0);
   text("Press '1' or '2' to select",160,650,1120,150);
   
   //highlight user's selection
   if (j3 == 1){
     stroke(218,41,28);
     noFill();
     rect(320, 330, 800, 80);
   }
   
   if (j3 == 2){
     stroke(218,41,28);
     noFill();
     rect(320, 430, 800, 80);
   }
   
   // display the "Press '#' to continue" instruction after the user select an answer
   if (j3 != 0){
     textFont(font_DINBold30);
     fill(0, 0, 0);
     textAlign(LEFT);
     text("Press '#' to continue",1070,770);
     //image(pic_q1,2/width,2/height);
   }
  }
  
//-----quiz4-----// 
  if  (i == 5) {
   //image(pic_q4,2/width,2/height);
  background(255,255,255);
   noStroke();
   
   fill(0,0,0);
   rect(0, 0, 1440, 30);
   rect(0, 870, 1440, 30);
    
   fill(218,41,28);
   rect(0, 30, 1440, 60);
   rect(0, 30, 60, 820);
   rect(1380, 30, 60, 820);
   rect(0, 810, 1440, 60);
 
   //question
   textFont(font_DINBold48);
   fill(0, 0, 0);
   textAlign(CENTER);
   text("What genre of movie would you want to star in?",160,150,1120,150);
   textFont(font_DINBlack52);
   text("1) Drama",160,300,1120,150);
   text("2) Comedy",160,400,1120,150);
   text("3) Romance",160,500,1120,150);
   
   textFont(font_DINBold30);
   fill(0, 0, 0);
   text("Press '1' or '2' or '3' to select",160,650,1120,150);
   
   
   //highlight user's selection
   if (j4 == 1){
    stroke(218,41,28);
    noFill();
    rect(520, 280, 400, 80);
   }
   
   if (j4 == 2){
    stroke(218,41,28);
    noFill();
    rect(520, 380, 400, 80);
   }
   
   if (j4 == 3){
    stroke(218,41,28);
    noFill();
    rect(520, 480, 400, 80);
   }
   
   // display the "Press '#' to continue" instruction after the user select an answer
   if (j4 != 0){
    textFont(font_DINBold30);
    fill(0, 0, 0);
    textAlign(LEFT);
    text("Press '#' to continue",1070,770);
     //image(pic_q1,2/width,2/height);
   }
  }

//-----caculate the result for quiz-----//
  
  //if a character get 3 points, just pick it!
  
  if  (c1_parent == 3) {
   k = 1;
  }
  
  if  (c2_friend == 3) {
   k = 2;
  }
  
   if  (c3_lover == 3) {
   k = 3;
  }
  
  //if a character get 2 points, and other 2 characters get 1 point each, just pick the 2-point character!
  if  (c1_parent == 2 && c2_friend == 1 && c3_lover == 1) {
   k = 1;
  }
  
  if  (c2_friend == 2 && c1_parent == 1 && c3_lover == 1) {
   k = 2;
  }
  
  if  (c3_lover == 2 && c1_parent == 1 && c2_friend == 1) {
   k = 3;
  }
  
  
 //if 2 characters both get 2 points, the result will be decided by the last question answer
  if  (c1_parent == 2 && c2_friend == 2 ){
   k = j4;
   }
  
  if  (c2_friend == 2 && c3_lover == 2){
   k = j4;
   }
   
   if  (c1_parent == 2 && c3_lover == 2){
   k = j4;
   }
   


//-----show the result-----//  
  //step 6: show the result
  
  
  if  (i == 6) {
    
    background(255,255,255);
    noStroke();
   
    fill(0,0,0);
    rect(0, 0, 1440, 30);
    rect(0, 870, 1440, 30);
    
    if (k == 1){
    image(pic_ParentResult,0,30,1440,840);
    charactorname = "parent";
    }

    if (k == 2){
    image(pic_FriendResult,0,30,1440,840);
    charactorname = "friend";
    }
   
   if  (k == 3) {
    image(pic_LoverResult,0,30,1440,840);
    charactorname = "lover";
    }
  }

//-----show the lines-----//  
  //step 7: show the lines
  
  
  if  (i == 7) {
    background(255,255,255);
    noStroke();
   
    fill(0,0,0);
    rect(0, 0, 1440, 30);
    rect(0, 870, 1440, 30);
   
    if (k == 1){
    image(pic_ParentLines,0,30,1440,840);
    }
    
     if (k == 2){
    image(pic_FriendLines,0,30,1440,840);
    }
    
     if (k == 3){
    image(pic_LoverLines,0,30,1440,840);
    }
     //save the used time before play the video;
   time_used_b4line1 = millis();
  }
  
//-----show the line1-----//  
  //step 8: show the line1
  if  (i == 8) {
    background(255,255,255);
    noStroke();
   
    fill(0,0,0);
    rect(0, 0, 1440, 30);
    rect(0, 870, 1440, 30);
    
         
     textFont(font_DINBold48);
     fill(0, 0, 0);
     textAlign(CENTER);
     text("Line 1 of 3",160,200,1120,150);
     
     textFont(font_DINBold30);
     fill(0, 0, 0);
     textAlign(LEFT);
     text("Press '#' to Line 2",1070,770);
     
     //time count down
     time_left_millis = time_limit_line*60*1000 - (millis()-time_used_b4line1);
     time_left_min = (time_left_millis/(60*1000));
     time_left_sec = ((time_left_millis-time_left_min*60*1000)/(1000));
     
     textFont(font_DINBold48);
     textAlign(CENTER);
     fill(218,41,28);
     text("Time Left "+time_left_min+":"+time_left_sec,160,730,1120,150);
     
     time_used_b4line2 = millis();
     
     if (time_left_min == 0 && time_left_sec ==0){
      i = 9;
     }     
    
    textAlign(CENTER);
    textFont(font_DINBlack48);
    if (k == 1){
     text("Sam? Sam is that you? Are you cancelling on me again? It’s 9:10 and you aren’t here!!",160,390,1120,250); 
    }
    
     if (k == 2){  
     text("Ayyyyyy you idiot, when’re you getting to the party?",160,390,1120,250); 
    }
    
     if (k == 3){
     text("Hey hey hot stuff I’m at your place but I think the buzzer isn’t working - let me up?",160,390,1120,250);  
    }
  }

//-----show the line2-----//  
  //step 9: show the line2
  if  (i == 9) {
    background(255,255,255);
    noStroke();
   
    fill(0,0,0);
    rect(0, 0, 1440, 30);
    rect(0, 870, 1440, 30);
    
    textFont(font_DINBold48);
    fill(0, 0, 0);
    textAlign(CENTER);
    text("Line 2 of 3",160,200,1120,150);
    
    
    textFont(font_DINBold30);
    fill(0, 0, 0);
    textAlign(LEFT);
    text("Press '#' to Line 3",1070,770);
    
    //time count down
     time_left_millis = time_limit_line*60*1000 - (millis()-time_used_b4line2);
     time_left_min = (time_left_millis/(60*1000));
     time_left_sec = ((time_left_millis-time_left_min*60*1000)/(1000));
     
     textFont(font_DINBold48);
     textAlign(CENTER);
     fill(218,41,28);
     text("Time Left "+time_left_min+":"+time_left_sec,160,730,1120,150);
     
     time_used_b4line3 = millis();
     
     if (time_left_min == 0 && time_left_sec ==0){
      i = 10;
     }     
    
    textAlign(CENTER);
    textFont(font_DINBlack48);
    
    if (k == 1){
     text("Sam, I’ve told you so many times we were supposed to meet at 9 and it’s 9:10 what was I supposed to think…",160,390,1120,250);
    }
    
     if (k == 2){
     text("Oh come on man! You said you were going to help set up! We’ve got 3 kegs to get up the stairs and they aren’t going to carry themselves - you owe me for the move-in help remember?",160,390,1120,250);
    }
    
     if (k == 3){
     text("Well we didn’t MAKE plans but I was thinking it might be nice to make some now y’know? I brought that thing we were talking about...",160,390,1120,250);
    }
  }

//-----show the line3-----//  
  //step 10: show the line3
  if  (i == 10) {
    background(255,255,255);
    noStroke();
   
    fill(0,0,0);
    rect(0, 0, 1440, 30);
    rect(0, 870, 1440, 30);
    
    textFont(font_DINBold48);
    fill(0, 0, 0);
    textAlign(CENTER);
    text("Line 3 of 3",160,200,1120,150);
    
    textFont(font_DINBold30);
    fill(0, 0, 0);
    textAlign(LEFT);
    text("Press '#' to Finish",1070,770);
    
    //time count down
     time_left_millis = time_limit_line*60*1000 - (millis()-time_used_b4line3);
     time_left_min = (time_left_millis/(60*1000));
     time_left_sec = ((time_left_millis-time_left_min*60*1000)/(1000));
     
     textFont(font_DINBold48);
     textAlign(CENTER);
     fill(218,41,28);
     text("Time Left "+time_left_min+":"+time_left_sec,160,730,1120,150);
     
     if (time_left_min == 0 && time_left_sec ==0){
      i = 11;
     }     
     
         
    textAlign(CENTER);
    textFont(font_DINBlack48);
    
    if (k == 1){
     text("SAM it is 10:14! They’ve started to let people in and I just know we’re going to end up standing at the back again - are you close? I can’t save seats without the tickets you know.",160,390,1120,250); 
    }
    
     if (k == 2){
     text("Whatever man; just hurry up ok? This is an important night for me.",160,390,1120,250);
    }
    
     if (k == 3){
     text("So are you going to have me up or not?",160,390,1120,250);
    }
  }  


   
//-----thank you -----//  
  //step 11: show thank you 
   if  (i == 11) {
   
    background(255,255,255);
   noStroke();
   
   fill(0,0,0);
   rect(0, 0, 1440, 30);
   rect(0, 870, 1440, 30);
    
   fill(218,41,28);
   rect(0, 30, 1440, 60);
   rect(0, 30, 60, 820);
   rect(1380, 30, 60, 820);
   rect(0, 810, 1440, 60);
  
   image(pic_thankyou,115,90,1212,701); 
   textFont(font_DINBold30);
   fill(0, 0, 0);
   textAlign(LEFT);
   text("Press '*' to restart",1100,770);
   }
   
}

void stop()
{
 // always close Minim audio classes when you are done with them
 in.close();
 minim.stop();
 
 super.stop();
}


void keyPressed() {
  
  if (i == 0 && key == '.') { //booth
    //if (i == 0 && key == '#') { //competition
    sound.play();
  }

//-----step counting-----//
  
//press '.' to move forward, but it will display on the screen that"press '#' to move forward" because we cover the the key '.' with '#' to make it like a phone-styled keypad
  if (key == '.') { //booth
  //if (key == '#') {   //competition
    //make sure that during the quiz, the user can only move after his make a selection
    if (i == 0 || i == 1 || i == 6 || i == 7 || i == 8 || i == 9 || i == 10){
    i++;
    }
    
    if (i == 2){
     if (j1 == 1){
     c2_friend++; // character2 - friend gets a point 
     i++;
     }
     if (j1 == 2){
     c1_parent++; // character1 - parent gets a point 
     i++;
     }
    }
    
    if (i == 3){
     if (j2 == 1){
     c3_lover++; // character2 - friend gets a point 
     i++;
     }
     if (j2 == 2){
     c2_friend++; // character1 - parent gets a point 
     i++;
     }
    }
    
    if (i == 4){
     if (j3 == 1){
     c3_lover++; // character2 - friend gets a point 
     i++;
     }
     if (j3== 2){
     c1_parent++; // character1 - parent gets a point 
     i++;
     }
    }
    
    if (i == 5){
     if (j4 == 1){
     c1_parent++; // character2 - friend gets a point 
     i++;
     }
     if (j4== 2){
     c2_friend++; // character1 - parent gets a point 
     i++;
     }
     if (j4== 3){
     c3_lover++; // character1 - parent gets a point 
     i++;
     }
    }
    
  }
  
if (key == '0') { // booth
//if (key == '*'){ //competition
    i = 0;
    }
    
      
if (keyPressed == true) {
    time_used_b4keypress = millis();
    }


//press '7' to select choice "1" because we cover the the key '7' with '1' to make it like a phone-styled keypad
  if (i == 2 && key == '7'){
  //if (i == 2 && key == '1'){
    j1 = 1;
  }
 
//press '8' to select choice "2" because we cover the the key '8' with '2' to make it like a phone-styled keypad  
   if (i == 2 && key == '8'){
   //if (i == 2 && key == '2'){
    j1 = 2;  
  }
 

 //-----save answer for q2-----//

 if (i == 3 && key == '7'){
  //if (i == 3 && key == '1'){
    j2 = 1;   
  }
  
  if (i == 3 && key == '8'){
   //if (i == 3 && key == '2'){
    j2 = 2;    
  }
   
  
   //-----save answer for q3-----//

  if (i == 4 && key == '7'){
  //if (i == 4 && key == '1'){
    j3 = 1;
  }
  
    
   if (i == 4 && key == '8'){
   //if (i == 4 && key == '2'){
    j3 = 2;     
  }
    
   //-----save answer for q4----//

  if (i == 5 && key == '7'){
  //if (i == 5 && key == '1'){
    j4 = 1;
  }
  
   if (i == 5 && key == '8'){
  // if (i == 5 && key == '2'){
    j4 = 2; 
  }
   
   if (i == 5 && key == '9'){
   //if (i == 5 && key == '3'){
    j4 = 3;
  }
  
  //----voice recording-----//
  if (i==8 && key == '.'){
   newFile();
   recorder.beginRecord();
   name++; //change the file name, everytime +1
  }
  
   if (i==11 && key == '.'){
   recorder.endRecord();
   recorder.save();
  }
  
}