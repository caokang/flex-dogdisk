package com.izerui.cairngorm.event
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.izerui.cairngorm.controller.ZRController;
	
	public class ListFilesByFolderClassEvent extends CairngormEvent
	{
		public var folderPath:String;

		public var responseFun:Function;
		
		public function ListFilesByFolderClassEvent(folderPath:String,responseFun:Function)
		{
			super(ZRController.LISTFILES_BY_FOLDER);
			this.folderPath = folderPath;

			this.responseFun = responseFun;
		}
	}
}