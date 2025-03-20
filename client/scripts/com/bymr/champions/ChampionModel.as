package com.bymr.champions
{
   import com.cc.utils.SecNum;
   import com.monsters.monsters.champions.ChampionBase;

   public class ChampionModel
   {
      /**
       * name of the champion (unused)
       */
      private var _nm:String;
      /**
       * Champion type.
       */
      private var _t:uint;

      /**
       * Feed time
       */
      private var _ft:SecNum = new SecNum(0);

      /**
       * Feed count
       */
      private var _fd:SecNum = new SecNum(0);

      /**
       * level
       */
      private var _l:SecNum = new SecNum(0);

      /**
       * health
       */
      private var _hp:SecNum = new SecNum(0);

      /**
       * feed bonus
       */
      private var _fb:SecNum = new SecNum(0);

      /**
       * power level
       */
      private var _pl:SecNum = new SecNum(0);

      /**
       * status
       */
      private var _status: uint;

      /**
       * log of champion status history
       */
      private var _log: String = "";

      public function ChampionModel()
      {
      }

      public static function fromObject(championData: Object) : ChampionModel
      {
         var champion: ChampionModel = new ChampionModel();
         champion.t = championData.t;
         champion.nm = championData.nm || "";
         champion.l = championData.l || 0;
         champion.fd = championData.fd || 0;
         champion.ft = championData.ft || 0;
         champion.hp = championData.hp || 0;
         champion.fb = championData.fb || 0;
         champion.pl = championData.pl || 0;
         champion.status = championData.status || ChampionBase.k_CHAMPION_STATUS_NORMAL;
         champion.log = championData.log || champion.status;
         return champion;
      }

      public function toObject(): Object
      {
         return {
            t: this.t,
            nm: this.nm,
            l: this.l,
            fd: this.fd,
            ft: this.ft,
            hp: this.hp,
            fb: this.fb,
            pl: this.pl,
            status: this.status,
            log: this.log
         };
      }

      public function get l():Number
      {
         return _l.Get();
      }

      public function set l(value:Number):void
      {
         _l.Set(value);
      }

      public function get fd():Number
      {
         return _fd.Get();
      }

      public function set fd(value:Number):void
      {
         _fd.Set(value);
      }

      public function get ft():Number
      {
         return _ft.Get();
      }

      public function set ft(value:Number):void
      {
         if (value < 1700000000) {
            throw new Error("Feed time should be greater than or equal to 1700000000");
         }
         _ft.Set(value);
      }

      public function get nm():String
      {
         return _nm;
      }

      public function set nm(value:String):void
      {
         _nm = value;
      }

      public function get t():uint
      {
         return _t;
      }

      public function set t(value:uint):void
      {
         _t = value;
      }

      public function get hp():Number
      {
         return _hp.Get();
      }

      public function set hp(value:Number):void
      {
         _hp.Set(value);
      }

      public function get fb():Number
      {
         return _fb.Get();
      }

      public function set fb(value:Number):void
      {
         _fb.Set(value);
      }

      public function get pl():Number
      {
         return _pl.Get();
      }

      public function set pl(value:Number):void
      {
         _pl.Set(value);
      }

      public function get status():uint
      {
         return _status;
      }

      public function set status(value:uint):void
      {
         _status = value;
         appendLog(value);
      }

      public function get log():String
      {
         return _log;
      }

      public function set log(value:String):void
      {
         _log = value.substr(0, 255);
      }

      public function appendLog(newStatus: uint): void
      {
         log += "," + newStatus;
      }
   }
}
