package
{
   import com.monsters.interfaces.IAttackable;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class BUILDING20 extends BTOWER
   {
      
      public static const TYPE:uint = 20;
       
      
      public var _animBitmap:BitmapData;
      
      public function BUILDING20()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         _frameNumber = 0;
         _type = 20;
         _top = -4;
         _footprint = [new Rectangle(0,0,70,70)];
         _gridCost = [[new Rectangle(0,0,70,70),10],[new Rectangle(10,10,50,50),200]];
         SetProps();
         Props();
      }
      
      override public function Fire(param1:IAttackable) : void
      {
         super.Fire(param1);
         SOUNDS.Play("splash1",!isJard ? 0.8 : 0.4);
         var _loc2_:Number = 0.5 + 0.5 / maxHealth * health;
         var _loc3_:Number = 1;
         if(Boolean(GLOBAL._towerOverdrive) && GLOBAL._towerOverdrive.Get() >= GLOBAL.Timestamp())
         {
            _loc3_ = 1.25;
         }
         if(isJard)
         {
            _jarHealth.Add(-int(damage * 6 * _loc2_ * _loc3_));
            ATTACK.Damage(_mc.x,_mc.y + _top,damage * 6 * _loc2_ * _loc3_);
            if(_jarHealth.Get() <= 0)
            {
               KillJar();
            }
         }
         else if(_targetVacuum)
         {
            PROJECTILES.Spawn(new Point(_mc.x,_mc.y + _top),GLOBAL.townHall._position.add(new Point(0,-GLOBAL.townHall._mc.height)),null,_speed,int(damage * _loc3_ * 3 * _loc2_),false,0);
         }
         else
         {
            PROJECTILES.Spawn(new Point(_mc.x,_mc.y + _top),null,param1,_speed,int(damage * _loc2_ * _loc3_),false,_splash,Targeting.getOldStyleTargets(-1));
         }
      }
   }
}
