package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="old_maproom")]
   public dynamic class old_maproom extends MovieClip
   {
       
      
      public var mcHolder:MovieClip;
      
      public var mvBtn:Button_CLIP;
      
      public var lvBtn:Button_CLIP;
      
      public var background_mc:frame_CLIP;
      
      public function old_maproom()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}
