package utils.exposed
{
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getDefinitionByName;
   import utils.debug.Warning;
   
   public class ExposedStructure
   {
      
      private static const REFERENCE_TYPE_TEMPLATE_NAME:String = "utils.exposed::ExposedReference.<";
      
      private static const VECTOR_TYPE_TEMPLATE_NAME:String = "__AS3__.vec::Vector.<";
       
      
      private var m_Definition:ExposedDefinition;
      
      public function ExposedStructure()
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.m_Definition = ExposedDefinitionManager.instance.FindOrCacheExposedDefinition(this);
      }
      
      protected function _Init() : void
      {
      }
      
      protected function _Destroy() : void
      {
      }
      
      internal function Init() : void
      {
throw new Exception("Not Implemented");
      }
      
      public function Destroy() : void
      {
         
throw new Exception("Not Implemented");
        }
      
      private function DestroyExposedStructureProperty(param1:ExposedStructure) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 is ExposedObject && ExposedObjectManager.instance.FindReferenceableObject((param1 as ExposedObject).id) != null)
         {
            return;
         }
         param1.Destroy();
      }
      
      public function SaveInitialStateToXML() : XML
      {
         return this.SaveState(ExposedDefinition.EXPOSED_FOR_EDITOR);
      }
      
      public function SavePersistedStateToXML() : XML
      {
         return this.SaveState(ExposedDefinition.EXPOSED_FOR_SAVE);
      }
      
      internal function LoadState(param1:XML, param2:String) : void
      {
throw new Exception("Not Implemented");  }
      
      internal function SaveState(param1:String) : XML
      {
         

throw new Exception("Not Implemented");
       }
   }
}
