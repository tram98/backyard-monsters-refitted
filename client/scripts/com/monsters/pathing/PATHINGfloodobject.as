package com.monsters.pathing
{
   import flash.geom.Point;
   
   public class PATHINGfloodobject
   {
       
      
      public var pending:int = 0;
      
      public var flood:Object;
      
      public var start:Object;
      
      public var edge:Object;
      
      public var minDepth:int = 9999999;
      
      public var startpoints:Object;
      
      public var edgeLength:int = 0;
      
      public var endPoint:Point;
      
      public var ignoreWalls:Boolean = false;
      
      public function PATHINGfloodobject()
      {
         this.startpoints = {};
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
      }
   }
}
