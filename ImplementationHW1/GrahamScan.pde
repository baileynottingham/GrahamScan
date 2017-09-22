
class GrahamScan {

  Heap heap;
  Point bottomPoint;
  Stack stack;

  GrahamScan(Heap heap) {
    this.heap = heap;
    
    stack = new Stack(heap.getArray().length);
    
    stack.push(heap.getArray()[1]);
    stack.push(heap.getArray()[2]);
    for(int i = 3; i < heap.getArray().length - 1; i++) {
      while(notLeftTurn(stack.peekNextToTop(), stack.top(), heap.getArray()[i]) && stack.counter != 2) {
         stack.pop(); 
      }
      stack.push(heap.getArray()[i]);
    }
    println("Stack");
    printArray(stack.stackArray);
  }
  
  boolean notLeftTurn(Point p1, Point p2, Point p3) {
   int comparison = ((p1.getX() - p2.getX()) * (p3.getY() - p2.getY()) - (p3.getX() - p2.getX()) * (p1.getY() - p2.getY()));
   if(comparison < 0) {
     return true;
   }
   else {
     return false;
  }




  //// Find the bottomMostPoint
  //void findBottom() {
  //  int ymin = heap.getArray()[1].getY();
  //  int min = 1;
  //  for (int i = 1; i < heap.getArray().length; i++) {

  //    int y = heap.getArray()[i].getY();
  //    // Pick the bottom most or choose the left

  //    // in case of tie

  //    if ((y < ymin) || (ymin == y && heap.getArray()[i].getX() < heap.getArray()[min].getX())) {
  //      ymin = heap.getArray()[i].getY();
  //      min = i;
  //    }
  //  }
  //  // Swap bottom most to front of the heap
  //  Point temp = heap.getArray()[1];
  //  heap.setIndex(heap.getArray()[min], 1);
  //  heap.setIndex(temp, min);
  //  bottomPoint = heap.getArray()[1];
  //}

  //Point getBottomMostPoint() {
  //  return bottomPoint;
  //}
}
}