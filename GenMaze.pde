import java.util.*;

public int randRange(int min, int max) {
    return (int) ((Math.random() * (max - min)) + min);
}

public boolean inRange(int x, int y){
  return (x >= 0 && x <= 24 && y >= 0 && y <= 24);
}

public LinkedList<Cell> getFrontierCells(Cell node, boolean blocked){
  LinkedList<Cell> temp = new LinkedList<Cell>();
  int i = node.x / 20;
  int j = node.y / 20;
  if (blocked){
    if (inRange(i, j - 2)) if (maze.cells[i][j - 2].isWall) temp.add(maze.cells[i][j - 2]);
    if (inRange(i + 2, j)) if (maze.cells[i + 2][j].isWall) temp.add(maze.cells[i + 2][j]);
    if (inRange(i, j + 2)) if (maze.cells[i][j + 2].isWall) temp.add(maze.cells[i][j + 2]);
    if (inRange(i - 2, j)) if (maze.cells[i - 2][j].isWall) temp.add(maze.cells[i - 2][j]);
  }
  else{ 
    if (inRange(i, j - 2)) if (!maze.cells[i][j - 2].isWall) temp.add(maze.cells[i][j - 2]);
    if (inRange(i + 2, j)) if (!maze.cells[i + 2][j].isWall) temp.add(maze.cells[i + 2][j]);
    if (inRange(i, j + 2)) if (!maze.cells[i][j + 2].isWall) temp.add(maze.cells[i][j + 2]);
    if (inRange(i - 2, j)) if (!maze.cells[i - 2][j].isWall) temp.add(maze.cells[i - 2][j]);
  }
  return temp;
}

public Cell getSharedNeighbor(Cell C1, Cell C2){
  for (int i = 0; i < C1.neighbors.size(); i++)
    for (int j = 0; j < C2.neighbors.size(); j++)
      if (C1.neighbors.get(i) == C2.neighbors.get(j))
        return C1.neighbors.get(i);
  return null;
}

class GenMaze extends Thread { 
    public void run() { 
      try {
        // Resets the maze.
        maze.reset();
        
        // Remove start and end points.
        maze.cells[0][0].isStart = false;
        maze.start = null;
        maze.cells[24][24].isEnd = false;
        maze.end = null;
        
        // Disable buttons that may conflict with functionality.
        btnDFS.enabled = false;
        btnBFS.enabled = false;
        btnGBFS.enabled = false;
        btnDijkstra.enabled = false;
        btnGenMaze.enabled = false;
        btnReset.enabled = false;
        
        // Make all nodes a wall;
        for (int i = 0; i < 25; i++)
          for (int j = 0; j < 25; j++){
            maze.cells[i][j].isWall = true; 
            Thread.sleep(1);
          }

        // Create a linked list to store the walls of the current cell.
        LinkedList<Cell> frontierList = new LinkedList<Cell>();

        // Pick a random Cell, set it to state passage and compute its frontier cells.
        int p = 0;
        int q = 0;
        
        while (p % 2 == 0 || q % 2 == 0) {
          p = randRange(0, 25);
          q = randRange(0, 25);
        }
        
        Cell currNode = maze.cells[p][q];
        currNode.isWall = false;
        
        // Add blocked frontier cells to frontier cell array.
        LinkedList<Cell> tempFrontier = getFrontierCells(currNode, true);
        for (int i = 0; i < tempFrontier.size(); i++)
          frontierList.add(tempFrontier.get(i));

        // While the list of frontier cells is not empty.
        while (!frontierList.isEmpty()){
          Cell frontierCell = frontierList.remove(randRange(0, frontierList.size()));
          
          if (!frontierCell.isWall)
            continue;
            
          frontierCell.isWall = false;
          
          LinkedList<Cell> neighborList = getFrontierCells(frontierCell, false);
     
          if (neighborList.size() == 0)
            continue;
     
          Cell neighbor = neighborList.get(randRange(0, neighborList.size()));
     
          getSharedNeighbor(frontierCell, neighbor).isWall = false;
     
          LinkedList<Cell> tempFrontierList = getFrontierCells(frontierCell, true);
          for (int i = 0; i < tempFrontierList.size(); i++)
            frontierList.add(tempFrontierList.get(i));
          Thread.sleep(50);
        }

        // Set all cells as unvisited;
        for (int i = 0; i < 25; i++)
          for (int j = 0; j < 25; j++)
            maze.cells[i][j].visited = false;            
         
        // Add start and end points.
        maze.cells[1][0].isStart = true;
        maze.cells[1][0].isWall = false;
        maze.start = maze.cells[1][0];
        maze.cells[23][24].isEnd = true;
        maze.cells[23][24].isWall = false;
        maze.end = maze.cells[23][24];
             
        // Renable the buttons.
        btnDFS.enabled = true;
        btnBFS.enabled = true;
        btnGBFS.enabled = true;
        btnDijkstra.enabled = true;
        btnGenMaze.enabled = true;
        btnReset.enabled = true;
      }
      catch (Exception e) { 
        println ("Exception is caught"); 
    } 
  }
} 
