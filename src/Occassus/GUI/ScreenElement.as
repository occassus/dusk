package Occassus.GUI 
{
	import flash.display.Sprite;
	import Occassus.GameObject;

	//All classes which display an object as part of the GUI extend from this class
	public class ScreenElement extends GameObject
	{
		
		public var position:Sprite = new Sprite();
		
		public function ScreenElement():void
		{
			super();
			
		}//End of constructor
		
		public function relocate(x:int,y:int):void
		{
			this.position.x = x;
			this.position.y = y;
		}
		
		public function appear():void
		{
			this.addChild(position);
		}//End of function appear()
		
		public function disappear():void
		{
			if (this.contains(position)) {
				this.removeChild(position);
			}
		}//End of function disappear()
		
	}//End of class ScreenElement

}//End of package