float x,y,z;
int m1,m2;

void setup()
{
  size(400,400,P3D);
  x=width/2;
  y=height/2;
  z=10;
  rectMode(CENTER);
}

void draw()
{
  background(0);
  m1=mouseX;
  m2=mouseY;
  if(m1 >= 180) m1=180;
  if(m2 >= 180) m2=180;
  
  translate(200,200,0);
  rotateZ(m1*(PI/180));
  rotateY(m2*(PI/180));
  rotateX(0);
  rect(0,0,100,100);
}
