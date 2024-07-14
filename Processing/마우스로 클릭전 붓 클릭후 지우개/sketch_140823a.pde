int a=0;

void setup()
{
  size(400,400);
  stroke(255);
  background(0,0,0);
}

void draw()
{
  if(a==0){
ellipse(mouseX,mouseY,20,20);
  }
else{
  ellipse(mouseX,mouseY,50,50);
}
}

void mousePressed()
{
  if(a==1){fill(255); stroke(255); a=0;}//white
  else{fill(0); stroke(0); a=1;}//black
}
