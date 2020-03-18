Wve[] waves = new Wve[20];

void setup() {
  size(1800, 400);
  background(18);
  colorMode(HSB, 360, 100, 100, 100);
  for (int i = 0; i < waves.length; i++)
    waves[i] = new Wve(i*4, i*8);
}

void draw() {
  background(18);
  for (int i = 0; i < waves.length; i++)
    waves[i].update();
}

class Wve {
  float theta;
  float start_position;
  float xpos;
  float ypos;
  float previous_frame_xpos;
  float previous_frame_ypos;
  float time_delta;
  int direction;
  int hue;
  int i;

  Wve(float wve_start_position, int start_color) {
    xpos = start_position = wve_start_position;
    ypos = height/2;

    previous_frame_xpos = xpos;
    previous_frame_ypos = ypos;
  
    i =start_color;
  
    theta = 0;
    time_delta = 1;
    direction = 1;
    hue = 0;
  }

  void move() {
    xpos = start_position;
    ypos = height/2;
    previous_frame_xpos = start_position;
    previous_frame_ypos = height/2;
    theta = 0;
    time_delta = time_delta + direction;
    if (time_delta > 313)
      direction *= -1;
    if (time_delta < 2)
      direction *= -1;
  }

  void draw() {
    int saturation = 99;
    int brightness = 99;

    for (int i =0; i<100; i++) {
      xpos = theta * 30 + start_position;
      ypos = height/2 * sin(theta) + height/2;

      stroke(hue, saturation, brightness, 90);
      line(xpos, ypos, previous_frame_xpos, previous_frame_ypos);

      theta = theta + 0.01 * time_delta;
      previous_frame_xpos = xpos;
      previous_frame_ypos = ypos;
    }
  }

  void update() {
    hue = 360*i % 359;
    i+=1;
    draw();
    move();
  }
}

void keyPressed() {
  if ( key == ' ' ) {
    save( "waves.png" );
  }
}
