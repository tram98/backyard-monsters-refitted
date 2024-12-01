package gs.plugins
{
   import flash.display.*;
   import flash.geom.Point;
   import gs.*;
   import gs.utils.tween.TweenInfo;
   
   public class TransformAroundPointPlugin extends TweenPlugin
   {
      
      public static const VERSION:Number = 1.02;
      
      public static const API:Number = 1;
       
      
      protected var _target:DisplayObject;
      
      protected var _local:Point;
      
      protected var _point:Point;
      
      protected var _shortRotation:ShortRotationPlugin;
      
      public function TransformAroundPointPlugin()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.propName = "transformAroundPoint";
         this.overwriteProps = [];
      }
      
      override public function onInitTween(param1:Object, param2:*, param3:TweenLite) : Boolean
      {
         throw new Exception("Not Implemented");
         return false;
      }
      
      override public function killProps(param1:Object) : void
      {
         if(this._shortRotation != null)
         {
            this._shortRotation.killProps(param1);
            if(this._shortRotation.overwriteProps.length == 0)
            {
               param1.shortRotation = true;
            }
         }
         super.killProps(param1);
      }
      
      override public function set changeFactor(param1:Number) : void
      {
         var _loc2_:Point = null;
         var _loc3_:int = 0;
         var _loc4_:TweenInfo = null;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         if(this.round)
         {
            _loc3_ = int(_tweens.length - 1);
            while(_loc3_ > -1)
            {
               _loc6_ = (_loc5_ = (_loc4_ = _tweens[_loc3_]).start + _loc4_.change * param1) < 0 ? -1 : 1;
               _loc4_.target[_loc4_.property] = _loc5_ % 1 * _loc6_ > 0.5 ? int(_loc5_) + _loc6_ : int(_loc5_);
               _loc3_--;
            }
            _loc2_ = this._target.parent.globalToLocal(this._target.localToGlobal(this._local));
            _loc7_ = this._target.x + this._point.x - _loc2_.x;
            _loc8_ = this._target.y + this._point.y - _loc2_.y;
            _loc9_ = _loc7_ < 0 ? -1 : 1;
            _loc10_ = _loc8_ < 0 ? -1 : 1;
            this._target.x = _loc7_ % 1 * _loc9_ > 0.5 ? int(_loc7_) + _loc9_ : int(_loc7_);
            this._target.y = _loc8_ % 1 * _loc10_ > 0.5 ? int(_loc8_) + _loc10_ : int(_loc8_);
         }
         else
         {
            _loc3_ = int(_tweens.length - 1);
            while(_loc3_ > -1)
            {
               (_loc4_ = _tweens[_loc3_]).target[_loc4_.property] = _loc4_.start + _loc4_.change * param1;
               _loc3_--;
            }
            _loc2_ = this._target.parent.globalToLocal(this._target.localToGlobal(this._local));
            this._target.x += this._point.x - _loc2_.x;
            this._target.y += this._point.y - _loc2_.y;
         }
         _changeFactor = param1;
      }
   }
}
