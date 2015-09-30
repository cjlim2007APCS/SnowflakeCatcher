Snowflake[] snow;
boolean overwrite = false;
void setup()
{
  size(300,300);
  snow = new Snowflake[75];
  for(int i=0;i<snow.length;i++) {
    snow[i]= new Snowflake();
  }
  background(0);
}
void draw()
{
  //background(0);
  for(int i=0;i<snow.length;i++) {
    snow[i].erase();
    snow[i].lookDown();
    snow[i].move();
    snow[i].wrap();
    snow[i].show();
  }
  if (keyPressed) {
    if (key == 'p') {
      overwrite = true;
    } else {
      overwrite = false;
    }
  }
  //noLoop();
}
void mouseDragged()
{
  strokeWeight(5);
  if (overwrite == true) {
    stroke(0);
    strokeWeight(100);
  } else {
    stroke(255);
  }
  point(mouseX, mouseY);
  strokeWeight(1);
  stroke(0);
}

class Snowflake
{
  int x, y;
  boolean isMoving;
  Snowflake()
  {
    x=(int)(Math.random()*300);
    y=(int)(Math.random()*300);
    isMoving=true;
  }
  void show()
  {
    fill(255);
    stroke(0);
    ellipse(x,y,3,3);
  }
  void lookDown()
  {
    if (y>=0 && y<=290 && get(x,y+7) != color(0)) {
      isMoving = false;
    } else {
      isMoving = true;
    }
  }
  void erase()
  {
    fill(0);
    ellipse(x, y, 6, 6);
  }
  void move()
  {
    if (isMoving==true) {
      y++;
    }
  }
  void wrap()
  {
    if (y>=299) {
      x = (int)(Math.random()*300);
      y = 0;
    }
  }
}


