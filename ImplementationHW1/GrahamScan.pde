
class GrahamScan {

  Heap heap;
  Point bottomPoint;

  GrahamScan(Heap heap) {
    this.heap = heap;
    findBottom();
    printArray(heap.getArray());
  }
  
  
  // Find the bottomMostPoint
  void findBottom() {
    int ymin = heap.getArray()[1].getY();
    int min = 1;
    for (int i = 1; i < heap.getArray().length; i++) {

      int y = heap.getArray()[i].getY();
      // Pick the bottom most or choose the left

      // in case of tie

      if ((y < ymin) || (ymin == y && heap.getArray()[i].getX() < heap.getArray()[min].getX())) {
        ymin = heap.getArray()[i].getY();
        min = i;
      }
    }
    // Swap bottom most to front of the heap
    Point temp = heap.getArray()[1];
    heap.setIndex(heap.getArray()[min], 1);
    heap.setIndex(temp, min);
    bottomPoint = heap.getArray()[1];
  }

  Point getBottomMostPoint() {
    return bottomPoint;
  }

}