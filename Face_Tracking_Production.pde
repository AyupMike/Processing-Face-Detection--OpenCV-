import processing.serial.*;
import hypermedia.video.*;
import java.awt.Rectangle;

Serial port;
OpenCV opencv;
int width = 500;
int height = 375;

void setup() {

  size(width, height, P3D);
  opencv = new OpenCV(this);
  opencv.capture(width, height);
  opencv.cascade(OpenCV.CASCADE_PROFILEFACE);
  
  background(255);
  
}

public void stop() {
  
  opencv.stop();
  super.stop();

}

void draw() {

  background(255);
  
  // grab a new frame
  opencv.read();

  // proceed detection
  Rectangle[] faces = opencv.detect(1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 1, 1);

  // display the image
  image(opencv.image(), 0, 0);
  
  // draw face area(s)
  noFill();
  stroke(255,255,255);
  strokeWeight(1);

  for( int i=0; i<faces.length; i++ ) {
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height); 
  }
    
}
