package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   [Embed(source="/_assets/assets.swf", symbol="WMIEXTENSIONPOPUP_CLIP")]
   public dynamic class WMIEXTENSIONPOPUP_CLIP extends MovieClip
   {
       
      
      public var mcBanner:MovieClip;
      
      public var mcText:TextField;
      
      public var closeBtn:Button_CLIP;
      
      public var mcImage:MovieClip;
      
      public var mcFrame:frame_CLIP;
      
      public function WMIEXTENSIONPOPUP_CLIP()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         addFrameScript(1,this.frame2);
      }
      
      internal function frame2() : *
      {
         this.closeBtn.stop();
      }
   }
}
