package com.monsters.maproom.views
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="com.monsters.maproom.views.MapBasePopup_CLIP")]
   public dynamic class MapBasePopup_CLIP extends MovieClip
   {
       
      
      public var title_txt:TextField;
      
      public var attackBtn:Button_CLIP;
      
      public var helpBtn:Button_CLIP;
      
      public var bg_mc:MovieClip;
      
      public var msgBtn:Button_CLIP;
      
      public var truceBtn:Button_CLIP;
      
      public function MapBasePopup_CLIP()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
      }
   }
}
