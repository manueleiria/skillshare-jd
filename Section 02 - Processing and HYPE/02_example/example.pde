void setup() {
  size(640,640,P3D);
  H.init(this).background(#202020).use3D(true).autoClear(true);
  smooth();

  // HYPE / processing
  int numAssets = 25;
  HGridLayout layout = new HGridLayout()
    .startX(50)
    .startY(50)
    .spacing(100,100)
    .cols(5)
  ;
}

void draw() {
  H.drawStage();

  // saveFrame("frames/#########.tif"); if (frameCount == 900) exit();
}
