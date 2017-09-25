/* //<>//
 * @file ImplementationHW1.pde
 * @description This file contains the GUI objects, handles button clicks, 
 *               and draws the current state of Heap, GrahamScan, and Stack.
 * @author Bailey Nottingham
 * @author Mario Hernandez
 */

//Buttons
Button readFileButton;
Button restartButton;
Button grahamScanButton;
Button sortButton;
Button quitButton;
Button partyButton;
Point[] points = null;
String fileName = null;
Button convexHullButton;
boolean isItDone = false;
boolean convexHullLines = false;
GrahamScan gs;
Stack s;

Point point;
Heap heap;
GrahamScan scan;
Point poppedOff = null;

boolean sorted = false;
int grahamScanButtonClicked = 2;
boolean printSortedLines = false;
boolean restartScreen = true;

/**
 * Sets up the frame, and instantates our clickable buttons.
 */
void setup() {
  size(800, 500);
  smooth();
  textSize(16);
  //Create Clickable Buttons
  restartButton = new Button("Restart", 15, 450, 115, 35);
  readFileButton = new Button("Read File", 145, 450, 115, 35);
  sortButton = new Button("Sort", 275, 450, 115, 35);
  grahamScanButton = new Button("Graham Scan", 405, 450, 115, 35);
  convexHullButton = new Button("Convex Hull", 535, 450, 115, 35);
  quitButton = new Button( "Quit", 665, 450, 115, 35 );
}

/**
 * Draws the state of the buttons, points, stack, and graham scan lines. 
 */
void draw() {
  stroke(0);
  smooth();
  fill(256, 256, 256);
  rect(0, 0, 799, 399);

  fill(0);
  rect(0, 400, 800, 100);
  fill(256, 256, 256);
  drawButtons();
  fill(256, 256, 256);
  textAlign(LEFT, TOP);
  text( (fileName != null ? ( "You're working with: " + fileName ) : "Select \"Read File\" to begin"), 10, 410, width, height);
  fill(250, 0, 0);
  if (restartScreen == true) { //<>// //<>//
    fill(0, 191, 255);
    text( "Implementation Homework #1", 275, 50);
    text( "Bailey Nottingham & Mario Hernandez", 250, 100);
    text( "Graham's Scan Algorithim", 290, 150);
  }
  if (points != null) {
    stroke(0);
    for ( Point p : points ) {
      if ( p == null) {
        continue;
      }
      if (poppedOff != null && isItDone == false) {
        if (p.isEqual(poppedOff)) {
          fill(0, 255, 0);
          ellipse( p.getX(), p.getY(), 10, 10);
        } else {
          fill(250, 0, 0);
          ellipse( p.getX(), p.getY(), 10, 10);
        }
      } else {
        fill(250, 0, 0);
        ellipse( p.getX(), p.getY(), 10, 10);
      }
    }
    for (int i = 0; i < heap.getArray().length; ++i) {
      fill(0, 191, 255);
      text( Integer.toString(i), points[i].getX(), points[i].getY() );
    }
  }

  if (sorted == true) {
    points = heap.getArray();
    if (printSortedLines) {
      for (int i = 0; i < heap.getArray().length; ++i) {
        stroke(0, 191, 255);
        text( Integer.toString(i), points[i].getX(), points[i].getY() );
      }

      stroke(0, 255, 0);
      for (int i = 0; i < heap.getArray().length - 1; ++i) {
        line(points[i].getX(), points[i].getY(), points[i + 1].getX(), points[i + 1].getY());
      }
      stroke(128, 0, 128);
      line(points[points.length - 1].getX(), points[points.length - 1].getY(), points[0].getX(), points[0].getY());
    }
  }
  // One-Step of Graham Scan Print
  if ( scan != null ) {
    for (int i = 0; i < scan.stack.counter - 1; i++) {
      line(scan.stack.stackArray[i].getX(), scan.stack.stackArray[i].getY(), scan.stack.stackArray[i + 1].getX(), scan.stack.stackArray[i + 1].getY());
    }
    if ( scan.isDone() ) {
      line(scan.stack.stackArray[scan.stack.counter - 1].getX(), scan.stack.stackArray[scan.stack.counter - 1].getY(), scan.stack.stackArray[0].getX(), scan.stack.stackArray[ 0 ].getY());
    }
    // Print Stack
    fill(0, 0, 0);
    text( "Stack", 725, 10);
    int xAxis = 705;
    int yAxis = 10;
    for (int i = 0; i < scan.stack.counter; i++) {
      yAxis = yAxis + 25;
      // Top Horizontal Line
      line(xAxis, yAxis, xAxis + 85, yAxis);
      // Bottom Horizontal Line
      line(xAxis, yAxis + 25, xAxis + 85, yAxis + 25);
      // Left Vertical Line
      line(xAxis, yAxis, xAxis, yAxis + 25);
      // Right Vertical Line
      line(xAxis + 85, yAxis, xAxis + 85, yAxis + 25);
      text( scan.stack.stackArray[i].toString(), 705 + 2, yAxis + 2);
    }
  }
  // Entire Convex Hull Print
  if (convexHullLines == true) {
    for (int i = 0; i < gs.stack.counter - 1; i++) {
      line(gs.stack.stackArray[i].getX(), gs.stack.stackArray[i].getY(), gs.stack.stackArray[i + 1].getX(), gs.stack.stackArray[i + 1].getY());
    }
    line(gs.stack.stackArray[gs.stack.counter - 1].getX(), gs.stack.stackArray[gs.stack.counter - 1].getY(), gs.stack.stackArray[0].getX(), gs.stack.stackArray[ 0 ].getY());
    // Print Stack
    fill(0, 0, 0);
    text( "Stack", 725, 10);
    int xAxis = 705;
    int yAxis = 10;
    for (int i = 0; i < gs.stack.counter; i++) {
      yAxis = yAxis + 25;
      // Top Horizontal Line
      line(xAxis, yAxis, xAxis + 85, yAxis);
      // Bottom Horizontal Line
      line(xAxis, yAxis + 25, xAxis + 85, yAxis + 25);
      // Left Vertical Line
      line(xAxis, yAxis, xAxis, yAxis + 25);
      // Right Vertical Line
      line(xAxis + 85, yAxis, xAxis + 85, yAxis + 25);
      text( gs.stack.stackArray[i].toString(), 705 + 2, yAxis + 2);
    }
  }
}

