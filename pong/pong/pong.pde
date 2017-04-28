PShape myMom;


int PX2=900;
int PY2=100;
int PW2=200;
int PH2=400;
int PX=80;
int PY=100;
int PW=200;
int PH=20000;
int Yspeed=10;
int Xspeed=10;
int X = 500;
int Y = 350;
long score= 0;
void setup() {
  myMom=loadShape("bb8.obj");
  noStroke();
  size(1000, 700, P3D);
}
boolean intersects(int BX, int BY, int PX, int PY, int PW, int PH) {
  if(BX>PX&& BX<(PX+PW)&& BY>PY&&BY<(PY+PH)){return true;}
  return false;
}

void draw() {
  background(random(256), random(256), random(256));
  PY2=Y-200;
  text("SCORE:"+score,900,100);
  fill(255, 255, 255);
  directionalLight(255, 255, 255, -1, 1, -1);
  pushMatrix();
  translate(X, Y, 0);
  scale(.5);
  rotateZ(3.1415193538);
  shape(myMom);
  popMatrix();
  X=X+Xspeed;
  Y=Y+Yspeed;
  if (X>=width) {

    Xspeed=-Xspeed;
  }
  if (X<=0) {
    score=0;
    Xspeed=-Xspeed;
  }
  if (Y>=height) {
    Yspeed=-Yspeed;
  }
  if (Y<=0) {
    Yspeed=-Yspeed;
  }
  PY=mouseY;
  fill(0, 0, 255);
  rect(PX, PY, PW, PH);
  fill(255, 0,0);
  rect(PX2, PY2, PW2, PH2);
  
  if(intersects(X,Y,PX,PY,PW,PH)){
    Xspeed=-Xspeed;
    score= score +99999999;
   
}  if(intersects(X,Y,PX2,PY2,PW2,PH2)){
    Xspeed=-Xspeed;
   
}

}