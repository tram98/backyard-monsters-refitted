package gs.plugins
{
   import flash.display.*;
   import gs.*;
   
   public class RoundPropsPlugin extends TweenPlugin
   {
      
      public static const VERSION:Number = 1;
      
      public static const API:Number = 1;
       
      
      public function RoundPropsPlugin()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.propName = "roundProps";
         this.overwriteProps = [];
         this.round = true;
      }
      
      public function add(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         addTween(param1,param2,param3,param3 + param4,param2);
         this.overwriteProps[this.overwriteProps.length] = param2;
      }
   }
}
