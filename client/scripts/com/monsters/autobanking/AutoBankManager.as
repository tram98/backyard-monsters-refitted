package com.monsters.autobanking
{
   import com.cc.utils.SecNum;
   import com.monsters.baseBuffs.BaseBuffHandler;
   import com.monsters.baseBuffs.buffs.AutoBankBaseBuff;
   import com.monsters.configs.BYMConfig;
   import com.monsters.managers.InstanceManager;
   import com.monsters.maproom_manager.MapRoomManager;
   
   public class AutoBankManager
   {
      
      private static const k_OPKEY_TIME:String = "t";
      
      private static const k_OPKEY_BASE:String = "b";
      
      private static const k_OPKEY_TWIGS:String = "r" + BRESOURCE.RESOURCE_TWIGS;
      
      private static const k_OPKEY_PEBBLES:String = "r" + BRESOURCE.RESOURCE_PEBBLES;
      
      private static const k_OPKEY_PUTTY:String = "r" + BRESOURCE.RESOURCE_PUTTY;
      
      private static const k_OPKEY_GOO:String = "r" + BRESOURCE.RESOURCE_GOO;
      
      private static const k_MAX_RESOURCES:uint = 5;
      
      private static var s_logCounter:int = 10;
      
      
      public function AutoBankManager(instanceEnforcer:InstanceEnforcer)
      {
         super();
         if (!instanceEnforcer)
         {
            throw new Error("AutoBankManager is a static class not to be instantiated");
         }
      }
      
      public static function get lastMapRoom3Time():int
      {
         var latestTime:int = 0;
         var cellTime:String = null;
         for (cellTime in BASE.resourceCells)
         {
            if (int(cellTime) > latestTime)
            {
               latestTime = int(cellTime);
            }
         }
         return latestTime;
      }
      
      public static function updateSaveData():Object
      {
         var localGIP:Object = {};
         setLocalGIP(localGIP);
         if (MapRoomManager.instance.isInMapRoom2)
         {
            return updateBuildingResources(localGIP);
         }
         if (MapRoomManager.instance.isInMapRoom3)
         {
            return BASE.resourceCells;
         }
         return null;
      }
      
      private static const TWO_DAYS:int = 3600 * 24 * 2;
      
      public static function updateLoadData(rawGIP:Object, GIP:Object, processedGIP:Object, lastProcessed:int, lastProcessedGIP:Number):Number
      {
         var key:String = null;
         var entry:Object = null;
         var cellHeight:int = 0;
         var resEntry:Object = null;
         s_logCounter = 10;
         
         if (!rawGIP)
         {
            return lastProcessedGIP;
         }
         
         var sHomeBaseID:String = k_OPKEY_BASE + GLOBAL._homeBaseID;
         if (rawGIP[sHomeBaseID])
         {
            delete rawGIP[sHomeBaseID];
         }
         
         if (Boolean(rawGIP[k_OPKEY_TIME]) && (GLOBAL.mode !== GLOBAL.e_BASE_MODE.ATTACK || BYMConfig.instance.AUTOBANK_FIX))
         {
            lastProcessedGIP = Number(rawGIP[k_OPKEY_TIME]);
            delete rawGIP[k_OPKEY_TIME];
         } else
         {
            lastProcessedGIP = lastProcessed;
         }
         
         if (GLOBAL.Timestamp() - lastProcessedGIP > TWO_DAYS)
         {
            lastProcessedGIP = GLOBAL.Timestamp() - TWO_DAYS;
         }
         
         if (GLOBAL.mode != GLOBAL.e_BASE_MODE.BUILD && GLOBAL.mode != GLOBAL.e_BASE_MODE.ATTACK)
         {
            return lastProcessedGIP;
         }
         
         for (key in rawGIP)
         {
            entry = rawGIP[key];
            if (key == k_OPKEY_TIME)
            {
               lastProcessedGIP = Number(rawGIP[key]);
               continue;
            }
            
            if (entry is String)
            {
               break;
            }
            
            if (entry[k_OPKEY_TWIGS] != undefined)
            {
               processedGIP[key] = {
                  "r1": new SecNum(entry[k_OPKEY_TWIGS]),
                  "r2": new SecNum(entry[k_OPKEY_PEBBLES]),
                  "r3": new SecNum(entry[k_OPKEY_PUTTY]),
                  "r4": new SecNum(entry[k_OPKEY_GOO])
               };
            } else
            {
               if (cellHeight = int(rawGIP[key]["height"]))
               {
                  delete entry["height"];
               } else
               {
                  cellHeight = 100;
               }
               processedGIP[key] = {
                  "r1": new SecNum(0),
                  "r2": new SecNum(0),
                  "r3": new SecNum(0),
                  "r4": new SecNum(0)
               };
               for each(resEntry in entry)
               {
                  if (!(resEntry.t >= 1 && resEntry.t < k_MAX_RESOURCES))
                  {
                     continue;
                  }
                  
                  var producedResources:int = 0;
                  if (resEntry.l)
                  {
                     producedResources = int(OUTPOST_YARD_PROPS._outpostProps[resEntry.t - 1].produce[resEntry.l - 1]);
                  } else
                  {
                     producedResources = int(OUTPOST_YARD_PROPS._outpostProps[resEntry.t - 1].produce[0]);
                  }
                  producedResources = Math.max(int(producedResources * GLOBAL._averageAltitude.Get() / cellHeight), 1);
                  processedGIP[key]["r" + resEntry.t].Add(producedResources);
               }
               rawGIP[key] = {
                  "r1": processedGIP[key].r1.Get(),
                  "r2": processedGIP[key].r2.Get(),
                  "r3": processedGIP[key].r3.Get(),
                  "r4": processedGIP[key].r4.Get()
               };
            }
            GIP[k_OPKEY_TWIGS].Add(processedGIP[key][k_OPKEY_TWIGS].Get());
            GIP[k_OPKEY_PEBBLES].Add(processedGIP[key][k_OPKEY_PEBBLES].Get());
            GIP[k_OPKEY_PUTTY].Add(processedGIP[key][k_OPKEY_PUTTY].Get());
            GIP[k_OPKEY_GOO].Add(processedGIP[key][k_OPKEY_GOO].Get());
         }
         processedGIP[k_OPKEY_TIME] = lastProcessedGIP;
         
         return lastProcessedGIP;
      }
      
      public static function setLocalGIP(localGIP:Object):void
      {
         var gipEntry:String = null;
         var processedGIP:Object = BASE._processedGIP;
         if (!MapRoomManager.instance.isInMapRoom3)
         {
            for (gipEntry in processedGIP)
            {
               if (gipEntry === k_OPKEY_TIME)
               {
                  if (BYMConfig.instance.AUTOBANK_FIX && GLOBAL.mode === GLOBAL.e_BASE_MODE.ATTACK && BASE.isOutpost)
                  {
                     localGIP[gipEntry] = BASE._lastProcessedGIP;
                  } else if (!BASE.isMainYardInfernoOnly)
                  {
                     localGIP[gipEntry] = GLOBAL.Timestamp();
                  } else
                  {
                     localGIP[gipEntry] = BASE._lastProcessedGIP;
                  }
               } else
               {
                  localGIP[gipEntry] = {
                     "r1": BASE._processedGIP[gipEntry][k_OPKEY_TWIGS].Get(),
                     "r2": BASE._processedGIP[gipEntry][k_OPKEY_PEBBLES].Get(),
                     "r3": BASE._processedGIP[gipEntry][k_OPKEY_PUTTY].Get(),
                     "r4": BASE._processedGIP[gipEntry][k_OPKEY_GOO].Get()
                  };
               }
            }
         } else
         {
            for (gipEntry in processedGIP)
            {
               if (gipEntry === k_OPKEY_TIME)
               {
                  localGIP[gipEntry] = GLOBAL.Timestamp();
               }
            }
         }
      }
      
      public static function updateBuildingResources(p_oGIPData:Object):Object
      {
         var resourceTypeCounter:uint = 0;
         var newResources:Object = null;
         var allBResourceObjects:Vector.<Object> = null;
         var bresourceObj:BFOUNDATION = null;
         var resourceLvl:int = 0;
         var addedResources:int = 0;
         if (BASE.isOutpost)
         {
            newResources = {
               "r1": 0,
               "r2": 0,
               "r3": 0,
               "r4": 0
            };
            allBResourceObjects = InstanceManager.getInstancesByClass(BRESOURCE);
            for each(bresourceObj in allBResourceObjects)
            {
               if (bresourceObj._type >= 1 && bresourceObj._type <= 4)
               {
                  if (bresourceObj.health > 0)
                  {
                     resourceLvl = bresourceObj._lvl.Get();
                     addedResources = 0;
                     if (bresourceObj._countdownUpgrade.Get() > 0)
                     {
                        resourceLvl++;
                     }
                     addedResources = int(bresourceObj._buildingProps.produce[resourceLvl - 1]);
                     addedResources = Math.max(int(addedResources * GLOBAL._averageAltitude.Get() / GLOBAL._currentCell.cellHeight), 1);
                     newResources["r" + bresourceObj._type] += addedResources;
                  }
               }
            }
            if (BASE._processedGIP[k_OPKEY_BASE + BASE._baseID])
            {
               resourceTypeCounter = 1;
               while (resourceTypeCounter < k_MAX_RESOURCES)
               {
                  BASE._GIP["r" + resourceTypeCounter].Add(-BASE._processedGIP[k_OPKEY_BASE + BASE._baseID]["r" + resourceTypeCounter].Get());
                  BASE._processedGIP[k_OPKEY_BASE + BASE._baseID]["r" + resourceTypeCounter].Set(newResources["r" + resourceTypeCounter]);
                  BASE._rawGIP[k_OPKEY_BASE + BASE._baseID]["r" + resourceTypeCounter] = newResources["r" + resourceTypeCounter];
                  resourceTypeCounter++;
               }
            } else
            {
               BASE._processedGIP[k_OPKEY_BASE + BASE._baseID] = {
                  "r1": new SecNum(newResources[k_OPKEY_TWIGS]),
                  "r2": new SecNum(newResources[k_OPKEY_PEBBLES]),
                  "r3": new SecNum(newResources[k_OPKEY_PUTTY]),
                  "r4": new SecNum(newResources[k_OPKEY_GOO])
               };
               BASE._rawGIP[k_OPKEY_BASE + BASE._baseID] = {
                  "r1": newResources[k_OPKEY_TWIGS],
                  "r2": newResources[k_OPKEY_PEBBLES],
                  "r3": newResources[k_OPKEY_PUTTY],
                  "r4": newResources[k_OPKEY_GOO]
               };
            }
            resourceTypeCounter = 1;
            while (resourceTypeCounter < k_MAX_RESOURCES)
            {
               BASE._GIP["r" + resourceTypeCounter].Add(newResources["r" + resourceTypeCounter]);
               resourceTypeCounter++;
            }
            p_oGIPData[k_OPKEY_BASE + BASE._baseID] = newResources;
         }
         return p_oGIPData;
      }
      
      public static function autobank(param1:int = 10, mr3LogResources:Boolean = false):void
      {
         var baseGIP:Object = null;
         var iResType:int = 0;
         var iAutobankedSum:SecNum = null;
         var vResourcesList1:Array = null;
         var boostMultiplier:SecNum = null;
         var oAutoBankBaseBuff:AutoBankBaseBuff = null;
         if (MapRoomManager.instance.isInMapRoom2)
         {
            baseGIP = BASE._GIP;
            if (!baseGIP)
            {
               return;
            }
            iAutobankedSum = new SecNum(0);
            vResourcesList1 = [new SecNum(0), new SecNum(0), new SecNum(0), new SecNum(0)];
            if (GLOBAL._harvesterOverdrive >= GLOBAL.Timestamp() && Boolean(GLOBAL._harvesterOverdrivePower.Get()))
            {
               boostMultiplier = GLOBAL._harvesterOverdrivePower;
            } else
            {
               boostMultiplier = new SecNum(1);
            }
            iResType = 1;
            while (iResType < k_MAX_RESOURCES)
            {
               var resKey:String = "r" + iResType;
               var resIdx:int = iResType - 1;
               if (Boolean(baseGIP[resKey]) && Boolean(baseGIP[resKey].Get()))
               {
                  vResourcesList1[resIdx].Set(BASE.Fund(iResType, baseGIP[resKey].Get() * boostMultiplier.Get() * param1 / 10, false, null, false, false));
                  iAutobankedSum.Add(vResourcesList1[resIdx].Get());
               }
               if (param1 > 10 || s_logCounter == 0)
               {
                  if (vResourcesList1[resIdx].Get() > 0)
                  {
                     LOGGER.Stat([96, iResType, vResourcesList1[resIdx].Get() * (param1 > 10 ? 1 : 10)]);
                  }
                  s_logCounter = 10;
               }
               iResType++;
            }
            BASE.PointsAdd(Math.ceil(iAutobankedSum.Get() * 0.375));
         } else if (MapRoomManager.instance.isInMapRoom3)
         {
            if (oAutoBankBaseBuff = BaseBuffHandler.instance.getBuffByName(AutoBankBaseBuff.k_NAME) as AutoBankBaseBuff)
            {
               fundAllResourcesMr3(oAutoBankBaseBuff.value * Math.max(0, param1), mr3LogResources || s_logCounter == 0);
            }
         }
         --s_logCounter;
      }
      
      private static function fundAllResourcesMr3(amount:Number, logResources:Boolean):void
      {
         var resType:uint = 1;
         while (resType < k_MAX_RESOURCES)
         {
            BASE.Fund(resType, amount, false, null, false, false);
            if (logResources && Boolean(amount))
            {
               LOGGER.Stat([96, resType, amount]);
            }
            resType++;
         }
         if (logResources)
         {
            s_logCounter = 10;
         }
      }
   }
}

final class InstanceEnforcer
{
   
   
   public function InstanceEnforcer()
   {
      super();
   }
}
