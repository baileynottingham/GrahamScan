
class GrahamScan {

  Heap heap;
  Point bottomPoint;
  Stack stack;

  GrahamScan(Heap heap) {
    heap.heapSort();
    /*****
    this.heap = heap;

    stack = new Stack( heap.getArray().length );

    stack.push(heap.getArray()[1]);
    stack.push(heap.getArray()[2]);
    stack.push(heap.getArray()[3]);
    for (int i = 4; i < heap.getArray().length - 1; i++) {
      while (notLeftTurn(stack.peekNextToTop(), stack.top(), heap.getArray()[i]) && stack.counter != 2) {
        stack.pop();
      }
      stack.push(heap.getArray()[i]);
    }
    println("Stack");
    printArray(stack.stackArray);
    *****/
  }

  boolean notLeftTurn(Point p1, Point p2, Point p3) {
    int comparison = ((p1.getX() - p2.getX()) * (p3.getY() - p2.getY()) - (p3.getX() - p2.getX()) * (p1.getY() - p2.getY()));
    if (comparison < 0) {
      return true;
    } else {
      return false;
    }
  }

}