


class Heap {
  Point[] points;

  Heap(String filename) {

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
      println("Read from file");
      printArray(points);

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
    
    println("Swapped");
    printArray(points);
    
    // MAXHEAPIFY
    int heapsize = points.length; //<>//
      for(int x = (heapsize / 2); x >= 1; x--) {
        MaxHeapify(x);
      }
      println("Heapfied");
      printArray(points);
    
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }

  void MaxHeapify(int i) {
    int left = 2 * i;
    int right = (2 * i) + 1;
    int largest;
    int comparison = 0;

    if (left < points.length) {
      comparison = (points[left].getX() - points[1].getX()) * (points[i].getY() - points[1].getY()) - (points[i].getX() - points[1].getX()) * (points[left].getY() - points[1].getY());
    }
    if (left < points.length && comparison < 0) {
      largest = left;
    } else {
      largest = i;
    }

    // 
    if (right < points.length) {
      comparison = (points[right].getX() - points[1].getX()) * (points[largest].getY() - points[1].getY()) - (points[largest].getX() - points[1].getX()) * (points[right].getY() - points[1].getY());
    }
    if (right < points.length && comparison < 0) {
      largest = right;
    }

    if (largest != i) {
      Point temp = points[largest];
      points[largest] = points[i];
      points[i] = temp;
      MaxHeapify(largest);
    }
  }

  Point[] getArray() {
    return points;
  }

  void setIndex(Point p, int i) {
    points[i] = p;
  }
  
  
  
  
  void deleteMax() {
    /********
    Replace the root node with the last element in the heap
    Remove the last element
    Swap (i.e. heapify) the new root with its child until the correct position has found (See MAX-HEAPIFY)

    
    ********/
  }




















}