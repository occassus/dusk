package Occassus 
{
	
	import flash.net.SharedObject;
	import flash.utils.describeType
	
	public class MenuHandler extends GameMode 
	{
		
		public var previousMode:String = new String();
		
		public function MenuHandler() 
		{
			super();
			
		}//End of Constructor
		
		public function newGame():void
		{
			Main.screens.hideDivisions(true);
			if (Main.story.adventureStarted) {
				output("You are currently playing a game, are you sure you want to start a new game?", true);
				choice("Yes", "startNewGame");
				choice("Return to game", "leaveMenu");
				updateButtons();
			}//End of if conditional
			else {
				startNewGame();			
			}//End of else conditional
		}//End of function newGame()
		
		public function startNewGame():void
		{
			Main.choices.changeMode("Adventure");
			Main.story = new Adventure();
			Main.story.testArea();
		}//End of function startNewGame()
		
		public function loadOrSave():void
		{
			Main.screens.showDivisions(true);
			var divisions:Array = ["division1", "division2", "division3", "division4", "division5"];
			var slots:Array = ["One", "Two", "Three", "Four", "Five"];
			var loadIdentifierList:Array = new Array();
			var saveIdentifierList:Array = new Array();
			var loadDestinationList:Array = new Array();
			var saveDestinationList:Array = new Array();
			for (var index:String in divisions) {
				var saveFile:SharedObject = SharedObject.getLocal(slots[index]);
				
				if (Main.story.adventureStarted) {
					saveIdentifierList.push("Save in Slot " + slots[index]);
					saveDestinationList.push("saveIn" + slots[index]);
				}//End of if conditional
				if (saveFile.data.exists) {
					var saveTime:Date = saveFile.data.saveTime;
					Main.screens[divisions[index]].output('<b>Slot ' + slots[index] + ':</b> ', true);
					Main.screens[divisions[index]].output( +saveTime.getDate() + '/' + (saveTime.getMonth()+1) + '/' + saveTime.getFullYear() + ' ', false);
					if (saveTime.getHours() > 0 && saveTime.getHours() < 10) {
						Main.screens[divisions[index]].output('0' + saveTime.getHours(), false);
					}//End of if conditional
					else {
						Main.screens[divisions[index]].output(saveTime.getHours(), false);
					}//End of else conditional
					if (saveTime.getMinutes() > 0 && saveTime.getMinutes() < 10) {
						Main.screens[divisions[index]].output(':0' + saveTime.getMinutes(), false);
					}//End of if conditional
					else {
						Main.screens[divisions[index]].output(':' + saveTime.getMinutes(), false);
					}//End of else conditional
					loadIdentifierList.push("Load Slot " + slots[index]);
					loadDestinationList.push("loadFrom" + slots[index]);
				}//End of if conditional
				else {
					Main.screens[divisions[index]].output('<b>Slot ' + slots[index] + ':</b> Empty', true);
				}//End of else conditional
			}//End of for loop
			while (saveIdentifierList.length > 0) {
				choice(saveIdentifierList.shift(), saveDestinationList.shift());
			}//End of while loop
			while (loadIdentifierList.length > 0) {
				choice(loadIdentifierList.shift(), loadDestinationList.shift());
			}//End of while loop
			choice ("Return to Game", "leaveMenu");
			updateButtons();
		}//End of function loadOrSave()
		
		public function setPreferences():void
		{
			output("This screen will allow you to set your in-game preferences once it's been implemented. This is still in progress.", true);
			choice("Return to Game", "leaveMenu");
			updateButtons();
		}//End of function setPreferences()
		
		public function viewCharacter():void
		{
			output("This screen will allow you to view your character's attributes once it's been implemented. This is still in progress.", true);
			choice("Return to Game", "leaveMenu");
			updateButtons();
		}//End of function viewCharacter()
		
		public function viewAppearance():void
		{
			output("This screen will allow you to view your character's appearance once it's been implemented. This is still in progress.", true);
			choice("Return to Game", "leaveMenu");
			updateButtons();
		}//End of function viewAppearance
		
		public function showCredits():void
		{
			output('<b>Alpha testers</b><br>Betawaffle<br>Little Red Rabbit<br>Lord William<br>Lynx<br>Obsidian Shark<br><br>', true);
			output('<b>Code Contributions</b><br>Obsidian Shark<br>Void Director<br><br>', false);
			output("Special thanks are due to Fenoxo for creating Corruption of Champions which was the inspiration of this game. If you haven't played it, I recommend checking it out at www.fenoxo.com", false);
		}//End of function showCredits()
		
		public function showVersion():void
		{
			output('<b>Version 0.0.3 ~ Game Engine Prototype</b><br><br><b>*</b> Darkened background screen, decreased transparency of text window.<br><b>*</b> Added credits and version information<br><b>*</b> Stopped animation of clouds after entering game.<br><b>*</b> Added menu functionality.<br><b>*</b> Added test area.<br><br>', true);
			output('<b>Version 0.0.2 ~ Game Engine Prototype</b><br><br><b>*</b> Added GUI.<br><b>*</b> Added background screen.<br><br>', false);
			output('<b>Version 0.0.1 ~ Game Engine Prototype</b><br><br><b>*</b> Initial test of basic elements.<br><br>', false);
		}//End of function showVersion()
		
		public function loadButtons():void
		{
			Main.screens.loadButtons();
		}//End of function loadButtons()
		
		public function leaveMenu():void
		{
			if (previousMode) {
			Main.choices.currentMode = previousMode;
			loadButtons();
			output(Main.story.gameText, true);
			Main.screens.hideDivisions(true);
			return;
			}//End of if conditional
			Main.screens.showInitialText();
			choice("Credits", "showCredits");
			choice("Version", "showVersion");
			Main.screens.hideDivisions(true);
			updateButtons();
		}//End of function leaveMenu()
		
		public function notImplemented():void
		{
			output("<br><br>This function has not yet been implemented, sorry", false);
		}//End of function notImplemented()
		
		public function addStaticObject(storeName:String, to:Object, from:Object):void {
			var variables:XMLList = describeType(from).descendants("variable");
			to[storeName] = { };
			for each(var item:XML in variables) {
				//to[storeName][item.attribute("name")] = from[item.attribute("name")];
				to[storeName][item.attribute("name")] = { saved: from[item.attribute("name")] } //Changed this line to prevent ongoing changes to data.
			}//End of for loop
		}//End of function addStaticObject()
		
		public function saveData(slot:String):void {
			var saveFile:SharedObject = SharedObject.getLocal(slot);
			var saveTime:Date = new Date();
			saveFile.data.exists = true;
			saveFile.data.saveTime = saveTime;
			saveFile.data.mode = previousMode;
			addStaticObject("adventure", saveFile.data, Main.story);
			addStaticObject("buttons", saveFile.data, Main.storedButtonValues);
			saveFile.flush();
			saveFile.close();
		}//End of function saveData()
		
		public function loadStaticObject(storeName:String, to:Object, from:Object):void {
			for (var prop:String in from[storeName]) {
				to[prop] = from[storeName][prop].saved;
			}//End of for loop
		}//End of function loadStaticObject()
		
		public function loadData(slot:String):void {
			var saveFile:SharedObject = SharedObject.getLocal(slot);
			if (saveFile.data.exists) {
				loadStaticObject("adventure", Main.story, saveFile.data);
				loadStaticObject("buttons", Main.storedButtonValues, saveFile.data);
				previousMode = saveFile.data.mode;
				saveFile.flush();
				saveFile.close();
			}//End of conditional loop
		}//End of function loadData()
		
		public function saveInOne():void {
			saveData("One");
			leaveMenu();
		}//End of function saveInOne()
		
		public function saveInTwo():void {
			saveData("Two");	
			leaveMenu();
		}//End of function saveInTwo()
		
		public function saveInThree():void {
			saveData("Three");	
			leaveMenu();
		}//End of function saveInThree()
		
		public function saveInFour():void {
			saveData("Four");	
			leaveMenu();
		}//End of function saveInFour()
		
		public function saveInFive():void {
			saveData("Five");	
			leaveMenu();
		}//End of function saveInFive()
		
		public function loadFromOne():void {
			loadData("One");
			leaveMenu();
		}//End of function loadFromOne()
		
		public function loadFromTwo():void {
			loadData("Two");
			leaveMenu();
		}//End of function loadFromOne()
		
		public function loadFromThree():void {
			loadData("Three");
			leaveMenu();
		}//End of function loadFromOne()
		
		public function loadFromFour():void {
			loadData("Four");
			leaveMenu();
		}//End of function loadFromOne()
		
		public function loadFromFive():void {
			loadData("Five");
			leaveMenu();
		}//End of function loadFromOne()
		
	}//End of class MenuHandler

}//End of Package