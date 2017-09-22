


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
      printArray(points);
      println(points.length);
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  
  void MaxHeapify(int i) {
    
  }

  Point[] getArray() {
    return points;
  }
  
  void setIndex(Point p, int i) {
   points[i] = p;
  }
}