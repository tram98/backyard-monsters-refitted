package com.monsters.maproom.views
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="com.monsters.maproom.views.WMListViewItem_CLIP")]
   public dynamic class WMListViewItem_CLIP extends MovieClip
   {
       
      
      public var icon_mc:MovieClip;
      
      public var name_txt:TextField;
      
      public var placeholder:MovieClip;
      
      public var attackBtn:Button_CLIP;
      
      public var status_txt:TextField;
      
      public var dot:MovieClip;
      
      public var attacks_txt:TextField;
      
      public var helpBtn:Button_CLIP;
      
      public var extraStatus_txt:TextField;
      
      public function WMListViewItem_CLIP()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
      }
   }
}
