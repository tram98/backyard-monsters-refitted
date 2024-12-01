package com.monsters.replayableEvents
{
   import com.monsters.replayableEvents.attackDefend.brukkargWar.BrukkargWarEvent;
   import com.monsters.replayableEvents.attacking.hellRaisers.HellRaisers;
   import com.monsters.replayableEvents.monsterInvasion.monsterBlitzkrieg.MonsterBlitzkrieg;
   import com.monsters.replayableEvents.yardCrawl.battletoads.Battletoads;
   
   public class ReplayableEventLibrary
   {
      
      public static const BATTLE_TOADS:Battletoads = new Battletoads();
      
      public static const MONSTER_BLITZKRIEG:MonsterBlitzkrieg = new MonsterBlitzkrieg();
      
      public static const HELL_RAISERS:HellRaisers = new HellRaisers();
      
      public static const BRUKKARG_EVENT:BrukkargWarEvent = new BrukkargWarEvent();
      
      public static const EVENTS:Vector.<ReplayableEvent> = Vector.<ReplayableEvent>([BATTLE_TOADS,MONSTER_BLITZKRIEG,BRUKKARG_EVENT,HELL_RAISERS]);
       
      
      public function ReplayableEventLibrary()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
      }
      
      public static function getEventByName(param1:String) : ReplayableEvent
      {
         var _loc3_:ReplayableEvent = null;
         var _loc2_:int = 0;
         while(_loc2_ < EVENTS.length)
         {
            _loc3_ = EVENTS[_loc2_];
            if(_loc3_.name == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public static function getEventByID(param1:uint) : ReplayableEvent
      {
         var _loc3_:ReplayableEvent = null;
         var _loc2_:int = 0;
         while(_loc2_ < EVENTS.length)
         {
            _loc3_ = EVENTS[_loc2_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
   }
}
