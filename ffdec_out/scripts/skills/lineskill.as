package skills
{
   import flash.display.MovieClip;
   import roles.allrole;
   
   public class lineskill extends allskill
   {
      public function lineskill(param1:String, param2:MovieClip, param3:allrole)
      {
         super();
         thisObj = param2;
         thisMaster = param3;
         thisObj.scaleX = thisMaster.thisObj.scaleX;
         §§push(§§findproperty(initThisByName));
         if(false)
         {
            return;
         }
         §§pop().initThisByName(param1);
         tarArray = thisMaster.tarArray;
      }
      
      private function initThisByName(param1:String) : *
      {
         thisAtt = thisMaster.thisAtt;
         var _loc2_:* = param1;
         if("s1mc" !== _loc2_)
         {
            §§push("s4mc" === _loc2_ ? 1 : ("ms1mc" === _loc2_ ? 2 : ("p1mc" === _loc2_ ? 3 : ("p2mc" === _loc2_ ? 4 : ("p3mc" === _loc2_ ? 5 : 6)))));
         }
         else
         {
            §§push(0);
            if(false)
            {
               return;
            }
         }
         switch(§§pop())
         {
            case 0:
               thisSpd = 20;
               thisHitX = 10;
               thisHitY = -20;
               thisTimer = 40;
               curSpdX = thisSpd * thisMaster.thisObj.scaleX;
               §§push(§§findproperty(curSpdY));
               §§push(0);
               if(false)
               {
                  return;
               }
               §§pop().curSpdY = §§pop();
               break;
            case 1:
               thisSpd = 10;
               thisHitX = 10;
               thisHitY = -20;
               thisTimer = 20;
               curSpdX = thisSpd * thisMaster.thisObj.scaleX;
               curSpdY = 0;
               break;
            case 2:
               onceHit = true;
               thisSpd = 10;
               thisHitX = 5;
               thisHitY = -10;
               thisTimer = 20;
               curSpdX = thisSpd * thisMaster.thisObj.scaleX;
               curSpdY = 0;
               break;
            case 3:
               onceHit = true;
               thisSpd = 10;
               thisHitX = 5;
               thisHitY = -10;
               thisTimer = 20;
               curSpdX = thisSpd * thisMaster.thisObj.scaleX;
               §§push(§§findproperty(curSpdY));
               §§push(0);
               if(false)
               {
                  return;
               }
               §§pop().curSpdY = §§pop();
               break;
            case 4:
               thisMultiple = 0.5;
               thisSpd = 5;
               thisHitX = 5;
               thisHitY = -10;
               thisTimer = 40;
               curSpdX = thisSpd * thisMaster.thisObj.scaleX;
               curSpdY = 0;
               break;
            case 5:
               §§push(§§findproperty(thisMultiple));
               §§push(3);
               if(false)
               {
                  return;
               }
               §§pop().thisMultiple = §§pop();
               thisSpd = 0;
               hitLeft = -80;
               hitRight = 80;
               hitTop = -120;
               hitBottom = 0;
               thisHitX = 10;
               thisHitY = -20;
               thisTimer = 15;
               curSpdX = thisSpd * thisMaster.thisObj.scaleX;
               curSpdY = 0;
               break;
         }
      }
   }
}

