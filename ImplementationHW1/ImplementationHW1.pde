
Point point;
Heap heap;
GrahamScan scan;

void setup() {
 size(600,600);
 background(0,0,0);
}

void draw() {
  
}

void mousePressed() {
 if(mouseButton == LEFT) {
   heap = new Heap("test.in");
 //    println("----");
 //    printArray(heap.points);
     println("Graham Scan --------");
     scan = new GrahamScan(heap);
     println("Bottom Point");
     println(scan.bottomPoint);
 }
}