package utils.exposed
{
   import utils.debug.Warning;
   
   public class ExposedObject extends ExposedStructure
   {
       
      
      private var m_Id:String = "";
      
      public function ExposedObject()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
      }
      
      internal function get id() : String
      {
         return this.m_Id;
      }
      
      internal function set id(param1:String) : void
      {
         this.m_Id = param1;
      }
      
      override internal function LoadState(param1:XML, param2:String) : void
      {
         var _loc3_:String = param1.@id;
         if(this.m_Id != _loc3_)
         {
            Warning.Show("Trying to load object with id \'" + this.m_Id + "\' from state with id \'" + _loc3_ + "\'",ExposedObject);
            return;
         }
         super.LoadState(param1,param2);
      }
      
      override internal function SaveState(param1:String) : XML
      {
         throw new Error("Not implemented");
         // var _loc2_:XML = super.SaveState(param1);
         // _loc2_.setName("object");
         // _loc2_.@id = this.m_Id;
         // return _loc2_;
         return null;
      }
   }
}
