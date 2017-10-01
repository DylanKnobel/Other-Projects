// if walkingAnimationSwitch =1 then display this image
int x = 300;
int y = 360;
boolean jumping = False;
boolean movingLeft = False;
boolean movingRight = False ;
int counter = 0;
walkingAnimationRight = [];
walkingAnimationLeft = [];
int spriteToShowRight = 0;
int spriteToShowLeft = 0;

void setup() {
  //loads sprites, sets screen size, loads sounds, and sets up animation
  size(1000, 600);
  standingR = loadImage("0.png");
  standingL = loadImage("3.png");
  for iR in range(0, 2) {
    fileNameR =str(iR) + ".png";
    walkingAnimationRight.append(loadImage(fileNameR));
  }
  for iL in range(2, 4) {
    fileNameL =str(iL) + ".png";
    walkingAnimationLeft.append(loadImage(fileNameL));
  }
}


void draw() {
  //'''sets up background, music, and calls on game mechanic definitions
  background(backdrop);
  rectMode(CENTER);
  fill(0, 52, 76);
  moveSprite();
  interaction();
}

void moveSprite():
//'''tells the sprite what to do when movment variables are set to true, such as jump, change sprites, ect...
if jumping == True:
if y > 300:
y -= 7
  elif jumping == False:
if y == 360:
y = y + 0
  else:
y = y + 7
  elif x == 0:
x == x + 0
  if movingRight:
x += 5
  image(walkingAnimationRight[spriteToShowRight], x, y)
  if frameCount % 10 == 0:
spriteToShowRight += 1
  spriteToShowRight = spriteToShowRight % len(walkingAnimationRight)
  elif movingLeft:
x -= 5
  image(walkingAnimationLeft[spriteToShowLeft], x, y)
  if frameCount % 10 == 0:
spriteToShowLeft += 1
  spriteToShowLeft = spriteToShowLeft % len(walkingAnimationLeft)
  else:
image(standingR, x, y)
  if x <= -50:
x = -50
  if x >= 950:
x = 950