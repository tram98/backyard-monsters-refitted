package
{
   [Embed(source="/_assets/assets.swf", symbol="buttonZoom_CLIP")]
   public dynamic class buttonZoom_CLIP extends buttonZoom
   {
       
      
      public function buttonZoom_CLIP()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         addFrameScript(0,this.frame1,3,this.frame4);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame4() : *
      {
         stop();
      }
   }
}
