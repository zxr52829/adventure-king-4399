package skills
{
   import flash.display.MovieClip;
   import roles.allrole;
   
   public class tarlineskill extends allskill
   {
      public var rot:Boolean = false;
      
      public function tarlineskill(param1:String, param2:MovieClip, param3:allrole)
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
         §§push(curTar.thisLoader);
         if(false)
         {
            return;
         }
         _loc1_ = §§pop().x - thisObj.x;
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
         }
         else if(_loc4_ < 0)
         {
            _loc4_ += 360;
         }
         thisObj.rotation = _loc3_;
         curSpdX = Math.cos(thisObj.rotation * 3.14 / 180) * thisSpd;
         curSpdY = Math.sin(thisObj.rotation * 3.14 / 180) * thisSpd;
      }
      
      private function dealTar() : *
      {
         var _loc1_:int = 0;
         if(curTar != null && !curTar.thisOver)
         {
            return;
         }
         if(thisMaster.curTar != null)
         {
            curTar = thisMaster.curTar;
         }
         else if(thisMaster.tarArray.length > 0)
         {
            if(false)
            {
               return;
            }
            _loc1_ = Math.floor(Math.random() * thisMaster.tarArray.length);
            curTar = thisMaster.tarArray[_loc1_];
         }
         else
         {
            thisOver = true;
         }
      }
      
      private function initThisByName(param1:String) : *
      {
         thisAtt = thisMaster.thisAtt;
         dealTar();
         switch(param1)
         {
            case "s2mc":
               onceHit = true;
               thisSpd = 20;
               thisHitX = 5;
               thisHitY = -10;
               thisTimer = 40;
               dealTar();
               dealRotation();
               break;
            case "s5mc":
               thisSpd = 3;
               thisHitX = 0;
               thisHitY = 0;
               thisTimer = 400;
               hitLeft = -80;
               hitRight = 80;
               hitTop = -80;
               hitBottom = 80;
               dealTar();
               dealRotation();
               break;
            case "s6mc":
               onceHit = true;
               thisSpd = 20;
               thisHitX = 5;
               thisHitY = -10;
               thisTimer = 40;
               if(false)
               {
                  throw true;
               }
               dealTar();
               dealRotation();
               break;
         }
      }
   }
}

