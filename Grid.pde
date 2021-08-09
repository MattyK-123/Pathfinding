public class Grid{
  
  public Cell start;
  public Cell end;
  
  public Cell cells[][] = new Cell[25][25];
  
  Grid(){
    for (int i = 0; i < 25; i++)
      for (int j = 0; j < 25; j++)
        cells[i][j] = new Cell(i * 20, j * 20);
    
    for (int i = 0; i < 25; i++)
      for (int j = 0; j < 25; j++){
        // Up
        if (j - 1 >= 0 && j - 1 <= 24)
          cells[i][j].neighbors.add(cells[i][j - 1]);
        // Right
        if (i + 1 >= 0 && i + 1 <= 24)
          cells[i][j].neighbors.add(cells[i + 1][j]);
        // Down
        if (j + 1 >= 0 && j + 1 <= 24)
          cells[i][j].neighbors.add(cells[i][j + 1]);
        // Left
        if (i - 1 >= 0 && i - 1 <= 24)
          cells[i][j].neighbors.add(cells[i - 1][j]);
      }
        
    start = cells[0][0];
    cells[0][0].isStart = true;
    end = cells[24][24];
    cells[24][24].isEnd = true;
  }
  
  void draw(){
    for (int i = 0; i < 25; i++)
      for (int j = 0; j < 25; j++)
        cells[i][j].draw();
  }
  
  void reset(){
    for (int i = 0; i < 25; i++)
      for (int j = 0; j < 25; j++)
        cells[i][j].reset();
        
    cells[0][0].isStart = true;
    maze.start = cells[0][0];
    cells[24][24].isEnd = true;
    maze.end = cells[24][24];
  }
};
