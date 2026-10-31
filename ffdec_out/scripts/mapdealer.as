package
{
   import bg.*;
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class mapdealer extends MovieClip
   {
      public var mapArr:Array = new Array();
      
      public var thisFather:fightMain;
      
      public var mapHeight:int;
      
      public var mapWidth:int;
      
      public function mapdealer(param1:fightMain, param2:Array)
      {
         super();
         thisFather = param1;
         initMap(param2);
      }
      
      private function initMap(param1:Array) : *
      {
         var _loc2_:allMapCell = null;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         param1 = param1;
         mapHeight = param1.length;
         mapWidth = param1[0].length;
         _loc3_ = 0;
         while(_loc3_ < mapHeight)
         {
            _loc4_ = 0;
            while(_loc4_ < mapWidth)
            {
               if(false)
               {
                  throw true;
               }
               var _loc5_:* = int(param1[_loc3_][_loc4_]);
               if(0 !== _loc5_)
               {
                  if(1 === _loc5_)
                  {
                     §§push(1);
                  }
                  else if(2 === _loc5_)
                  {
                     §§push(2);
                  }
                  else if(3 === _loc5_)
                  {
                     §§push(3);
                  }
                  else if(4 === _loc5_)
                  {
                     §§push(4);
                  }
                  else if(5 === _loc5_)
                  {
                     §§push(5);
                  }
                  else
                  {
                     §§push(6);
                     if(false)
                     {
                        return;
                     }
                     §§push(§§pop() === _loc5_ ? 6 : (7 === _loc5_ ? 7 : (8 === _loc5_ ? 8 : (9 === _loc5_ ? 9 : (10 === _loc5_ ? 10 : (11 === _loc5_ ? 11 : (12 !== _loc5_ ? (13 === _loc5_ ? 13 : (14 === _loc5_ ? 14 : (15 === _loc5_ ? 15 : (16 === _loc5_ ? 16 : 17)))) : 12)))))));
                  }
               }
               else
               {
                  §§push(0);
               }
               if(false)
               {
                  return;
               }
               switch(§§pop())
               {
                  case 0:
                     _loc2_ = new cell0(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 1:
                     _loc2_ = new cell1(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 2:
                     _loc2_ = new cell2(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 3:
                     _loc2_ = new cell3(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 4:
                     _loc2_ = new cell4(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 5:
                     _loc2_ = new cell5(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 6:
                     §§push(§§findproperty(cell6));
                     §§push(_loc4_ * 40);
                     §§push(_loc3_);
                     §§push(40);
                     if(false)
                     {
                        return;
                     }
                     _loc2_ = new §§pop().cell6(§§pop(),§§pop() * §§pop());
                     break;
                  case 7:
                     _loc2_ = new cell7(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 8:
                     _loc2_ = new cell8(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 9:
                     §§push(§§findproperty(cell9));
                     §§push(_loc4_ * 40);
                     §§push(_loc3_);
                     if(false)
                     {
                        return;
                     }
                     _loc2_ = new §§pop().cell9(§§pop(),§§pop() * 40);
                     break;
                  case 10:
                     _loc2_ = new cell10(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 11:
                     _loc2_ = new cell11(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 12:
                     _loc2_ = new cell12(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 13:
                     §§push(new cell13(_loc4_ * 40,_loc3_ * 40));
                     if(false)
                     {
                        return;
                     }
                     _loc2_ = §§pop();
                     break;
                  case 14:
                     _loc2_ = new cell14(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 15:
                     §§push(§§findproperty(cell15));
                     if(false)
                     {
                        throw true;
                     }
                     _loc2_ = new §§pop().cell15(_loc4_ * 40,_loc3_ * 40);
                     break;
                  case 16:
                     _loc2_ = new cell16(_loc4_ * 40,_loc3_ * 40);
               }
               thisFather.backgroundLoader.addChild(_loc2_);
               mapArr.push(_loc2_);
               _loc2_.x = _loc4_ * 40;
               §§push(_loc2_);
               §§push(_loc3_);
               if(false)
               {
                  return;
               }
               §§pop().y = §§pop() * 40;
               _loc4_++;
            }
            _loc3_++;
         }
         if(false)
         {
            return;
         }
      }
      
      public function tryMove(param1:int, param2:int, param3:int, param4:int, param5:String) : Array
      {
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         if(param1 == param3 && param2 == param4)
         {
            return [param3,param4,param5];
         }
         if(param3 % 40 == 0)
         {
            if(param3 > param1)
            {
               param3--;
            }
            else
            {
               param3 += 1;
            }
         }
         _loc6_ = beforeMove(param1,param2,param3,param4,param5);
         param3 = int(_loc6_[0]);
         param4 = int(_loc6_[1]);
         if(Math.abs(param4 - param2) >= Math.abs(param3 - param1))
         {
            §§push(checkY(param1,param2,param1,param4,param5));
            if(false)
            {
               throw true;
            }
            _loc8_ = §§pop();
            _loc7_ = checkX(param1,_loc8_,param3,_loc8_,param5);
         }
         else
         {
            §§push(§§findproperty(checkX));
            §§push(param1);
            §§push(param2);
            §§push(param3);
            §§push(param2);
            if(false)
            {
               return;
            }
            _loc7_ = int(§§pop().checkX(§§pop(),§§pop(),§§pop(),§§pop(),param5));
            _loc8_ = checkY(_loc7_,param2,_loc7_,param4,param5);
         }
         return checkS(_loc7_,_loc8_,param5);
      }
      
      private function checkX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:allMapCell = null;
         var _loc11_:allMapCell = null;
         var _loc12_:int = 0;
         if(param1 == param3)
         {
            return param3;
         }
         _loc6_ = Math.floor(param1 / 40);
         §§push(Math);
         §§push(param2);
         §§push(40);
         if(false)
         {
            return;
         }
         _loc7_ = int(§§pop().ceil(§§pop() / §§pop()));
         _loc8_ = Math.floor(param3 / 40);
         §§push(Math.ceil(param4 / 40));
         if(false)
         {
            return;
         }
         _loc9_ = §§pop();
         _loc10_ = mapArr[(_loc7_ - 1) * mapWidth + _loc6_];
         §§push(mapArr);
         §§push((_loc9_ - 1) * mapWidth);
         §§push(_loc8_);
         if(false)
         {
            return false;
         }
         _loc11_ = §§pop()[§§pop() + §§pop()];
         if(_loc10_ == _loc11_)
         {
            _loc12_ = _loc11_.checkMoveX(param1,param2,param3,param4,param5);
            if(false)
            {
               return false;
            }
         }
         else
         {
            _loc12_ = _loc10_.checkMoveX(param1,param2,param3,param4,param5);
            if(_loc12_ == param3)
            {
               §§push(_loc11_);
               §§push(param1);
               §§push(param2);
               if(false)
               {
                  return;
               }
               _loc12_ = int(§§pop().checkMoveX(§§pop(),§§pop(),param3,param4,param5));
            }
         }
         return _loc12_;
      }
      
      private function checkS(param1:int, param2:int, param3:String) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:Array = null;
         _loc4_ = Math.floor(param1 / 40);
         _loc5_ = Math.ceil(param2 / 40);
         §§push(mapArr[(_loc5_ - 1) * mapWidth + _loc4_]);
         §§push(mapArr[(_loc5_ - 1) * mapWidth + _loc4_]);
         if(false)
         {
            return;
         }
         _loc6_ = §§pop();
         _loc7_ = §§pop().checkSite(param1,param2,param3);
         if(_loc7_[2] == "fly" && param2 % 40 == 0)
         {
            _loc6_ = mapArr[_loc5_ * mapWidth + _loc4_];
            _loc7_ = _loc6_.checkSite(param1,param2,param3);
         }
         return _loc7_;
      }
      
      private function checkY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         var _loc6_:int = 0;
         var _loc7_:* = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:allMapCell = null;
         var _loc11_:allMapCell = null;
         var _loc12_:int = 0;
         if(false)
         {
            return false;
         }
         if(param2 == param4)
         {
            return param4;
         }
         _loc6_ = Math.floor(param1 / 40);
         §§push(int(Math.ceil(param2 / 40)));
         if(false)
         {
            return;
         }
         _loc7_ = §§pop();
         _loc8_ = Math.floor(param3 / 40);
         _loc9_ = Math.ceil(param4 / 40);
         _loc10_ = mapArr[(_loc7_ - 1) * mapWidth + _loc6_];
         _loc11_ = mapArr[(_loc9_ - 1) * mapWidth + _loc8_];
         if(_loc10_ == _loc11_)
         {
            _loc12_ = _loc11_.checkMoveY(param1,param2,param3,param4,param5);
            if(false)
            {
               throw true;
            }
         }
         else
         {
            _loc12_ = _loc10_.checkMoveY(param1,param2,param3,param4,param5);
            if(_loc12_ == param4)
            {
               §§push(_loc11_);
               §§push(param1);
               §§push(param2);
               §§push(param3);
               if(false)
               {
                  throw true;
               }
               _loc12_ = int(§§pop().checkMoveY(§§pop(),§§pop(),§§pop(),param4,param5));
            }
         }
         return _loc12_;
      }
      
      public function tryClimb(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = Math.floor(param1 / 40);
         _loc4_ = Math.ceil(param2 / 40);
         _loc5_ = (_loc4_ - 1) * mapWidth + _loc3_;
         return mapArr[_loc5_].checkClimb(param1,param2);
      }
      
      public function tryChangeLine(param1:int, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc3_ = Math.floor(param1 / 40);
         _loc4_ = Math.ceil(param2 / 40);
         _loc5_ = (_loc4_ - 1) * mapWidth + _loc3_;
         return mapArr[_loc5_].checkChangeLine(param1,param2);
      }
      
      private function beforeMove(param1:int, param2:int, param3:int, param4:int, param5:String) : Array
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:allMapCell = null;
         var _loc9_:Array = null;
         _loc6_ = Math.floor(param1 / 40);
         _loc7_ = Math.ceil(param2 / 40);
         _loc8_ = mapArr[(_loc7_ - 1) * mapWidth + _loc6_];
         _loc9_ = [param3,param4];
         if(_loc8_.beforeCheck)
         {
            §§push(_loc8_);
            §§push(param1);
            §§push(param2);
            if(false)
            {
               return;
            }
            _loc9_ = §§pop().checkNew(§§pop(),§§pop(),param3,param4,param5);
         }
         if(param5 == "fly" && param2 % 40 == 0)
         {
            _loc8_ = mapArr[_loc7_ * mapWidth + _loc6_];
            §§push(_loc8_);
            §§push(param1);
            §§push(param2);
            §§push(param3);
            if(false)
            {
               return;
            }
            _loc9_ = §§pop().checkNew(§§pop(),§§pop(),§§pop(),param4,param5);
         }
         return _loc9_;
      }
   }
}

§§push(§§findproperty(mapdealer));
§§push(MovieClip);
if(false)
{
   return;
}

