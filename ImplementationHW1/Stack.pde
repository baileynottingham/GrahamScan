/**
 * @description Stack data strcutre that holds Points.
 *              The underlying primitive data structure is an array of points.
 * @author Bailey Nottingham
 * @author Mario Hernandez
 */
class Stack {

  Point[] stackArray;
  private int top;
  int counter = 0;

  /**
   * Initializes the top variable to -1, and allocates an array of size 'size'.
   */
  public Stack( int size ) {
    this.top = -1;
    this.stackArray = new Point[ size ];
  }

  /**
   * The point to be pushed to the top of the stack.
   * @params p
   */
  public void push( Point p ) {
    if ( isFull() ) {
      System.err.println( "Stack[ push ]: stack is full." );
      return;
    }
    stackArray[ ++top ] = p;
    counter++;
  }
  /**
   * removes the Point on top of the stack.
   * @return the Point on top of the stack, and null if stack is empty.
   */
  public Point pop() {
    if ( isEmpty() ) {
      System.err.println( "Stack[ pop ]: stack is empty." );
      return null;
    }
    counter--;
    return stackArray[ top-- ];
  }

  /**
   * @returns the Point on top of the stack, and null if stack is empty.
   */
  public Point top() {
    if ( isEmpty() ) {
      System.err.println( "Stack[ top ]: stack is empty." );
      return null;
    }
    return stackArray[ top ];
  }

  /**
   * @returns the second to top element on top of the stack.
   */
  public Point peekNextToTop() {
    if ( !hasNextToTop() ) {
      System.err.println( "Stack[ nextToTop ]: stack only has one element or less." );
      return null;
    }
    return stackArray[ top - 1 ];
  }

  /**
   * @returns are there at least two elements? 
   */
  public boolean hasNextToTop() {
    return top > 0;
  }

  /**
   * @returns is the stack empty?  
   */
  public boolean isEmpty() {
    return top == -1 ;
  }

  /**
   * @returns is the stack full?  
   */
  public boolean isFull() {
    return ( top == stackArray.length - 1 );
  }
}