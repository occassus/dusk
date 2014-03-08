package Occassus 
{

	public class ChoiceHandler extends GameMode 
	{
		
		public var currentMode:String = "Start Screen";
		
		public function ChoiceHandler() 
		{
			super();
			
		}//End of Constructor
		
		public function buttonPress(identifier:String, destination:String):void
		{
			switch(currentMode)
			{
				case "Start Screen":
					changeMode("Menu");
					Main.screens.closeStartScreen();
					Main.screens.showMenu();
					Main.screens.clouds.stopClouds();
					choice("Credits", "showCredits");
					choice("Version", "showVersion");
					updateButtons();
					return;
				break;
				case "Menu":
					Main.menus[destination]();
				break;
				case "Adventure":
					Main.story.choiceMade(identifier, destination);
				break;
				default:
				break;
			}//End of switch conditional
		}//End of function buttonPress()
		
		public override function changeMode(words:String):void
		{
			currentMode = words;
		}//End of function changeMode()
		
		
	}//End of class ChoiceHandler

}//End of package