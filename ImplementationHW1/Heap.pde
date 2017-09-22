 //<>// //<>// //<>//
class Heap {
  Point[] points;
  int heapsize;

  Point pivot;

  Heap(String filename) {
    parseAndBuildInitialArray(filename);

    heapsize = points.length - 1;

    printArray(points);
    println(points.length);

    getLowest();

    printArray(points);

    pivot = points[1];

    // MAXHEAPIFY
    buildMaxHeap();

    heapSort();
  }

  void MaxHeapify(Point[] thePoints, int i, int size) {
    int left = 2 * i;
    int right = (2 * i) + 1;
    int largest = i;
    int cross = 0;

    if (left <= size) {
      cross = calcCrossProd(pivot, thePoints[left], thePoints[i]);
    }
    if (left <= size && cross < 0) {
      largest = left;
    } else {
      largest = i;
    }

    cross = 0;
    if (right <= size) {
      cross = calcCrossProd(pivot, thePoints[right], thePoints[largest]);
    }
    if (right <= size && cross <  0) {
      largest = right;
    }

    if (largest != i) {
      Point temp = thePoints[largest];
      thePoints[largest] = thePoints[i];
      thePoints[i] = temp;
      MaxHeapify(thePoints, largest, size);
    }
  }

  Point[] getArray() {
    return points;
  }

  void heapSort() {
    int size = heapsize;
    for (int i = heapsize; i > 3; --i) {
      Point temp = points[2];
      points[2] = points[i];
      points[i] = temp;
      size -= 1;
      MaxHeapify(points, 2, size);
    }
  }

  void setIndex(Point p, int i) {
    points[i] = p;
  }

  int calcCrossProd( Point pivot, Point p1, Point p2 ) {
    int t1 = (p1.getX() - pivot.getX()) * (p2.getY() - pivot.getY());
    int t2 = (p1.getY() - pivot.getY()) * (p2.getX() - pivot.getX());
    return t1 - t2;
  }


  void parseAndBuildInitialArray( String filename ) {
    BufferedReader read;
    String str;
    int i = 1;
    try {
      read = createReader(filename);
      while ((str = read.readLine()) != null) {
        if (i == 1) {
          int numOfPoints = Integer.parseInt(str);
          points = new Point[numOfPoints + 1];
        } else {
          int j = 0;
          int k;
          String strX = "";
          String strY = "";
          while (str.charAt(j) != ' ') {
            strX += str.charAt(j);
            j++;
          }
          k = j + 1;
          while (str.charAt(k) != ' ' || str.charAt(k) != '\n') {
            strY += str.charAt(k);
            k++;
            if (k == str.length()) {
              break;
            }
          }
          points[i - 1] = new Point(Integer.parseInt(strX), Integer.parseInt(strY));
        }
        i++;
      }
    } 
    catch (Exception e ) {
      System.err.println( "ERROR" );
    }
  }

  void getLowest() {
    // Find bottom one
    int ymin = points[1].getY();
    int min = 1;
    for (int z = 1; z < points.length; z++) {

      int y = points[z].getY();
      // Pick the bottom most or choose the left

      // in case of tie

      if ((y < ymin) || (ymin == y && points[z].getX() < points[min].getX())) {
        ymin = points[z].getY();
        min = z;
      }
    }
    // Swap bottom most to front of the heap
    Point temp = points[1];
    setIndex(points[min], 1);
    setIndex(temp, min);
  }

  void buildMaxHeap() {
    Point[] temp = new Point[ heapsize ];
    int j = 1;
    temp[0] = null;
    for ( int i = 2; i < points.length; ++i ) {
      temp[j++] = points[i].clone();
    }

    for (int x = (temp.length - 1)/2; x > 0; x--) {
      MaxHeapify(temp, x, 4);
    }

    int k =1;
    for ( int i = 2; i< points.length; ++i) {
      points[i] = temp[k++];
    }
  }
}