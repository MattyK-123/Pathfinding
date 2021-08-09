import java.util.*;

class DFS extends Thread { 
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

        // Instantiate a stack and push the start node.
        Stack<Cell> stack = new Stack<Cell>();    
        
        // Push start of the maze to the stack.
        stack.push(maze.start);
        
        // Tracks the order in which nodes are expanded.
        int count = 0;
        
        // Push nodes that need to be checked on to the stack.
        outerLoop:
        while(!stack.empty()){
          // Mark the current expanded node as visited and assign it a step count.
          currNode = stack.pop();
          currNode.visited = true;
          currNode.steps = count++;
          
          // If the expanded node is the end break to outer loop.
          if (currNode.isEnd){
            found = true;
            break outerLoop;
          }
          
          // Iterate though current nodes neighbors and add them to the stack if that haven't been visited.
          for (int i = currNode.neighbors.size() - 1; i > -1; i--){
            Cell neighbor = currNode.neighbors.get(i);
            
            // Ignore node if it is a wall treat as infinite path.
            if (neighbor.isWall)
              continue;
            
            // If a neigboring node hasn't been visited, add it to the stack.
            if (!neighbor.visited){
              stack.push(neighbor);
              neighbor.parent = currNode;
            }
          }
          Thread.sleep(10);
        }
        
        // Rebuild path.
        if (found){
          currNode = maze.end;
          while (currNode != maze.start){
            currNode.isPath = true;
            currNode = currNode.parent;
            Thread.sleep(10);
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
