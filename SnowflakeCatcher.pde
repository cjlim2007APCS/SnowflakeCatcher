Snowflake[] snow;
boolean delete = false;
void setup()
{
  size(300,300);
  snow = new Snowflake[1000];
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
      delete = true;
    } else {
      delete = false;
    }
  }
}
void mouseDragged()
{
  if (delete == true) {
    stroke(0);
  } else {
    stroke(255);
  }
  point(mouseX, mouseY);
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
    ellipse(x,y,5,5);
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
    ellipse(x, y, 7, 7);
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


