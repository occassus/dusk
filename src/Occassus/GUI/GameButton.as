package Occassus.GUI 
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	import flash.display.Graphics;
	import Occassus.Main

	public class GameButton extends ScreenElement 
	{
		
		public var identifier:String = new String();
		public var destination:String = new String();
		private var textBox:TextField = new TextField();
		private var textBoxFormat:TextFormat = new TextFormat();
		private var currentFormat:String = '<font face="Arial" color="#000000" size="14">'
		
		public function GameButton(x:int,y:int,width:int,height:int):void
		{
			this.relocate(x, y);
			this.appear();
			
			position.graphics.beginFill(0xF5DA81, 0.5);
			position.graphics.lineStyle(1, 0x000000, 1);
			position.graphics.drawRect(0, 0, width, height);
			position.graphics.endFill();
			position.buttonMode = true;
			
			textBox.mouseEnabled = false;
			textBox.width = width;
			textBox.height = height;
			textBoxFormat.align = TextFormatAlign.CENTER;
			textBox.defaultTextFormat = textBoxFormat;
			
			position.addChild(textBox);
			
			position.addEventListener(MouseEvent.CLICK, buttonClick);
			
		}//End of constructor
		
		public function rename(words:String):void
		{
			this.identifier = words;
			textBox.htmlText = currentFormat + words;
			
		}//End of function rename()
		
		public function reformat(format:String):void
		{
			this.currentFormat = format;
			
		}//End of function reformat()
		
		public function setDestination(words:String):void
		{
			this.destination = words;
			
		}//End of function setDestination()
		
		private function buttonClick(e:Event):void
		{
			Main.choices.buttonPress(identifier, destination);
			
		}//End of function buttonClick
		
		public function setup(words:String, pointer:String, format:String):void
		{
			reformat(format);
			rename(words);
			setDestination(pointer);
		}//End of function setup
		
	}//End of class GameButton

}//End of package