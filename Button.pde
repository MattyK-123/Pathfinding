class Button {
  String label;
  float x;
  float y;
  float w;
  float h;
  
  boolean enabled;
  
  Button(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.enabled = true;
  }
  
  void draw() {
    if (!enabled)
      fill(218);
    else if (mouseOver())
      fill(200);
    else
      fill(250);
      
    stroke(141);
    rect(x, y, w, h, 10);
    
    textSize(10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean mouseOver() {
    return (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h));
  }
  
}
