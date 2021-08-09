import java.util.*;

class CellComparator implements Comparator<Cell>{           
  public int compare(Cell C1, Cell C2) {
    if (C1.heuristic > C2.heuristic)
      return 1;
    else if (C1.heuristic < C2.heuristic)
      return -1;
    return 0;
  }
}

class GBFS extends Thread { 
    public void run() { 
      try {
        // Disable buttons that may conflict with functionality.
        btnDFS.enabled = false;
        btnBFS.enabled = false;
        btnGBFS.enabled = false;
        btnDijkstra.enabled = false;
        btnGenMaze.enabled = false;
        btnReset.enabled = false;
        
        // Reference to the current working node.
        Cell currNode;
        
        // Boolean used to track if end was found.
        boolean found = false;
        
        // Loop through each cell and calculate the euclidean distance (heuristic function) to the goal cell.
        for (int i = 0; i < 25; i++)
          for (int j = 0; j < 25; j++)
            maze.cells[i][j].heuristic = Math.sqrt(Math.pow(maze.cells[i][j].x / 20 - maze.end.x / 20, 2) + Math.pow(maze.cells[i][j].y / 20 - maze.end.y / 20, 2)); 
        
        // Define a priority queue that will maintain which Cell is expanded next.
        PriorityQueue<Cell> queue = new PriorityQueue<Cell>(1, new CellComparator());
        
        // Sets the start positions distance as 0.
        maze.start.steps = 0;
        
        // Add the start of the maze to the queue.
        queue.add(maze.start);
        
        // Loop while the queue is not empty.
        outerLoop:
        while (!queue.isEmpty()){
          currNode = queue.poll();
          currNode.visited = true;
          
          // Loop through the current nodes adjacent cells.
          for (int i = 0; i < currNode.neighbors.size(); i++){
            Cell neighbor = currNode.neighbors.get(i);
           
            // Treat walls as infinite paths.
            if (neighbor.isWall)
              continue;
              
            if (!neighbor.visited){
              neighbor.steps = currNode.steps + 1;
              neighbor.visited = true;
              queue.add(neighbor);
              
              if (neighbor.isEnd){
                found = true;
                break outerLoop;
              }
            }
          }
          Thread.sleep(10);
        }
        
        if (found){
          currNode = maze.end;
          while (currNode != maze.start){
            for (int i = 0; i < currNode.neighbors.size(); i++){
              Cell neighbor = currNode.neighbors.get(i);
              if (neighbor.steps == currNode.steps - 1){
                currNode = neighbor;
                currNode.isPath = true;
                break;
              }       
            }
            Thread.sleep(15);
          }
        }
        else
          JOptionPane.showMessageDialog(null, "Path not found!", null, JOptionPane.INFORMATION_MESSAGE);
        
        // Renable buttons.
        btnReset.enabled = true;
      }
      catch (Exception e) { 
        println ("Exception is caught"); 
    } 
  }
} 
