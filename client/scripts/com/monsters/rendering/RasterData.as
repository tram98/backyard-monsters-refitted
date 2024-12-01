package com.monsters.rendering
{
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.filters.BitmapFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace renderer_friend;
   
   public class RasterData
   {
      
      static const renderer_friend__s_rasterData:Vector.<RasterData> = new Vector.<RasterData>();
      
      static const renderer_friend__s_visibleData:Vector.<RasterData> = new Vector.<RasterData>();
      
      static const renderer_friend__s_unsortedData:Vector.<RasterData> = new Vector.<RasterData>();
      
      static const renderer_friend__s_debugData:Vector.<RasterData> = new Vector.<RasterData>();
      
      static var renderer_friend__s_needsSort:Boolean;
      
      private static var s_id:uint;
       
      
      const renderer_friend_id:uint = s_id++;
      
      var renderer_friend_data:IBitmapDrawable;
      
      var renderer_friend_pt:Point;
      
      var renderer_friend_depth:Number;
      
      var renderer_friend_rect:Rectangle;
      
      var renderer_friend_blendMode:String;
      
      var renderer_friend_filter:BitmapFilter;
      
      var renderer_friend_scaleX:int;
      
      var renderer_friend_scaleY:int;
      
      var renderer_friend_alpha:uint;
      
      var renderer_friend_visible:Boolean;
      
      var renderer_friend_unSorted:Boolean;
      
      var renderer_friend_cleared:Boolean;
      
      public function RasterData(param1:IBitmapDrawable, param2:Point, param3:Number, param4:String = null, param5:Boolean = false)
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.data = param1;
         this.renderer_friend_pt = param2;
         this.renderer_friend_depth = param3;
         this.renderer_friend_blendMode = param4;
         this.renderer_friend_scaleX = this.renderer_friend_scaleY = 100;
         this.renderer_friend_alpha = 4278190080;
         this.renderer_friend_visible = true;
         this.renderer_friend_unSorted = param5;
         renderer_friend__s_needsSort = this.renderer_friend_unSorted ? renderer_friend__s_needsSort : true;
         if(this.renderer_friend_unSorted)
         {
            renderer_friend__s_rasterData[renderer_friend__s_rasterData.length] = this;
            renderer_friend__s_unsortedData[renderer_friend__s_unsortedData.length] = this;
         }
         else
         {
            renderer_friend__s_rasterData[renderer_friend__s_rasterData.length] = this;
            renderer_friend__s_visibleData[renderer_friend__s_visibleData.length] = this;
         }
      }
      
      public static function get rasterData() : Vector.<RasterData>
      {
         return renderer_friend__s_rasterData;
      }
      
      public static function get visibleData() : Vector.<RasterData>
      {
         return renderer_friend__s_visibleData;
      }
      
      public static function get totalMemory() : uint
      {
         var _loc1_:uint = 0;
         var _loc2_:RasterData = null;
         var _loc3_:BitmapData = null;
         for each(_loc2_ in renderer_friend__s_rasterData)
         {
            _loc3_ = _loc2_.renderer_friend_data as BitmapData;
            if(_loc3_)
            {
               _loc1_ += _loc3_.getPixels(_loc3_.rect).length;
            }
         }
         return _loc1_;
      }
      
      renderer_friend static function showDebug() : void
      {
         var _loc1_:RasterData = null;
         var _loc2_:BitmapData = null;
         var _loc3_:Shape = null;
         for each(_loc1_ in renderer_friend__s_rasterData)
         {
            _loc2_ = _loc1_.renderer_friend_data as BitmapData;
            if(_loc2_)
            {
               _loc3_ = new Shape();
               _loc3_.graphics.lineStyle(1,16711680);
               _loc3_.graphics.beginFill(10027008,0.4);
               _loc3_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
               renderer_friend__s_debugData[renderer_friend__s_debugData.length] = new RasterData(_loc3_,_loc1_.renderer_friend_pt,_loc1_.renderer_friend_depth);
            }
         }
      }
      
      renderer_friend static function hideDebug() : void
      {
         var _loc1_:RasterData = null;
         for each(_loc1_ in renderer_friend__s_debugData)
         {
            _loc1_.clear(true);
         }
         renderer_friend__s_debugData.length = 0;
      }
      
      public static function clear(param1:Boolean = false) : void
      {
         var _loc2_:RasterData = null;
         for each(_loc2_ in renderer_friend__s_rasterData)
         {
            _loc2_.clear(param1);
         }
         renderer_friend__s_unsortedData.length = renderer_friend__s_visibleData.length = renderer_friend__s_rasterData.length = renderer_friend__s_debugData.length = 0;
      }
      
      public function get id() : uint
      {
         return this.renderer_friend_id;
      }
      
      public function get data() : IBitmapDrawable
      {
         return this.renderer_friend_data;
      }
      
      public function set data(param1:IBitmapDrawable) : void
      {
         this.renderer_friend_data = param1;
         switch(true)
         {
            case this.renderer_friend_data is BitmapData:
               this.renderer_friend_rect = (this.renderer_friend_data as BitmapData).rect;
               break;
            case this.renderer_friend_data is MovieClip:
               this.renderer_friend_rect = (this.renderer_friend_data as MovieClip).getRect(this.renderer_friend_data as MovieClip);
               break;
            default:
               this.renderer_friend_rect = new Rectangle();
         }
      }
      
      public function set pt(param1:Point) : void
      {
         this.renderer_friend_pt = param1;
      }
      
      public function get rect() : Rectangle
      {
         return this.renderer_friend_rect;
      }
      
      public function get depth() : Number
      {
         return this.renderer_friend_depth;
      }
      
      public function set depth(param1:Number) : void
      {
         if(this.renderer_friend_depth !== param1)
         {
            renderer_friend__s_needsSort = true;
            this.renderer_friend_depth = param1;
         }
      }
      
      public function set blendMode(param1:String) : void
      {
         this.renderer_friend_blendMode = param1;
      }
      
      public function set filter(param1:BitmapFilter) : void
      {
         this.renderer_friend_filter = param1;
      }
      
      public function set scaleX(param1:Number) : void
      {
         this.renderer_friend_scaleX = param1 * 100 >> 0;
      }
      
      public function set scaleY(param1:Number) : void
      {
         this.renderer_friend_scaleY = param1 * 100 >> 0;
      }
      
      public function set alpha(param1:Number) : void
      {
         this.renderer_friend_alpha = Math.ceil(param1 * 255) << 24;
      }
      
      public function get visible() : Boolean
      {
         return this.renderer_friend_visible;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(!this.renderer_friend_visible && param1)
         {
            if(this.renderer_friend_unSorted)
            {
               renderer_friend__s_unsortedData[renderer_friend__s_unsortedData.length] = this;
            }
            else
            {
               renderer_friend__s_visibleData[renderer_friend__s_visibleData.length] = this;
            }
            renderer_friend__s_needsSort = true;
         }
         else if(this.renderer_friend_visible && !param1)
         {
            if(this.renderer_friend_unSorted)
            {
               renderer_friend__s_unsortedData.splice(renderer_friend__s_unsortedData.indexOf(this),1);
            }
            else
            {
               renderer_friend__s_visibleData.splice(renderer_friend__s_visibleData.indexOf(this),1);
            }
            renderer_friend__s_needsSort = true;
         }
         this.renderer_friend_visible = param1;
      }
      
      public function clone() : RasterData
      {
         return new RasterData(this.renderer_friend_data,this.renderer_friend_pt,this.renderer_friend_depth);
      }
      
      public function clear(param1:Boolean = false) : void
      {
         if(this.renderer_friend_cleared)
         {
            return;
         }
         renderer_friend__s_rasterData.splice(renderer_friend__s_rasterData.indexOf(this),1);
         if(this.renderer_friend_visible)
         {
            if(this.renderer_friend_unSorted)
            {
               renderer_friend__s_unsortedData.splice(renderer_friend__s_unsortedData.indexOf(this),1);
            }
            else
            {
               renderer_friend__s_visibleData.splice(renderer_friend__s_visibleData.indexOf(this),1);
            }
         }
         if(param1 && this.renderer_friend_data is BitmapData)
         {
            (this.renderer_friend_data as BitmapData).dispose();
         }
         this.renderer_friend_data = null;
         this.renderer_friend_pt = null;
         this.renderer_friend_rect = null;
         this.renderer_friend_blendMode = null;
         this.renderer_friend_cleared = true;
      }
   }
}
