import java.util.*;

class Dijkstra extends Thread { 
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

        // Instantiate a queue and enque the start node.
        Queue<Cell> queue = new LinkedList<Cell>();        
        
        // Add the start of the maze to the queue.
        queue.add(maze.start);
        
        // Sets the start positions distance as 0.
        maze.start.steps = 0;
        
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
            
            // If neighbor hasn't been visted, mark as visted and assign incremented step. Then add it to the queue to be checked.
            if (!neighbor.visited){
              neighbor.steps = currNode.steps + 1;
              neighbor.visited = true;
              queue.add(neighbor);
              
              if (neighbor.isEnd){
                found = true;
                break outerLoop;
              }
            }
            Thread.sleep(10);
          }
        }
        
        // Rebuild path.
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
            Thread.sleep(5);
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
};
