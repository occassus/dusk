package Occassus 
{

	//The different modes of gameplay all extend this class to provide functions needed in all of these classes
	public class GameMode extends GameObject 
	{
		
		public function GameMode():void
		{
			super();
			
		}//End of constructor
		
		public function output(words:String, replace:Boolean):void
		{
			Main.screens.window.output(words, replace);
			
		}//End of function output()
		
		public function choice(identifier:String, destination:String):void
		{
			Main.screens.addChoice(identifier, destination);
			
		}//End of function choice()
		
		public function updateButtons():void
		{
			Main.screens.updateButtons();
			
		}//End of function updateScreen()
		
		public function changeMode(words:String):void
		{
			Main.choices.changeMode(words);
		}//End of function changeMode()
		
		/*public function wait(identifier):void
		{
			waited = waited + 1;
			choice(identifier, lastDestination);
			updateButtons();
		}*/
		
	}//End of class GameMode

}//End of package