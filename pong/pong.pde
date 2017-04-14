PShape myMom;

int PX=80;
int PY=100;
int PW=20;
int PH=200;
int Yspeed=10;
int Xspeed=10;
int X = 500;
int Y = 350;
void setup() {
  myMom=loadShape("face.obj");
  //noStroke();
  size(1000, 700, P3D);
}
boolean intersects(int BX, int BY, int PX, int PY, int PW, int PH) {
  if(BX>PX&& BX<(PX+PW)&& BY>PY&&BY<(PY+PH)){return true;}
  return false;
}

void draw() {
  background(200);
  fill(255, 255, 255);
  directionalLight(255, 255, 255, -1, 1, -1);
  pushMatrix();
  translate(X, Y, 0);
  scale(50);
  rotateZ(3.1415193538);
  shape(myMom);
  popMatrix();
  X=X+Xspeed;
  Y=Y+Yspeed;
  if (X>=width) {

    Xspeed=-Xspeed;
  }
  if (X<=0) {
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
  if(intersects(X,Y,PX,PY,PW,PH)){
    Xspeed=-Xspeed;
}
}