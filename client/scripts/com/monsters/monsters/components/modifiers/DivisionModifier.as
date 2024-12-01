package com.monsters.monsters.components.modifiers
{
   import com.monsters.interfaces.IPropertyModifier;
   
   public class DivisionModifier implements IPropertyModifier
   {
       
      
      public var divisor:Number;
      
      public function DivisionModifier(param1:Number)
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.divisor = param1;
      }
      
      public function modify(param1:Number) : Number
      {
         return param1 / this.divisor;
      }
   }
}
