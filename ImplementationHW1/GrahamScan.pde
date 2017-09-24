
class GrahamScan {

  Heap heap;
  Point bottomPoint;
  Stack stack;
  boolean done;
  Point justPoppedOff = null;;   /* Set up the stack for the first time.
   */
  GrahamScan(Heap heap) {
    this.heap = heap;
    setStack( new Stack( heap.getArray().length) );
    stack.push( heap.getArray()[ 0 ] );
    stack.push( heap.getArray()[ 1 ] );
    stack.push( heap.getArray()[ 2 ] );
    done = false;
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

  void oneStep( int iteration ) {
    if ( !( iteration < heap.getArray().length ) ) {
      done = true;
      return;
    }

    while ( !isLeftTurn( stack.top(), stack.peekNextToTop(), heap.getArray()[ iteration ] ) ) {
      justPoppedOff = stack.pop();
    }
    stack.push( heap.getArray()[ iteration ] );
  }



  boolean isDone() {
    return done;
  }

  /**
   * Return a new stack that does all of the graham scan algorithm all at once. 
   * It's too much work to figure out what iteration we are in, and finishing the algorith. 
   * So that is why we just do the algorithm again.
   */
  Stack convexHull() {
    Stack stk = new Stack( heap.getArray().length);
    stk.push( heap.getArray()[ 0 ] );
    stk.push( heap.getArray()[ 1 ] );
    stk.push( heap.getArray()[ 2 ] );
    for ( int i = 3; i < heap.getArray().length - 1; ++i ) {
      while ( !isLeftTurn( stk.top(), stk.peekNextToTop(), heap.getArray()[ i ] ) ) {
        stk.pop();
      }
      stk.push( heap.getArray()[ i ] );
    }
    return stk;
  }
}