package com.monsters.display
{
   import flash.display.Loader;
   
   public class Loadable
   {
       
      
      public var callbacks:Array;
      
      public var tries:uint;
      
      public var loadState:uint;
      
      public var loader:Loader;
      
      public var key:String;
      
      public var tryLimit:uint = 5;
      
      public var shouldPrepend:Boolean = true;
      
      public var priority:int;
      
      public function Loadable()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.callbacks = [].concat();
         this.tries = 0;
         this.loader = new Loader();
      }
      
      public function toString() : String
      {
         return "[object Loadable key:" + this.key + ", loadState:" + this.loadState + "]";
      }
   }
}
