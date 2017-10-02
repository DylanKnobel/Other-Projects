// if walkingAnimationSwitch =1 then display this image
int x = 300;
int y = 360;
boolean jumping = false;
boolean movingLeft = false;
boolean movingRight = false ;
int counter = 0;
PImage[] marioR = new PImage[3];
PImage[] marioL = new PImage[6];
PImage standingR, standingL;
int marioWalkR, marioWalkL;

void setup() {
  //loads sprites, sets screen size, loads sounds, and sets up animation
  size(1000, 600);
  marioWalkR = 0;
  marioWalkL = 0;
 

  standingR = loadImage("1.png");
  standingL = loadImage("4.png");
  for (int iR=0; iR<marioR.length; iR++) {
    marioR[iR] =loadImage(iR + ".png");
  }
  for (int iL=3; iL<marioL.length; iL++) {
    marioL[iL] =loadImage(iL + ".png");
  }
}

void draw() {
  // background(backdrop);
  background(255);
  moveSprite();
  image(marioR[marioWalkR],x, y);
  image(marioL[marioWalkL],x, y);

}



void moveSprite() {
  if (jumping == true) {
    if (y > 200) {
      y -= 5;
      if (y == 200) {
        jumping = false;
      }
    }
  } else if (jumping == false) {
    if (y == 430) {
      y = y + 0;
    } else {
      y = y + 5;
    }
  }
  if (movingRight) {
    x += 5;
    if (frameCount % 5 == 0) { 
      marioWalkR++;
      marioWalkR = marioWalkR % marioR.length;
    }
  } else if (x == 0) {
    x = x + 0;
  }
  if (movingLeft) {
    x -= 5;
    if (frameCount % 5 == 0) { 
      marioWalkL++;
      marioWalkL = marioWalkL % marioL.length;
      
    }
  }
   else{
        image(standingR, x,y);
    if (x <= -50){
        x = -50;}
    if (x >= 950){
        x = 950;}
   }
}
void keyPressed() {
  //this function will be called automatically every time a key on the keyboard is pressed
  if (key == ' ') {
    jumping = true;
  } else if (key == 'a') {
    movingLeft = true;
  } else if (key == 'd') {
    movingRight = true;
  }
}
void keyReleased() {
  if (key == ' ') {
    jumping = false;
  } else if (key == 'a') {
    movingLeft = false;
  } else if (key == 'd') {
    movingRight = false ;
  }
}