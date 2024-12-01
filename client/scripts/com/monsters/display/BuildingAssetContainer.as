package com.monsters.display
{
   import flash.display.MovieClip;
   
   public class BuildingAssetContainer extends MovieClip
   {
       
      
      public function BuildingAssetContainer()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.Clear();
      }
      
      public function Clear() : void
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
   }
}
