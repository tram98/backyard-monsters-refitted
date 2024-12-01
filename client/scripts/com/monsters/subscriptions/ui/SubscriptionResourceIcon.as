package com.monsters.subscriptions.ui
{
   public class SubscriptionResourceIcon extends daveClubBar
   {
       
      
      public function SubscriptionResourceIcon(param1:Boolean)
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.update(param1);
         buttonMode = true;
         mouseChildren = false;
      }
      
      public function update(param1:Boolean) : void
      {
         if(param1)
         {
            gotoAndStop("on");
         }
         else
         {
            gotoAndStop("off");
         }
      }
   }
}
