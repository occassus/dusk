package Occassus.GUI 
{
	import flash.display.Bitmap;
	import flash.events.Event;
	import Occassus.GameMode;
	import Occassus.GameObject;
	import Occassus.Main;
	
	public class ScreenHandler extends GameMode
	{
		
		[Embed(source = "../title.png")]
		public var titleImage:Class;
		public var title:Bitmap = new titleImage();
		public var choice1:GameButton = new GameButton(90, 660, 150, 25);
		public var choice2:GameButton = new GameButton(260, 660, 150, 25);
		public var choice3:GameButton = new GameButton(430, 660, 150, 25);
		public var choice4:GameButton = new GameButton(600, 660, 150, 25);
		public var choice5:GameButton = new GameButton(770, 660, 150, 25);
		public var choice6:GameButton = new GameButton(90, 690, 150, 25);
		public var choice7:GameButton = new GameButton(260, 690, 150, 25);
		public var choice8:GameButton = new GameButton(430, 690, 150, 25);
		public var choice9:GameButton = new GameButton(600, 690, 150, 25);
		public var choice10:GameButton = new GameButton(770, 690, 150, 25);
		public var choice11:GameButton = new GameButton(90, 720, 150, 25);
		public var choice12:GameButton = new GameButton(260, 720, 150, 25);
		public var choice13:GameButton = new GameButton(430, 720, 150, 25);
		public var choice14:GameButton = new GameButton(600, 720, 150, 25);
		public var choice15:GameButton = new GameButton(770, 720, 150, 25);
		public var startButton:GameButton = new GameButton(437, 425, 150, 25);
		public var menu1:GameButton = new GameButton(90, 10, 150, 25);
		public var menu2:GameButton = new GameButton(260, 10, 150, 25);
		public var menu3:GameButton = new GameButton(430, 10, 150, 25);
		public var menu4:GameButton = new GameButton(600, 10, 150, 25);
		public var menu5:GameButton = new GameButton(770, 10, 150, 25);
		
		public var window:MainText = new MainText(200, 50, 624, 600);
		public var identifierList:Array = new Array();
		public var destinationList:Array = new Array();
		public var clouds:BackgroundClouds = new BackgroundClouds();
		
		public var division1:MainText = new MainText(200, 50, 624, 100);
		public var division2:MainText = new MainText(200, 170, 624, 100);
		public var division3:MainText = new MainText(200, 290, 624, 100);
		public var division4:MainText = new MainText(200, 410, 624, 100);
		public var division5:MainText = new MainText(200, 530, 624, 100);
		

		
		public function ScreenHandler() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}//End of Constructor
		
		public function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			clearButtons();
			hideDivisions(false);
			addChildren();
			setMenu();
			startScreen();
			
		}//End of function init()
		
		public function addChildren():void
		{
			this.addChild(clouds);
			this.addChild(title);
			this.addChild(choice1);
			this.addChild(choice2);
			this.addChild(choice3);
			this.addChild(choice4);
			this.addChild(choice5);
			this.addChild(choice6);
			this.addChild(choice7);
			this.addChild(choice8);
			this.addChild(choice9);
			this.addChild(choice10);
			this.addChild(choice11);
			this.addChild(choice12);
			this.addChild(choice13);
			this.addChild(choice14);
			this.addChild(choice15);
			this.addChild(startButton);
			this.addChild(menu1);
			this.addChild(menu2);
			this.addChild(menu3);
			this.addChild(menu4);
			this.addChild(menu5);
			this.addChild(window);
			this.addChild(division1);
			this.addChild(division2);
			this.addChild(division3);
			this.addChild(division4);
			this.addChild(division5);
		}//End of function addChildren()
		
		public function showInterface():void
		{
			choice1.appear();
			choice2.appear();
			choice3.appear();
			choice4.appear();
			choice5.appear();
			choice6.appear();
			choice7.appear();
			choice8.appear();
			choice9.appear();
			choice10.appear();
			choice11.appear();
			choice12.appear();
			choice13.appear();
			choice14.appear();
			choice15.appear();
			window.appear();
		}//End of function showInterface()
		
		public function hideInterface():void
		{
			choice1.disappear();
			choice2.disappear();
			choice3.disappear();
			choice4.disappear();
			choice5.disappear();
			choice6.disappear();
			choice7.disappear();
			choice8.disappear();
			choice9.disappear();
			choice10.disappear();
			choice11.disappear();
			choice12.disappear();
			choice13.disappear();
			choice14.disappear();
			choice15.disappear();
			window.disappear();
		}//End of function hideInterface()
		
		public function hideDivisions(restoreMain:Boolean):void
		{
			division1.disappear();
			division2.disappear();
			division3.disappear();
			division4.disappear();
			division5.disappear();
			if (restoreMain) {
				window.appear();
			}//End of if conditional
		}//End of function hideDivisions()
		
		public function showDivisions(hideMain:Boolean):void
		{
			division1.appear();
			division2.appear();
			division3.appear();
			division4.appear();
			division5.appear();
			if (hideMain) {
				window.disappear();
			}//End of if conditional
		}//End of function showDivisions()
		
		public function addChoice(identifier:String, destination:String):void
		{
			identifierList.push(identifier);
			destinationList.push(destination);
			
		}//End of function addChoice()
		
		public override function updateButtons():void
		{
			var buttonList:Array = ["choice1", "choice2", "choice3", "choice4", "choice5", "choice6", "choice7", "choice8", "choice9", "choice10", "choice11", "choice12", "choice13", "choice14", "choice15"];
			for (var index:String in buttonList)
			{
				if (identifierList.length > 0)
				{
					this[buttonList[index]].rename(identifierList.shift());
					this[buttonList[index]].setDestination(destinationList.shift());
					this[buttonList[index]].appear();
				}//End of if conditional
				else
				{
					this[buttonList[index]].rename("");
					this[buttonList[index]].setDestination("");
					this[buttonList[index]].disappear();
				}//End of else conditional
			}//End of for loop	
			identifierList.splice(0);
			destinationList.splice(0);
		}//End of function updateButtons()
		
		public function clearButtons():void
		{
			var buttonList:Array = ["choice1", "choice2", "choice3", "choice4", "choice5", "choice6", "choice7", "choice8", "choice9", "choice10", "choice11", "choice12", "choice13", "choice14", "choice15"];
			for (var index:String in buttonList)
			{
				this[buttonList[index]].rename("");
				this[buttonList[index]].setDestination("");
				this[buttonList[index]].disappear();
			}//End of for loop
		}//End of function clearButtons()
		
		public function saveButtons():void
		{
			var buttonList:Array = ["choice1", "choice2", "choice3", "choice4", "choice5", "choice6", "choice7", "choice8", "choice9", "choice10", "choice11", "choice12", "choice13", "choice14", "choice15"];
			for (var index:String in buttonList) {
				if (this[buttonList[index]].identifier) {
					Main.storedButtonValues[buttonList[index]].identifier = this[buttonList[index]].identifier;
				}//End of if conditional
				if (this[buttonList[index]].destination) {
					Main.storedButtonValues[buttonList[index]].destination = this[buttonList[index]].destination;
				}//End of if conditional
			}//End of for loop
			
			//Early function commented out to test new version using objects rather than arrays as this may solve save/load problem.
			/*for (var index:String in buttonList)
			{
				if (this[buttonList[index]].identifier) {
					Main.story.storedButtonIdentifierList.push(this[buttonList[index]].identifier);
				}//End of if conditional
				if (this[buttonList[index]].destination) {
					Main.story.storedButtonDestinationList.push(this[buttonList[index]].destination);	
				}
			}//End of for loop
			trace('saveButtons called', Main.story.storedButtonIdentifierList);
			clearButtons();*/
		}//End of function saveButtons()
		
		public function loadButtons():void
		{
			clearButtons();
			var buttonList:Array = ["choice1", "choice2", "choice3", "choice4", "choice5", "choice6", "choice7", "choice8", "choice9", "choice10", "choice11", "choice12", "choice13", "choice14", "choice15"];
			for (var index:String in buttonList) {
				if (Main.storedButtonValues[buttonList[index]].identifier) {
					this[buttonList[index]].identifier = Main.storedButtonValues[buttonList[index]].identifier;
					addChoice(Main.storedButtonValues[buttonList[index]].identifier, Main.storedButtonValues[buttonList[index]].destination);
				}//End of if conditional
			}//End of for loop
			updateButtons();
			
			/*for (var index:String in Main.story.storedButtonIdentifierList)
			{
				trace(Main.story.storedButtonIdentifierList, Main.story.storedButtonDestinationList);
				//addChoice(Main.story.storedButtonIdentifierList.shift(), Main.story.storedButtonDestinationList.shift());
			}//End of for loop
			updateButtons();*/
		}//End of function loadButtons()
		
		public function startScreen():void
		{
			hideInterface();
			hideMenu();
			title.x = 200;
			title.y = 250;
			startButton.rename("Enter Game");
			startButton.setDestination("");
		}//End of function startScreen()
		
		public function closeStartScreen():void
		{
			this.removeChild(title);
			startButton.disappear();
			showInterface();
			showInitialText();
		}//End of function closeStartScreen()
		
		public function hideMenu():void
		{
			menu1.disappear();
			menu2.disappear();
			menu3.disappear();
			menu4.disappear();
			menu5.disappear();
		}//End of function hideMenu()
		
		public function showInitialText():void
		{
			output("Welcome to Dusk: Phoenix. Version 0.0.3<br><br>This is an adult text RPG adventure and contains content inappropriate for minors, only play this game if you are of the legal age in your country to view sexually explicit material.<br><br>This game also includes a wide variety of fetishes. Those which are only likely to appeal to specific audiences are switched off by default. To switch these options back on, open the preferences menu. These preferences will be saved when you save your game.", true);
			output("<br><br>This game is open source. For information on the latest version or recent updates check www.occassus.com to view the development blog.", false);
		}
		
		public function showMenu():void
		{
			menu1.appear();
			menu2.appear();
			menu3.appear();
			menu4.appear();
			menu5.appear();
		}//End of function showMenu()
		
		public function setMenu():void
		{
			menu1.setup("New Game", "newGame",'<font face="Arial" color="#000000" size="18">');
			menu2.setup("Data", "loadOrSave",'<font face="Arial" color="#000000" size="18">');
			menu3.setup("Preferences", "setPreferences",'<font face="Arial" color="#000000" size="18">');
			menu4.setup("Character", "viewCharacter",'<font face="Arial" color="#000000" size="18">');
			menu5.setup("Appearance", "viewAppearance",'<font face="Arial" color="#000000" size="18">');
			
		}//End of function setMenu()
		
	}//End of class ScreenHandler

}//End of package