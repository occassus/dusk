package Occassus.GUI 
{
	import flash.text.*;
	import flash.text.TextFormat;

	public class MainText extends ScreenElement 
	{
		
		public var currentText:String = new String();
		private var currentFormat:String = '<br><font face="Arial" color="#000000" size="14">';
		private var textBox:TextField = new TextField();
		private var textBoxFormat:TextFormat = new TextFormat();
		
		public function MainText(x:int,y:int,width:int,height:int):void 
		{
			this.relocate(x, y);
			this.appear();
			
			textBoxFormat.align = TextFormatAlign.JUSTIFY;
			textBox.width = width;
			textBox.height = height;
			textBox.wordWrap = true;
			textBox.border = true;
			textBox.multiline = true;
			textBoxFormat.leftMargin = 10;
			textBoxFormat.rightMargin = 10;
			textBox.defaultTextFormat = textBoxFormat;
			
			position.graphics.beginFill(0xF5DA81, 0.9);
			position.graphics.lineStyle(1, 0x000000, 1);
			position.graphics.drawRect(0, 0, width, height);
			position.graphics.endFill();
			
			position.addChild(textBox);
			
		}//End of Constructor
		
		public function output(words:String, replace:Boolean):void
		{
			if (replace) {
				currentText = words;
			}
			else {
				currentText = currentText + words;
			}
			
			textBox.htmlText = currentFormat + currentText;
		}//End of function output()
		
	}//End of class MainText

}//End of package