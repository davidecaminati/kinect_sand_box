// Daniel Shiffman
// Depth thresholding example

// https://github.com/shiffman/OpenKinect-for-Processing
// http://shiffman.net/p5/kinect/

// Original example by Elie Zananiri
// http://www.silentlycrashing.net

import org.openkinect.freenect.*;
import org.openkinect.processing.*;

Kinect kinect;

// Depth image
PImage depthImg;
int delta = 4;
// Which pixels do we care about?
int waterDepth = 860;
int sandDepth =  waterDepth-delta;
int valleyDepth =  sandDepth -delta;
int mountain1Depth =  valleyDepth-delta;
int mountain2Depth =  mountain1Depth-delta;
int mountain3Depth =  mountain2Depth-delta;
int mountain4Depth =  mountain3Depth-delta;
int mountain5Depth =  mountain4Depth-delta;
int mountain6Depth =  mountain5Depth-delta;



// What is the kinect's angle
float angle;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight, P3D); 
  kinect = new Kinect(this);
  kinect.initDepth();
  angle = kinect.getTilt();

  // Blank image
  depthImg = new PImage(kinect.width, kinect.height);
}

void draw() {
  // Draw the raw image
  image(kinect.getDepthImage(), 0, 0);
  int val = 0;
  // Threshold the depth image
  int[] rawDepth = kinect.getRawDepth();
  for (int i=0; i < rawDepth.length; i++) {
    if (rawDepth[i] <= mountain6Depth ) {
      depthImg.pixels[i] = #ffffff;
    } 
    else if (rawDepth[i] >= mountain6Depth && rawDepth[i] <= mountain5Depth) {
      depthImg.pixels[i] = #a55427;
    } 
    else if (rawDepth[i] >= mountain5Depth && rawDepth[i] <= mountain4Depth) {
      depthImg.pixels[i] = #a66b33;
    } 
   else if (rawDepth[i] >= mountain4Depth && rawDepth[i] <= mountain3Depth) {
      depthImg.pixels[i] = #bf996c;
    } 
   else if (rawDepth[i] >= mountain3Depth && rawDepth[i] <= mountain2Depth) {
      depthImg.pixels[i] = #0f5e33;
    } 
   else if (rawDepth[i] >= mountain2Depth && rawDepth[i] <= mountain1Depth) {
      depthImg.pixels[i] = #299d39;
    } 
   else if (rawDepth[i] >= mountain1Depth && rawDepth[i] <= valleyDepth) {
      depthImg.pixels[i] = #97c094;
    } 
   else if (rawDepth[i] >= valleyDepth && rawDepth[i] <= sandDepth) {
      depthImg.pixels[i] = #d9eabd;
    } 
   else if (rawDepth[i] >= sandDepth && rawDepth[i] <= waterDepth) {
      depthImg.pixels[i] = #0191f1;
    } 
   else if (rawDepth[i] >= waterDepth) {
      depthImg.pixels[i] = #006397;
    } 
    
    else {
    }
  }

  depthImg.filter(BLUR,2);
  // Draw the thresholded image
  depthImg.updatePixels();

  scale(2.6);
  background(-1);
  
  translate(-120, -80);
  image(depthImg, 0, 0);

  fill(0);
}

// Adjust the angle and the depth threshold min and max
void keyPressed() {
  /*
  if (key == CODED) {
    if (keyCode == UP) {
      angle++;
    } else if (keyCode == DOWN) {
      angle--;
    }
    angle = constrain(angle, 0, 30);
    kinect.setTilt(angle);
  } else if (key == 'a') {
    minDepth = constrain(minDepth+10, 0, maxDepth);
  } else if (key == 's') {
    minDepth = constrain(minDepth-10, 0, maxDepth);
  } else if (key == 'z') {
    maxDepth = constrain(maxDepth+10, minDepth, 2047);
  } else if (key =='x') {
    maxDepth = constrain(maxDepth-10, minDepth, 2047);
  }
  */
}
