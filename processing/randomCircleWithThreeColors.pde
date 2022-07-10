// プログラム開始時に一度だけ実行される処理
void setup() {
  size(500, 500);
  int height = 500;
  int width = 500;
  int circleNum = 10;
  int circleLength;
  int index;

  background(255);

  // int[] [] colors = {
  //   { 186, 104, 200 },
  //   { 176, 190, 197 },
  //   { 239, 83, 80 }
  // };

  int[] [] colors = {
   { 255, 128, 171 },
   { 24, 255, 255 },
   { 255, 214, 0 }
  };

  noStroke();

  for (int i = 0; i <= circleNum; i++) {
    index = (int) random(colors.length);
    circleLength = (int) random(50, 200);

    fill(colors[index][0], colors[index][1], colors[index][2]);
    ellipse(random(height), random(width), circleLength, circleLength);
  };
}

// setup()実行後に繰り返し実行される処理
void draw() {
}
