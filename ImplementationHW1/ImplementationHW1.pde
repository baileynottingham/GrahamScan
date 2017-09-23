/** //<>//
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

Point point;
Heap heap;
GrahamScan scan;

boolean sorted = false;
int grahamScanButtonClicked = 2;

void setup() {
  size(800, 500);
  smooth();
  textSize(16);
  //Create Clickable Buttons
  restartButton = new Button("Restart", 15, 450, 115, 35);
  readFileButton = new Button("Read File", 145, 450, 115, 35);
  sortButton = new Button("Sort", 275, 450, 115, 35);
  grahamScanButton = new Button("Graham Scan", 405, 450, 115, 35);
  quitButton = new Button("Quit", 535, 450, 115, 35);
}

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
  if (points != null) {
    stroke(0);
    for ( Point p : points ) {
      if ( p == null ) {
        continue;
      }
      ellipse( p.getX(), p.getY(), 10, 10 );
    }
  }

  if (sorted == true) {
    points = heap.getArray();
    for (int i = 0; i < heap.getArray().length; ++i) {
      stroke(0, 191, 255);
      text( Integer.toString(i), points[i].getX(), points[i].getY() );
    }


    for (int i = 0; i < heap.getArray().length - 1; ++i) {
      line(points[i].getX(), points[i].getY(), points[i + 1].getX(), points[i + 1].getY());
    }
    stroke(0, 255, 0);
    line(points[points.length - 1].getX(), points[points.length - 1].getY(), points[0].getX(), points[0].getY());
  }
  if ( scan != null ) {
    for (int i = 0; i < scan.stack.counter - 1; i++) {
      text(Integer.toString(i), scan.stack.stackArray[i].getX(), scan.stack.stackArray[i].getY());
      line(scan.stack.stackArray[i].getX(), scan.stack.stackArray[i].getY(), scan.stack.stackArray[i + 1].getX(), scan.stack.stackArray[i + 1].getY());
    }
    if ( scan.isDone() ) {
      line(scan.stack.stackArray[scan.stack.counter - 1].getX(), scan.stack.stackArray[scan.stack.counter - 1].getY(), scan.stack.stackArray[0].getX(), scan.stack.stackArray[ 0 ].getY());
    }
  }
}

void mousePressed() {
  // user presses "Restart"
  if (restartButton.mouseOver()) {
    javax.swing.JOptionPane.showMessageDialog(null, "restart Button Pressed ");
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
  }
}

void handleReadFileButton() {
  fileName = javax.swing.JOptionPane.showInputDialog( null, "File Name", "" );
  processFile( fileName );
}

void handlegrahamscanButton() {
  if ( !sorted ) {
    return;
  }

  if (grahamScanButtonClicked++ == 2 ) {
    scan = new GrahamScan( heap );
  }
  scan.oneStep( grahamScanButtonClicked );
}

void processFile( String fileName ) {
  heap = new Heap( fileName );
  points = heap.getArray();
  return;
}

void handleSortButton() {
  heap.heapSort();
  sorted = true;
}

void restart() {
}

void drawButtons() {
  readFileButton.setText("Read File");
  restartButton.drawButton();
  readFileButton.drawButton();
  sortButton.drawButton();
  grahamScanButton.drawButton();
  quitButton.drawButton();
}