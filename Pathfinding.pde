// Imports.
import javax.swing.JOptionPane;

// Declaring grid.
Grid maze;

// Declaring buttons.
Button btnDFS;
Button btnBFS;
Button btnGBFS;
Button btnDijkstra;
Button btnGenMaze;
Button btnDebug;
Button btnReset;
Button btnAbout;
Button btnExit;

void setup(){
  // Setting window title.
  surface.setTitle("Pathfinding");
  
  // Setting window image.
  PImage icon = loadImage("Assets/search.png");
  surface.setIcon(icon);
  
  // Setting screen size.
  size(700, 500);
  
  // Instantiating grid.
  maze = new Grid();
  
  // Instantiating buttons.
  btnDFS =      new Button("Depth First Search", 520, 20, 160, 20);
  btnBFS =      new Button("Breadth First Search", 520, 60, 160, 20);
  btnDijkstra = new Button("Dijkstra's Algorithm", 520, 100, 160, 20);
  btnGBFS =     new Button("Best First Search", 520, 140, 160, 20);
  btnGenMaze =  new Button("Generate Maze", 520, 180, 160, 20);
  
  btnReset =    new Button("Reset", 520, 340, 160, 20);
  btnDebug =    new Button("Debug", 520, 380, 160, 20);
  btnAbout =    new Button("About", 520, 420, 160, 20);
  btnExit =     new Button("Exit", 520, 460, 160, 20);
}

void draw(){
  // Draw buttons
  btnDFS.draw();
  btnBFS.draw();
  btnGBFS.draw();
  btnDijkstra.draw();
  btnGenMaze.draw();
  btnDebug.draw();
  btnReset.draw();
  btnAbout.draw();
  btnExit.draw();
  
  // Draw maze.
  maze.draw();
}
