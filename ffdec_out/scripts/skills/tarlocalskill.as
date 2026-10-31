package skills
{
   import flash.display.MovieClip;
   import roles.allrole;
   
   public class tarlocalskill extends allskill
   {
      public function tarlocalskill(param1:String, param2:MovieClip, param3:allrole)
      {
         super();
         thisObj = param2;
         thisMaster = param3;
         thisObj.scaleX = thisMaster.thisObj.scaleX;
         initThisByName(param1);
         tarArray = thisMaster.tarArray;
      }
      
      override public function dealFrame() : *
      {
         if(thisObj.currentFrame == effectFrame)
         {
            §§push(§§findproperty(setHitObj));
            §§push(thisObj.totalFrames - effectFrame);
            §§push(hitLeft);
            §§push(hitRight);
            §§push(hitTop);
            §§push(hitBottom);
            if(false)
            {
               return;
            }
            §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),thisAtt,1,thisHitX,thisHitY,0);
         }
         if(thisObj.currentFrame == thisObj.totalFrames)
         {
            thisObj.gotoAndStop(1);
         }
         else
         {
            thisObj.nextFrame();
         }
      }
      
      private function initThisByName(param1:String) : *
      {
         thisAtt = thisMaster.thisAtt;
         switch(param1)
         {
            case "s3mc":
               thisHitX = 10;
               thisHitY = -30;
               thisTimer = 15;
               curSpdX = 0;
               curSpdY = 0;
               hitLeft = -25;
               hitRight = 25;
               hitTop = -80;
               if(false)
               {
                  return;
               }
               hitBottom = 0;
               effectFrame = 9;
               break;
            case "s7mc":
               thisHitX = 10;
               thisHitY = -30;
               §§push(§§findproperty(thisTimer));
               §§push(6);
               if(false)
               {
                  return;
               }
               §§pop().thisTimer = §§pop();
               curSpdX = 0;
               curSpdY = 0;
               hitLeft = -50;
               hitRight = 50;
               hitTop = -220;
               §§push(§§findproperty(hitBottom));
               if(false)
               {
                  return;
               }
               §§pop().hitBottom = 0;
               effectFrame = 1;
               break;
         }
      }
   }
}

