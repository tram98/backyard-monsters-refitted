package
{
   import flash.geom.Rectangle;
   
   public class BUILDING117 extends BHEAVYTRAP
   {
       
      
      public function BUILDING117()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         _type = 117;
         _footprint = [new Rectangle(0,0,20,20)];
         SetProps();
      }
      
      override public function Constructed() : void
      {
         ++ACHIEVEMENTS._stats["heavytraps"];
         ACHIEVEMENTS.Check();
         super.Constructed();
      }
   }
}
