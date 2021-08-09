import java.util.*;

class Cell {
  // Cell positional co-ordinates.
  int x;
  int y;
  
  // Cell characteristics.
  boolean visited;
  boolean isWall;
  boolean isStart;
  boolean isEnd;
  boolean isPath;
  boolean debug;
  
  // Int used to track number of steps to current node.
  int steps;
  
  // Int used to track the manhatten distance from the current cell to the end cell.
  double heuristic;
  
  // Linked list storing cells adjacent to current cell.
  LinkedList<Cell> neighbors;
  
  // Reference to direct predecessor (DFS).
  Cell parent;
  
  Cell(int x, int y) {
    this.x = x;
    this.y = y;
    
    this.visited = false;
    this.isWall = false;
    this.isStart = false;
    this.isEnd = false;
    this.isPath = false;
    this.debug = true;

    this.parent = null;
    
    this.heuristic = Integer.MAX_VALUE;
    this.steps = Integer.MAX_VALUE;

    this.neighbors = new LinkedList<Cell>();
  }
  
  void draw() {
    if (isWall)
      fill(44, 62, 80);
    else if (isStart)
      fill(46, 204, 113);
    else if (isEnd)
      fill(231, 76, 60);
    else if (isPath)
      fill(26, 188, 156);
    else if (visited)
      fill(250, 211, 144);
    else
      fill(255);
    square(x, y, 20);
    
    if (debug){
      if (steps != Integer.MAX_VALUE && visited){
        textSize(8);
        textAlign(CENTER, CENTER);
        fill(0);
        text(steps, x + 10, y + 10);
      }
    }
  }
  
  void reset() {
    this.visited = false;
    
    this.isWall = false;
    this.isStart = false;
    this.isEnd = false;
    
    this.parent = null;
    
    this.isPath = false;
    this.steps = Integer.MAX_VALUE;
    this.heuristic = Integer.MAX_VALUE;
  }

  void printParent(){
    println("[", this.parent.x / 20, this.parent.y / 20, "] -> [" , this.x / 20, this.y / 20, "]");  
  }
  
  void print(){
    println("[", this.x / 20, this.y / 20, "]");
  }
};
