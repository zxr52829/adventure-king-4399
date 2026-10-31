package skills
{
   import flash.display.MovieClip;
   import roles.allrole;
   
   public class tarskill extends allskill
   {
      public var rot:Boolean = false;
      
      public function tarskill(param1:String, param2:MovieClip, param3:allrole)
      {
         super();
         thisObj = param2;
         thisMaster = param3;
         initThisByName(param1);
         tarArray = thisMaster.tarArray;
      }
      
      private function dealRotation() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(curTar == null)
         {
            return;
         }
         _loc1_ = curTar.thisLoader.x - thisObj.x;
         _loc2_ = curTar.thisLoader.y - 40 - thisObj.y;
         _loc4_ = thisObj.rotation;
         if(_loc1_ >= 0)
         {
            _loc3_ = Math.floor(Math.atan(_loc2_ / _loc1_) * 180 / 3.14);
         }
         else
         {
            _loc3_ = Math.floor(180 + Math.atan(_loc2_ / _loc1_) * 180 / 3.14);
         }
         if(_loc3_ > 360)
         {
            _loc3_ -= 360;
         }
         else if(_loc3_ < 0)
         {
            _loc3_ += 360;
         }
         if(_loc4_ > 360)
         {
            _loc4_ -= 360;
            if(false)
            {
               throw true;
            }
         }
         else if(_loc4_ < 0)
         {
            _loc4_ += 360;
         }
         if(_loc3_ >= _loc4_)
         {
            if(_loc3_ - _loc4_ < 10)
            {
               thisObj.rotation = _loc3_;
            }
            else if(_loc3_ - _loc4_ > 180)
            {
               thisObj.rotation -= 10;
            }
            else
            {
               §§push(thisObj);
               §§push(thisObj.rotation + 10);
               if(false)
               {
                  return;
               }
               §§pop().rotation = §§pop();
            }
         }
         else if(_loc4_ - _loc3_ < 10)
         {
            thisObj.rotation = _loc3_;
         }
         else if(_loc4_ - _loc3_ <= 180)
         {
            thisObj.rotation -= 10;
         }
         else
         {
            thisObj.rotation += 10;
         }
         curSpdX = Math.cos(thisObj.rotation * 3.14 / 180) * thisSpd;
         curSpdY = Math.sin(thisObj.rotation * 3.14 / 180) * thisSpd;
      }
      
      override public function dealMove() : *
      {
         dealTar();
         dealRotation();
         thisObj.x += curSpdX;
         thisObj.y += curSpdY;
      }
      
      private function dealTar() : *
      {
         var _loc1_:int = 0;
         if(curTar != null && !curTar.thisOver)
         {
            return;
         }
         §§push(thisMaster.curTar);
         if(false)
         {
            return;
         }
         if(§§pop() != null)
         {
            curTar = thisMaster.curTar;
         }
         else if(thisMaster.tarArray.length > 0)
         {
            _loc1_ = Math.floor(Math.random() * thisMaster.tarArray.length);
            curTar = thisMaster.tarArray[_loc1_];
         }
         else
         {
            §§push(§§findproperty(thisOver));
            if(false)
            {
               return;
            }
            §§pop().thisOver = true;
         }
      }
      
      private function initThisByName(param1:String) : *
      {
         thisAtt = thisMaster.thisAtt;
         dealTar();
         var _loc2_:* = param1;
         §§push("ms1mc");
         if(false)
         {
            return;
         }
         switch(_loc2_)
         {
            case §§pop():
               onceHit = true;
               thisSpd = 20;
               §§push(§§findproperty(thisHitX));
               §§push(5);
               if(false)
               {
                  throw true;
               }
               §§pop().thisHitX = §§pop();
               thisHitY = -10;
               thisTimer = 100;
               thisObj.rotation = Math.floor(Math.random() * 360);
               break;
            case "s8mc":
               onceHit = true;
               thisAtt = thisMaster.thisAtt;
               thisSpd = 20;
               thisHitX = 5;
               thisHitY = -10;
               §§push(§§findproperty(thisTimer));
               if(false)
               {
                  throw true;
               }
               §§pop().thisTimer = 100;
               thisObj.rotation = Math.floor(Math.random() * 360);
               break;
         }
      }
   }
}

§§push(§§findproperty(tarskill));
§§push(Sprite);
if(false)
{
   return;
}

