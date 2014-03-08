package Occassus
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Occassus.GUI.BackgroundClouds;
	import Occassus.GUI.ButtonHolder;
	import Occassus.GUI.ScreenHandler;
	

	public class Main extends Sprite 
	{
		
		public static var screens:ScreenHandler = new ScreenHandler();
		public static var choices:ChoiceHandler = new ChoiceHandler();
		public static var menus:MenuHandler = new MenuHandler();
		
		public static var story:Adventure = new Adventure();
		
		public static var storedButtonValues:ButtonHolder = new ButtonHolder();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			this.addChild(screens);
			
			
		}
		
	}
	
}