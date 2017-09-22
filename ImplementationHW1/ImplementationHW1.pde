
Point point;
Heap heap;
GrahamScan scan;

void setup() {
  
  heap = new Heap("test.in");
}

void draw() {
  
}

void mousePressed() {
 if(mouseButton == LEFT) {
 //    println("----");
 //    printArray(heap.points);
     println("Graham Scan --------");
     scan = new GrahamScan(heap);
     println("Bottom Point");
     println(scan.bottomPoint);
 }
}