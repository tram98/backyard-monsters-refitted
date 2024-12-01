package gs.plugins
{
   import flash.display.*;
   import gs.*;
   
   public class ShortRotationPlugin extends TweenPlugin
   {
      
      public static const VERSION:Number = 1;
      
      public static const API:Number = 1;
       
      
      public function ShortRotationPlugin()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.propName = "shortRotation";
         this.overwriteProps = [];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         throw new Error("Not Implemented");

         return true;
      }
      
      public function initRotation(param1:Object, param2:String, param3:Number, param4:Number) : void
      {
         var _loc5_:Number = (param4 - param3) % 360;
         if(_loc5_ != _loc5_ % 180)
         {
            _loc5_ = _loc5_ < 0 ? _loc5_ + 360 : _loc5_ - 360;
         }
         addTween(param1,param2,param3,param3 + _loc5_,param2);
         this.overwriteProps[this.overwriteProps.length] = param2;
      }
   }
}
