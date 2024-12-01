package com.monsters.monsters.components.modifiers
{
   import com.monsters.interfaces.IPropertyModifier;
   
   public class MultiplicationPropertyModifier implements IPropertyModifier
   {
       
      
      public var multiple:Number;
      
      public function MultiplicationPropertyModifier(param1:Number)
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.multiple = param1;
      }
      
      public function modify(param1:Number) : Number
      {
         return param1 * this.multiple;
      }
   }
}