/**
 * Listens for button clicks, and delegates the task to respective method.
 */
void mousePressed() {
  // user presses "Restart"
  if (restartButton.mouseOver()) {
    //  javax.swing.JOptionPane.showMessageDialog(null, "restart Button Pressed ");
    restart();
  }
  // user presses "Read File" or "Read New File"
  else if (readFileButton.mouseOver()) {
    handleReadFileButton();
  }
  // user presses "Quit"
  else if (quitButton.mouseOver()) {
    exit();
  }
  // user presses "Sort"
  else if (sortButton.mouseOver() ) {
    handleSortButton();
  }
  // user presses "Next"
  else if (grahamScanButton.mouseOver()) {
    handlegrahamscanButton();
  } else if ( convexHullButton.mouseOver() ) {
    handleConvexHullButton();
  }
}

/**
 * Handles loading the contents of the file into memory.
 */
void handleReadFileButton() {
  fileName = javax.swing.JOptionPane.showInputDialog( null, "File Name", "" );
  processFile( fileName );
}

/**
 * Handles going through one step of the graham scan algorithm. 
 * @requires valid file contents
 * @requires sorted points 
 */
void handlegrahamscanButton() {
  if (restartScreen == true) {
    javax.swing.JOptionPane.showMessageDialog(null, "Please read file");
    return;
  }

  if ( !sorted ) {
    javax.swing.JOptionPane.showMessageDialog(null, "Please press 'Sort' before you begin Graham Scan");
    return;
  }

  if ( gs != null) {
    return;
  }


  if (grahamScanButtonClicked++ == 2 ) {
    scan = new GrahamScan( heap );
  }
  printSortedLines = false;
  scan.oneStep( grahamScanButtonClicked );
  poppedOff = scan.justPoppedOff;
  isItDone = scan.done;
}

/**
 * Sets up the needed object, and passes the resposibility of parsing the file to the Heap constructor.
 */
void processFile( String fileName ) {
  restartScreen = false;
  convexHullLines = false;
  scan = null;
  gs = null;
  sorted = false;
  printSortedLines = false;
  grahamScanButtonClicked = 2;
  heap = new Heap( fileName );
  points = heap.getArray();
  return;
}

/**
 * Sorts the points via heap sort.
 */
void handleSortButton() {
  if (restartScreen == true) {
    javax.swing.JOptionPane.showMessageDialog(null, "Please read file");
    return;
  }
  restartScreen = false;
  scan = null;
  gs = null;
  grahamScanButtonClicked = 2;
  convexHullLines = false;
  heap.heapSort();
  sorted = true;
  printSortedLines = true;
}




/**
 * Just recreate everything.
 **/
void handleConvexHullButton() {
  if (restartScreen == true) {
    javax.swing.JOptionPane.showMessageDialog(null, "Please read file");
    return;
  }
  restartScreen = false;
  heap = new Heap( fileName );
  heap.heapSort();
  gs = new GrahamScan( heap );
  sorted = true;
  scan = null;
  poppedOff = null;
  printSortedLines = false;
  convexHullLines = true;
  int countBelow = 2;
  while (gs.isDone() == false) {
    gs.oneStep(countBelow++);
  }
  String fileNames[] = fileName.split( ".in" );
  String outputFile = fileNames[ 0 ] + ".out";
  PrintWriter output = createWriter( outputFile );
  for ( int i = gs.stack.counter - 1; i > 0; --i ) {
    output.println( gs.stack.stackArray[i].getX() + ", " + gs.stack.stackArray[i].getY() + ", " + i );
  }
  output.flush();
  output.close();
}

/**
 * 'Zero' everything out.
 */
void restart() {
  restartScreen = true;
  points = null;
  fileName = null;
  isItDone = false;
  convexHullLines = false;
  gs = null;
  s = null;
  point = null;
  heap = null;
  scan = null;
  poppedOff = null;

  sorted = false;
  grahamScanButtonClicked = 2;
  printSortedLines = false;
}

/**
 * Inherited from gui_skeleton authors.
 */
void drawButtons() {
  readFileButton.setText("Read File");
  restartButton.drawButton();
  readFileButton.drawButton();
  sortButton.drawButton();
  grahamScanButton.drawButton();
  quitButton.drawButton();
  convexHullButton.drawButton();
}