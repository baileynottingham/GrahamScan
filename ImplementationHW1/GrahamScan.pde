
class GrahamScan {

  Heap heap;
  Point bottomPoint;
  Stack stack;

  GrahamScan(Heap heap) {
    this.heap = heap;
    setStack( new Stack( heap.getArray().length) );

    stack.push( heap.getArray()[ 0 ] );
    stack.push( heap.getArray()[ 1 ] );
    stack.push( heap.getArray()[ 2 ] );

    for ( int i = 3; i < heap.getArray().length; ++i ) {
      while ( !isLeftTurn( stack.top(), stack.peekNextToTop(), heap.getArray()[ i ] ) ) {
        stack.pop();
      }
      stack.push( heap.getArray()[ i ] );
    }

  }

  boolean isLeftTurn(Point p1, Point p0, Point p2) {
    int tmp1 = ( p1.getX() - p0.getX() ) * ( p2.getY() - p0.getY() );
    int tmp2 = ( p2.getX() - p0.getX() ) * (p1.getY()  - p0.getY());
    int cross = tmp1 - tmp2;
    return cross > 0;
  }

  void setStack( Stack s ) {
    stack = s;
  }

  Stack getStack() {
    return this.stack;
  }
}