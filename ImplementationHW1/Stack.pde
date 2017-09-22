/**
 * @description Stack data strcutre that holds Points.
 *              The underlying primitive data structure is an array of points.
 * @author Bailey Nottingham
 * @author Mario Hernandez
 */

class Stack {
  private Point[] stackArray;
  private int top;

  public Stack( int size ) {
    this.top = -1;
    this.stackArray = new Point[ size ];
  }

  public void push( Point p ) {
    if ( isFull() ) {
      System.err.println( "Stack[ push ]: stack is full." );
      return;
    }
    stackArray[ ++top ] = p;
  }

  public Point pop() {
    if ( isEmpty() ) {
      System.err.println( "Stack[ pop ]: stack is empty." );
      return null;
    }
    return stackArray[ top-- ];
  }

  public Point top() {
    if ( isEmpty() ) {
      System.err.println( "Stack[ top ]: stack is empty." );
      return null;
    }
    return stackArray[ top ];
  }

  public Point peekNextToTop() {
    if ( !hasNextToTop() ) {
      System.err.println( "Stack[ nextToTop ]: stack only has one element or less." );
      return null;
    }
    return stackArray[ top - 1 ];
  }

  public boolean hasNextToTop() {
    return top > 0;
  }

  public boolean isEmpty() {
    return top == -1 ;
  }

  public boolean isFull() {
    return ( top == stackArray.length - 1 );
  }
}