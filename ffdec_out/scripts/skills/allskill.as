package skills
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   
   public class allskill extends MovieClip
   {
      public var curSpdX:int;
      
      public var blockTime:int = 0;
      
      public var thisHitX:int = 0;
      
      public var thisAtt:int;
      
      public var thisSpd:int;
      
      public var curSpdY:int;
      
      public var curTar:allrole;
      
      public var hitRight:int = 20;
      
      public var thisHitY:int = 0;
      
      public var thisTimer:int;
      
      public var effectFrame:int;
      
      public var onceHit:Boolean = false;
      
      public var defBlockTime:int = 3;
      
      public var thisObj:MovieClip;
      
      public var thisOver:Boolean = false;
      
      public var hitLeft:int = -20;
      
      public var thisMaster:allrole;
      
      public var hitBottom:int = 20;
      
      public var hitObject:Object;
      
      public var tarArray:Array = new Array();
      
      public var hitTop:int = -20;
      
      public var thisMultiple:Number = 1;
      
      public function allskill()
      {
         if(false)
         {
            return;
         }
         hitTop = -20;
         hitBottom = 20;
         §§push(§§findproperty(hitObject));
         §§push("hitTimer");
         §§push(int);
         §§push("hitLeft");
         §§push(int);
         §§push("hitRight");
         §§push(int);
         §§push("hitTop");
         §§push(int);
         §§push("hitBottom");
         §§push(int);
         if(false)
         {
            return;
         }
         §§pop().hitObject = null;
         super();
         initHObj();
      }
      
      public function dealSpeed() : *
      {
      }
      
      public function dealMove() : *
      {
         thisObj.x += curSpdX;
         thisObj.y += curSpdY;
      }
      
      public function setHitObj(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Number, param8:int, param9:int, param10:int, param11:String = "lh1") : *
      {
         var hy:int;
         var hlight:String;
         var hc:int;
         var htime:int = param1;
         var hl:int = param2;
         var hr:int = param3;
         var ht:int = param4;
         var hb:int = param5;
         var hp:int = param6;
         var hm:Number = param7;
         var hx:int = param8;
         §§push(§§newactivation());
         §§push(param9);
         if(false)
         {
            return;
         }
         §§pop().§§slot[9] = §§pop();
         hc = param10;
         hlight = param11;
         with(hitObject)
         {
            hitTimer = htime;
            §§push(§§findproperty(hitLeft));
            §§push(§§newactivation());
            if(false)
            {
               return false;
            }
            §§pop().hitLeft = §§pop().§§slot[2] + thisObj.x;
            hitRight = hr + thisObj.x;
            hitTop = ht + thisObj.y;
            hitBottom = hb + thisObj.y;
            §§push(§§findproperty(hitPower));
            §§push(§§newactivation());
            if(false)
            {
               return false;
            }
            §§pop().hitPower = §§pop().§§slot[6];
            hitMultiple = hm;
            hitX = hx;
            hitY = hy;
            hitCenter = hc + thisObj.x;
            hitLight = hlight;
         }
      }
      
      public function dealFrame() : *
      {
         if(thisObj.currentFrame == thisObj.totalFrames)
         {
            thisObj.gotoAndStop(1);
         }
         else
         {
            thisObj.nextFrame();
         }
         §§push(§§findproperty(setHitObj));
         §§push(1);
         §§push(hitLeft);
         §§push(hitRight);
         §§push(hitTop);
         if(false)
         {
            return false;
         }
         §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),hitBottom,thisAtt,thisMultiple,thisHitX,thisHitY,0);
      }
      
      public function runMe() : *
      {
         if(blockTime > 0)
         {
            if(blockTime != defBlockTime)
            {
               --blockTime;
               return;
            }
            --blockTime;
         }
         dealOver();
         dealHit();
         dealFrame();
         dealSpeed();
         dealMove();
         --thisTimer;
      }
      
      public function dealHit() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         if(hitObject.hitTimer > 0)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            if(false)
            {
               return;
            }
            while(_loc2_ < tarArray.length)
            {
               if(tarArray[_loc2_].beHit(hitObject))
               {
                  blockTime = defBlockTime;
                  tarArray[_loc2_].changTar(this.thisMaster);
                  if(false)
                  {
                     return;
                  }
                  _loc1_++;
               }
               _loc2_++;
            }
            if(_loc1_ > 0)
            {
               §§push(thisMaster);
               §§push(1);
               if(false)
               {
                  return;
               }
               §§pop().changState(§§pop(),"mp");
               thisMaster.dealHnObj(_loc1_);
               if(onceHit)
               {
                  dealOnceHit();
               }
            }
            --hitObject.hitTimer;
         }
      }
      
      public function dealOnceHit() : *
      {
         thisOver = true;
      }
      
      public function initHObj() : *
      {
         with(hitObject)
         {
            hitTimer = 0;
            hitLeft = 0;
            §§push(§§findproperty(hitRight));
            §§push(0);
            if(false)
            {
               return;
            }
            §§pop().hitRight = §§pop();
            hitTop = 0;
            hitBottom = 0;
            hitPower = 0;
            hitMultiple = 0;
            §§push(§§findproperty(hitX));
            if(false)
            {
               return;
            }
            §§pop().hitX = 0;
            hitY = 0;
            hitCenter = 0;
         }
      }
      
      public function dealOver() : *
      {
         if(thisTimer < 0)
         {
            thisOver = true;
         }
      }
   }
}

§§push(§§findproperty(allskill));
if(false)
{
   return;
}

