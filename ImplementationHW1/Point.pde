/*--------------------------------------------------------------------------------------------
 * Author: Bailey Nottingham & Mario Hernandez
 *
 * Class: Point
 * 
 * Description: 
 *-------------------------------------------------------------------------------------------*/

class Point {
  int x;
  int y;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  } 

  void setX(int x) {
    this.x = x;
  }

  void setY(int y) {
    this.y = y;
  }
  
  Point clone() {
    return new Point(this.x, this.y);
  }
  

  String toString() {
    return "(" + x +", " + y + ")";
  }
}