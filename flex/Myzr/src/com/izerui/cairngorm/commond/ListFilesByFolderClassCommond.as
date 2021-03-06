package com.izerui.cairngorm.commond
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.izerui.cairngorm.business.ListFilesByFolderClassDelegate;
	import com.izerui.cairngorm.event.ListFilesByFolderClassEvent;
	import com.izerui.components.loading.LoaderManager;
	
	import mx.controls.Alert;
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;
	
	public class ListFilesByFolderClassCommond implements IResponder, ICommand
	{
		
		private var delegate:ListFilesByFolderClassDelegate;
		
		private var responseFun:Function;
		
		public function ListFilesByFolderClassCommond()
		{
			delegate = new ListFilesByFolderClassDelegate(this);
		}
		
		public function result(data:Object):void
		{
			if(responseFun){
				responseFun.call(null,data.result);
			}
		}
		
		public function fault(info:Object):void
		{
			Alert.show(ResourceManager.getInstance().getString("jhaij","listFilesByFolderErrorTootip"),ResourceManager.getInstance().getString("jhaij","error"));
			LoaderManager.hideLoading();
		}
		
		public function execute(event:CairngormEvent):void
		{
			var myEvent:ListFilesByFolderClassEvent = ListFilesByFolderClassEvent(event);
			responseFun = myEvent.responseFun;
			delegate.listFilesByFolder(myEvent.folderPath);
		}
	}
}