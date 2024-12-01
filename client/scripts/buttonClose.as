package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class buttonClose extends MovieClip
   {
       
      
      public function buttonClose()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.buttonMode = true;
         this.addEventListener(MouseEvent.MOUSE_OVER,this.Over);
         this.addEventListener(MouseEvent.MOUSE_OUT,this.Out);
         gotoAndStop(1);
      }
      
      private function Over(param1:MouseEvent) : *
      {
         this.gotoAndStop(2);
      }
      
      private function Out(param1:MouseEvent) : *
      {
         this.gotoAndStop(1);
      }
   }
}
