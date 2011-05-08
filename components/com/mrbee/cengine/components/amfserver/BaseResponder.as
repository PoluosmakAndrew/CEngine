package com.mrbee.cengine.components.amfserver 
{
	import flash.net.Responder;
	
	/**
	 * ...
	 * @author Poluosmak Andrew
	 */
	
	public class BaseResponder extends Responder
	{
		/** On Result Callback Handler **/
		protected var _onResult:Function = null;
		
		/** On Error Callback Handler **/
		protected var _onStatus:Function = null;
		
		public function BaseResponder(onResultCallback:Function = null, onStatusCallback:Function = null) 
		{
			if (onResultCallback != null)
				_onResult = onResultCallback;
				
			if (onStatusCallback != null)
				_onStatus = onStatusCallback;
				
			super(onResult, onStatus);
		}
		
		/**
		 * Base On Reult Callback Handler
		 * @param	object
		 */
		protected function onResult(object:Object):void
		{			
			setProperties(object);
			
			if (_onResult != null)
				_onResult(this);
				
			destructCallback();
		}
		
		/**
		 * Base On Error Callback Handler
		 * @param	object
		 */
		protected function onStatus(object:Object):void
		{
			setProperties(object);
			
			if (_onStatus != null)
				_onStatus(object);
				
			destructCallback();
		}
		
		/**
		 * Set Responce properties
		 * @param	object
		 */
		private function setProperties(object:Object):void
		{
			var key:String;
			
			for (key in object) {
				this[key] = object[key];
			}
		}
		
		/**
		 * Чистим ссылки на кэлбеки
		 */
		protected function destructCallback():void
		{
			_onResult = null;
			_onStatus = null;
		}
		
	}

}