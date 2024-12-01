package gs.plugins
{
   import gs.TweenLite;
   
   public class BezierThroughPlugin extends BezierPlugin
   {
      
      public static const VERSION:Number = 1;
      
      public static const API:Number = 1;
       
      
      public function BezierThroughPlugin()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.propName = "bezierThrough";
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         if(!(param2 is Array))
         {
            return false;
         }
         init(param3,param2 as Array,true);
         return true;
      }
   }
}
