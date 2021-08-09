void mouseClicked() {
  
  mouseDragged();
  
  if (btnDFS.mouseOver() && btnDFS.enabled) {
    DFS thread = new DFS();
    thread.start();
  }
  else if (btnBFS.mouseOver() && btnBFS.enabled) {
    BFS thread = new BFS();
    thread.start();
  }
  else if (btnGBFS.mouseOver() && btnGBFS.enabled) {
    GBFS thread = new GBFS();
    thread.start();
  }
  else if (btnDijkstra.mouseOver() && btnDijkstra.enabled) {
    Dijkstra thread = new Dijkstra();
    thread.start();
  }
  else if (btnGenMaze.mouseOver() && btnGenMaze.enabled){
    GenMaze thread = new GenMaze();
    thread.start();
  }
  else if (btnDebug.mouseOver() && btnDebug.enabled) {
    for (int i = 0; i < 25; i++)
      for (int j = 0; j < 25; j++)
        maze.cells[i][j].debug = !maze.cells[i][j].debug;
  }  
  else if (btnReset.mouseOver() && btnReset.enabled) {
    maze.reset();
    btnDFS.enabled = true;
    btnBFS.enabled = true;
    btnGBFS.enabled = true;
    btnDijkstra.enabled = true;
    btnGenMaze.enabled = true;
    btnReset.enabled = true;
    btnAbout.enabled = true;
    btnExit.enabled = true;
  }
  else if (btnAbout.mouseOver() && btnAbout.enabled) {
    print("About!");
    JOptionPane.showMessageDialog(null, "Author: Matthew P. Kelly\nDate: 02/08/2021\nFramework: Processing 3.5.3\n\nDescription: This application seeks to demonstrate common pathfinding algorithms\nin a fun and intuitive maze-like application.", null, JOptionPane.INFORMATION_MESSAGE);
    
  }
  else if (btnExit.mouseOver()) {
    println("Exit!");
    exit();
    
  }  
  
}

void mouseDragged() {
  if (mouseX >= 0 && mouseX < 500 && mouseY >= 0 && mouseY < 500) {
    int r = mouseY / 20;
    int c = mouseX / 20;
    
    
    if (mouseButton == LEFT && !maze.cells[c][r].isStart && !maze.cells[c][r].isEnd)
      maze.cells[c][r].isWall = true;
    else if (mouseButton == RIGHT)
      maze.cells[c][r].isWall = false;
  }
}

void keyPressed() {
  if (mouseX >= 0 && mouseX < 500 && mouseY >= 0 && mouseY < 500) {
    int r = mouseY / 20;
    int c = mouseX / 20;
      
    if (maze.cells[c][r] == maze.start || maze.cells[c][r] == maze.end)
      return;
      
    if (key == 's') {
      if (maze.start != null){
        maze.start.isStart = false;
        maze.start.isWall = false;
      }
      maze.start = maze.cells[c][r];
      maze.start.isStart = true;
      maze.start.isWall = false;
    }
    else if (key == 'e') {
      if (maze.end != null){
        maze.end.isEnd = false;
        maze.end.isWall = false;
      }
      maze.end = maze.cells[c][r];
      maze.end.isEnd = true;
      maze.end.isWall = false;
    }
  }
}
