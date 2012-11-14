int sW = 640;
int sH = 480;
int sD = (sW+sH)/2;
int fps = 60;
int numParticles = 500;
Bacterium bacterium;
Bacterium[] bacteria = new Bacterium[numParticles];

void setup() {
  size(sW, sH, OPENGL);
  frameRate(fps);
  // You can load your sprite from a folder of images like this:
  //example = new AnimSprite("runner",12);
  // ...or from a spritesheet like this:
  //example = new AnimSprite("walksequence",12,150,185,6,5);
  // ...and here's a subclass with behaviors already included:
  bacterium = new Bacterium();
  for (int i=0;i<bacteria.length;i++) {
    bacteria[i] = new Bacterium(bacterium.frames);
    bacteria[i].make3D();
    bacteria[i].p = new PVector(random(sW), random(sH), random(sD)-(sD/2));
    bacteria[i].index = random(bacteria[i].frames.length);
    bacteria[i].r = 0;
    bacteria[i].t = new PVector(random(sW), random(sH), random(sD)-(sD/2));
  }
  setupGl(); //goes LAST in setup
}

void draw() {
  drawGl(); //goes FIRST in draw
  background(0);
  for (int i=0;i<bacteria.length;i++) {
    bacteria[i].run();
  }
  println(frameRate);
}

void keyPressed() {
  for (int i=0;i<bacteria.length;i++) {
    bacteria[i].loopIn = 10;
    bacteria[i].loopOut = 12;
  }
}

