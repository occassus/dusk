package Occassus.GUI 
{
	import flash.display.*;
	import flash.events.Event;
	import flash.filters.*;
	import flash.geom.*;

	public class BackgroundClouds extends ScreenElement 
	{
		public var m:Matrix = new Matrix();
		private var perlinData:BitmapData;
		private var perlinBitmap:Bitmap;
		private var cmf:ColorMatrixFilter;
		private var blueBackground:Shape;
		private var skyColor:uint;
		private var displayWidth:Number;
		private var displayHeight:Number;
		private var periodX:Number;
		private var periodY:Number;
		private var seed:int;
		private var offsets:Array;
		private var numOctaves:int;	
		private var animated:Boolean = true;
		
		public function BackgroundClouds():void
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			var i:int;
			this.appear();
			position.x = 0;
			position.y = 0;
			displayWidth = 1024;
			displayHeight = 768;	
			periodX=150;
			periodY=150;
			numOctaves = 3;
			skyColor = 0x2255AA
			perlinData = new BitmapData(displayWidth,displayHeight,true);
			perlinBitmap = new Bitmap(perlinData);
			cmf = new ColorMatrixFilter([0,0,0,0,255, 0,0,0,0,255, 0,0,0,0,255, 1,0,0,0,0]);
			
			m.createGradientBox( 1024, 768, 4.69, 0, 0); 
			blueBackground = new Shape();
			//blueBackground.graphics.beginFill(skyColor);
			blueBackground.graphics.beginGradientFill(GradientType.LINEAR, [0x240B3B,0x0B243B], [1, 0.8], [0, 255], m);
			blueBackground.graphics.drawRect(0,0,displayWidth,displayHeight);
			blueBackground.graphics.endFill();
			position.addChild(blueBackground);
			position.addChild(perlinBitmap);
			
			//var outline:GlowFilter=new GlowFilter(0xA8C2EE,1.0,1.25,1.25,10);
			//outline.quality=BitmapFilterQuality.MEDIUM;
			seed = int(Math.random()*10000);
			offsets = new Array();
			for (i = 0; i<=numOctaves-1; i++) {
				offsets.push(new Point());
			}//End for loop
			this.addEventListener(Event.ENTER_FRAME, onEnter);
			perlinData.perlinNoise(periodX, periodY, numOctaves, seed, false, true, 1, true, offsets);
			perlinData.applyFilter(perlinData, perlinData.rect, new Point(), cmf);
		}//End of function init()
		
			private function onEnter(evt:Event):void {
			if (animated) {
				var i:int;
				for (i = 0; i<=numOctaves-1; i++) {
					offsets[i].x += -1;
					offsets[i].y += 0.5;
				}//End for loop
				perlinData.perlinNoise(periodX, periodY, numOctaves, seed, false, true, 1, true, offsets);
				perlinData.applyFilter(perlinData, perlinData.rect, new Point(), cmf);
			}//End if conditional
		}//End of function onEnter()
		
		public function stopClouds():void {
			this.animated = false;
		}
		
		public function startClouds():void {
			this.animated = true;
		}
		
	}//End of class BackgroundClouds

}//End of package


 


 



 








 





			
