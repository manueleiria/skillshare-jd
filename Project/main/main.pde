import hype.*;
import hype.extended.behavior.*;
import hype.extended.colorist.*;
import hype.extended.layout.*;
import hype.interfaces.*;
import processing.pdf.*;

HDrawablePool pool;
HColorPool colors;

void setup(){
	size(600,600);
	H.init(this).background(#101010);
	smooth();

	colors = new HColorPool(#225378,#1695A3,#ACF0F2,
                          #F3FFE2,#EB7F00);

	pool = new HDrawablePool(900);
	pool.autoAddToStage()
		//.add(new HShape("asset01.svg"),2)
		//.add(new HShape("asset02.svg"),2)
		//.add(new HShape("asset03.svg"),2)
		//.add(new HShape("asset04.svg"),2)
		//.add(new HShape("asset11.svg"),11)
		//.add(new HShape("asset12.svg"),11)
    .add(new HShape("asset13.svg"),1)
    //.add(new HShape("asset21.svg"),5)
    //.add(new HShape("asset22.svg"),5)
    //.add(new HShape("asset23.svg"),5)
    //.add(new HShape("asset24.svg"),5)
    .add(new HShape("asset31.svg"),5)
    .add(new HShape("asset32.svg"),5)
    .add(new HShape("asset33.svg"),5)
    .add(new HShape("asset34.svg"),5)
    //.add(new HShape("asset41.svg"),2)
    //.add(new HShape("asset42.svg"),2)
    //.add(new HShape("asset43.svg"),2)
    //.add(new HShape("asset44.svg"),2)

		.layout(
			new HGridLayout()
			.startX(10)
			.startY(10)
			.spacing(20,20)
			.cols(30)
		)

		.onCreate(
				new HCallback() {
					public void run(Object obj) {
						HShape d = (HShape) obj;
						d
							.enableStyle(false)
							.strokeWeight(0)
							.anchorAt(H.CENTER)
							.rotate((int)random(4)*90+45)
              .size(20)
						;
						d.randomColors(colors.fillOnly());
					}
				}
		)
		.requestAll()
	;

	saveVector();
	noLoop();
}

void draw() {
	H.drawStage();
}

void saveVector() {
	PGraphics tmp = null;
	tmp = beginRecord(PDF, "render.pdf");


	if(tmp == null) {
		H.drawStage();
	} else {
		H.stage().paintAll(tmp, false, 1);
	}

	endRecord();
}
