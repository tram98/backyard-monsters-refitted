package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="DEFENSEEVENTPOPUP_CLIP")]
   public dynamic class DEFENSEEVENTPOPUP_CLIP extends MovieClip
   {
       
      
      public var mcBanner:MovieClip;
      
      public var mcText:TextField;
      
      public var rsvpBtn:Button_CLIP;
      
      public var mcImage:MovieClip;
      
      public var mcFrame:frame_CLIP;
      
      public function DEFENSEEVENTPOPUP_CLIP()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         addFrameScript(1,this.frame2);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}
