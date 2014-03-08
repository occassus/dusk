package Occassus 
{
	import Occassus.GUI.ButtonHolder;

	public class Adventure extends GameMode 
	{
		
		public var adventureStarted:Boolean = false;
		public var numberOfJumps:int = new int();
		public var gameText:String = new String();
		//public var storedButtonIdentifierList:Array = new Array();
		//public var storedButtonDestinationList:Array = new Array();
		
		public function Adventure() 
		{
			super();
			
		}
		
		public function choiceMade(identifier:String, destination:String):void
		{
			this[destination]();	
		}//End of function choiceMade()
		
		public function testArea():void
		{
			adventureStarted = true;
			output("You are in a field of endless white-light, a faint grid pattern of lines surrounding you as though you're in some sort of wireframe world.<br><br><i>This is a test area allowing various game functions to be tested, it is not part of the actual gameplay.</i>", true);
			choice("Jump", "testJump");
			updateButtons();
		}//End of function testArea()
		
		private function testJump():void
		{
			numberOfJumps++;
			output("You successfully jump, perhaps you are ready for adventure yet the world is not ready for you.<br><br> Number of times jumped: "+numberOfJumps, true);
			choice("Continue", "testArea");
			updateButtons();
		}//End of function testJump()
		
		private function newGame():void
		{
			loadMenu("newGame");
		}//End of function newGame()
		
		private function loadOrSave():void
		{
			loadMenu("loadOrSave");
		}//End of function loadOrSave()
		
		private function setPreferences():void
		{
			loadMenu("setPreferences");
		}//End of function setPreferences()
		
		private function viewCharacter():void
		{
			loadMenu("viewCharacter");
		}//End of function viewCharacter()
		
		private function viewAppearance():void
		{
			loadMenu("viewAppearance");
		}//End of function viewAppearance()
		
		private function loadMenu(destination:String):void
		{
			Main.screens.saveButtons();
			gameText = Main.screens.window.currentText;
			Main.menus.previousMode = Main.choices.currentMode;
			Main.choices.changeMode("Menu");
			Main.menus[destination]();
		}//End of function loadMenu()
		
	}//End of class Adventure

}//End of Package