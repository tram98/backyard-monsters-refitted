package com.monsters.rendering
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   use namespace renderer_friend;
   
   public class Renderer
   {
      
      static var renderer_friend_debug:Boolean;
      
      private static var _debugShape:Shape;
       
      
      var renderer_friend_canvas:BitmapData;
      
      var renderer_friend_viewRect:Rectangle;
      
      private const _matrix:Matrix = new Matrix();
      
      private const _pt:Point = new Point();
      
      private const _bm:Bitmap = new Bitmap();
      
      private var _curCopyIndex:uint;
      
      private var _curDrawIndex:uint;
      
      public function Renderer(param1:BitmapData, param2:Rectangle)
      {
         var __conversionComment:String = "EMPTY SUPER CALL REMOVED";
         this.renderer_friend_canvas = param1;
         this.renderer_friend_viewRect = param2;
      }
      
      public static function get debug() : Boolean
      {
         return renderer_friend_debug;
      }
      
      public static function set debug(param1:Boolean) : void
      {
         renderer_friend_debug = param1;
         if(renderer_friend_debug)
         {
            _debugShape = _debugShape || new Shape();
            RasterData.renderer_friend__showDebug();
         }
         else
         {
            _debugShape = null;
            RasterData.renderer_friend__hideDebug();
         }
      }
      
      public function set canvas(param1:BitmapData) : void
      {
         this.renderer_friend_canvas = param1;
      }
      
      public function render() : void
      {
         var _loc1_:Vector.<RasterData> = RasterData.renderer_friend__s_visibleData;
         this._curCopyIndex = this._curDrawIndex = 0;
         if(RasterData.renderer_friend__s_needsSort)
         {
            _loc1_.sort(this.sortRasterData);
            RasterData.renderer_friend__s_needsSort = false;
         }
         this.renderer_friend_canvas.lock();
         this.rasterize(RasterData.renderer_friend__s_unsortedData.concat(_loc1_));
         this.renderer_friend_canvas.unlock();
      }
      
      private function cull(param1:Vector.<RasterData>) : void
      {
         var _loc3_:RasterData = null;
         var _loc4_:Rectangle = null;
         var _loc2_:Vector.<RasterData> = param1;
         for each(_loc3_ in _loc2_)
         {
            (_loc4_ = _loc3_.renderer_friend_rect).x = _loc3_.renderer_friend_pt.x;
            _loc4_.y = _loc3_.renderer_friend_pt.y;
            if(this.renderer_friend_viewRect.intersects(_loc4_))
            {
               _loc2_[_loc2_.length] = _loc3_;
            }
         }
      }
      
      private function sortRasterData(param1:RasterData, param2:RasterData) : Number
      {
         return param1.renderer_friend_depth - param2.renderer_friend_depth;
      }
      
      private function rasterize(param1:Vector.<RasterData>) : void
      {
         var _loc2_:Vector.<RasterData> = null;
         var _loc4_:RasterData = null;
         var _loc5_:BitmapData = null;
         var _loc6_:BitmapData = null;
         var _loc7_:int = 0;
         _loc2_ = param1;
         var _loc3_:int = int(_loc2_.length);
         while(_loc7_ < _loc3_)
         {
            _loc5_ = (_loc4_ = _loc2_[_loc7_]).renderer_friend_data as BitmapData;
            this._pt.x = _loc4_.renderer_friend_pt.x;
            this._pt.y = _loc4_.renderer_friend_pt.y;
            if(_loc5_ && !_loc4_.renderer_friend_blendMode && !_loc4_.renderer_friend_filter && (_loc4_.renderer_friend_scaleX & _loc4_.renderer_friend_scaleY) === 100)
            {
               if(_loc4_.renderer_friend_alpha !== 4278190080)
               {
                  _loc6_ = new BitmapData(_loc5_.width,_loc5_.height,true,_loc4_.renderer_friend_alpha);
               }
               this.renderer_friend_canvas.copyPixels(_loc5_,_loc5_.rect,this._pt,_loc6_);
               if(_loc6_)
               {
                  _loc6_.dispose();
                  _loc6_ = null;
               }
            }
            else
            {
               this._matrix.createBox(_loc4_.renderer_friend_scaleX * 0.01,_loc4_.renderer_friend_scaleY * 0.01,0,this._pt.x,this._pt.y);
               if(Boolean(_loc4_.renderer_friend_filter) && Boolean(_loc5_))
               {
                  this._bm.bitmapData = _loc5_;
                  this._bm.filters = [_loc4_.renderer_friend_filter];
                  this.renderer_friend_canvas.draw(this._bm,this._matrix,null,_loc4_.renderer_friend_blendMode);
               }
               else
               {
                  this.renderer_friend_canvas.draw(_loc4_.renderer_friend_data,this._matrix,null,_loc4_.renderer_friend_blendMode);
               }
            }
            _loc7_++;
         }
      }
   }
}
