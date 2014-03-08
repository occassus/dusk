package Occassus 
{
	import flash.display.Sprite;

	
	//All classes used in the game extend this class to provide functions needed in all classes
	public class GameObject extends Sprite 
	{
		
		public function GameObject():void
		{
			super();
			
		}//End of constructor
		
		public function dice(min:Number, max:Number):Number
		{
			return Math.floor(Math.random() * (1 + max - min) + min);	
		}//End of function dice()
		
	}//End of class GameObject

}//End of package Occassus