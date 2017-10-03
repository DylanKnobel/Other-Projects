int x = 300;
int y = 360;
boolean jumping = false;
boolean movingLeft = false;
boolean movingRight = false ;
int counter = 0;
PImage[] marioR = new PImage[3];
PImage[] marioL = new PImage[3];
PImage standingR, standingL;
int marioWalkR, marioWalkL;
int state = 3;

void setup() {
  //loads sprites, sets screen size, loads sounds, and sets up animation
  size(1000, 600);
  marioWalkR = 0;
  marioWalkL = 0;


    standingR = loadImage("r1.png");
    standingL = loadImage("l1.png");
  for (int iR=0; iR<marioR.length; iR++) {
    marioR[iR] =loadImage("r"+ iR + ".png");
  }
  for (int iL=0; iL<marioL.length; iL++) {
    marioL[iL] =loadImage("l" + iL + ".png");
  }
}

void draw() {
  // background(backdrop);
//backgroundColour();
background(255);
  moveSprite();

  walkingAnimation();
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
    state = 1;
  } else if (x == 0) {
    x = x + 0;
  }
  if (movingLeft) {
    x -= 5;
    state = 2;
  } else {
    image(standingR, x, y);
    if (x <= 0) {
      x = 0;
    }
    if (x >= 915) {
      x = 915;
    }
  }
}
void keyPressed() {
  //this function will be called automatically every time a key on the keyboard is pressed
  if (key == ' ') {
    jumping = true;
  } else if (key == 'a') {
    movingLeft = true;
    state = 1;
  } else if (key == 'd') {
    movingRight = true;
    state = 2;
  }
}
void keyReleased() {
  if (key == ' ') {
    jumping = false;
  } else if (key == 'a') {
    movingLeft = false;
    state = 4;
  } else if (key == 'd') {
    movingRight = false ;
    state = 3;
  }
}


void walkingAnimation() {
  if (state == 1) {
    image(marioR[marioWalkR], x, y);
    if (frameCount % 5 == 0) { 
      marioWalkR++;
      marioWalkR = marioWalkR % marioR.length;
    }
  } else if (state == 2) {
    image(marioL[marioWalkL],x, y);
    if (frameCount % 5 == 0) { 
      marioWalkL++;
      marioWalkL = marioWalkL % marioL.length;
    }
  } else if (state == 3) {
    standingR = loadImage("r1.png");
  } else if (state == 4) {
    standingL = loadImage("l1.png");
  }
}


//void backgroundColour(){
//if (mousePressed && (mouseButton == LEFT)){
//  background(175,0,175);
//}
//if (mousePressed && (mouseButton == RIGHT)){

//}
//}