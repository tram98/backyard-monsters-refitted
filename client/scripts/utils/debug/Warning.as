package utils.debug
{
   import flash.utils.getQualifiedClassName;
   
   public class Warning
   {
       
      
      public function Warning()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
      }
      
      public static function Show(param1:String, param2:Class) : void
      {
         trace("Class: " + getQualifiedClassName(param2) + "\nWarning: " + param1);
      }
   }
}
