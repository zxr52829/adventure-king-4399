package roles
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.utils.*;
   import roles.enemys.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class allrole extends MovieClip
   {
      public var thisCurMp:int;
      
      public var thisStateBoard:MovieClip;
      
      public var thisCurExp:int;
      
      public var nowCommond:String;
      
      public var protectTime:int = 4;
      
      public var freeTimer:int = 50;
      
      public var thisSpeed:int = 5;
      
      public var thisLoader:MovieClip;
      
      public var jumpTop:int;
      
      public var defBlockTime:int = 3;
      
      public var thisDef:int;
      
      public var canJumpNum:int = 1;
      
      public var dropSpeed:int = 3;
      
      public var thisOver:Boolean = false;
      
      public var thisAllHp:int;
      
      public var thisExp:int;
      
      public var hitBlockTime:int = 15;
      
      public var hitObject:Object;
      
      public var hitStick:Boolean = false;
      
      public var climbSpeed:int = 3;
      
      public var nowJumpNum:int = 0;
      
      public var jumpSpeed:int = -25;
      
      public var skillObj:Object;
      
      public var thisItemNum:int = 1;
      
      public var thisAllExp:int;
      
      public var blockTime:int = 0;
      
      public var defHitArea:int;
      
      public var thisSItemArr:Array;
      
      public var thisAtt:int;
      
      public var thisAllMp:int;
      
      public var searchObject:Object;
      
      public var myMaster:allrole;
      
      public var defAttArea:int;
      
      public var curTar:allrole;
      
      public var actDealer:actdealer;
      
      public var thisCurHp:int;
      
      public var nowSpeedX:int = 0;
      
      public var nowSpeedY:int = 0;
      
      public var thisObj:MovieClip;
      
      public var dealOnfloor:Boolean = false;
      
      public var defHitSpd:int;
      
      public var thisFather:fightMain;
      
      public var curSite:String = "fly";
      
      public var beHitObject:Object;
      
      public var tarArray:Array;
      
      public var thisItemArr:Array;
      
      public var attSpdX:int = 0;
      
      public var myPet:allrole;
      
      public var commond:Object;
      
      public var attSpdY:int = 0;
      
      public function allrole()
      {
         thisOver = false;
         thisSpeed = 5;
         climbSpeed = 3;
         dropSpeed = 3;
         jumpSpeed = -25;
         nowSpeedX = 0;
         nowSpeedY = 0;
         canJumpNum = 1;
         nowJumpNum = 0;
         protectTime = 4;
         hitBlockTime = 15;
         blockTime = 0;
         defBlockTime = 3;
         freeTimer = 50;
         curSite = "fly";
         dealOnfloor = false;
         hitStick = false;
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
         §§push("hitPower");
         §§push(int);
         if(false)
         {
            return;
         }
         §§pop().hitObject = null;
         §§push(§§findproperty(beHitObject));
         §§push("noHitTimer");
         §§push(int);
         §§push("beHitLeft");
         if(false)
         {
            throw true;
         }
         §§pop().beHitObject = null;
         attSpdX = 0;
         attSpdY = 0;
         searchObject = {
            "searchX":int,
            "searchY":int,
            "escapeX":int,
            "escapeY":int
         };
         tarArray = new Array();
         §§push(§§findproperty(thisItemArr));
         §§push(§§findproperty(Array));
         if(false)
         {
            return;
         }
         §§pop().thisItemArr = new §§pop().Array();
         thisSItemArr = new Array();
         thisItemNum = 1;
         §§push(§§findproperty(commond));
         §§push("runleft");
         §§push(Boolean);
         §§push("runright");
         §§push(Boolean);
         §§push("runup");
         §§push(Boolean);
         if(false)
         {
            throw true;
         }
         §§pop().commond = null;
         super();
         with(commond)
         {
            runleft = false;
            runright = false;
            runup = false;
            rundown = false;
            runjump = false;
            runattack = false;
            runskill = false;
            runpower = false;
         }
         §§push(§§findproperty(actDealer));
         §§push(§§findproperty(actdealer));
         if(false)
         {
            return;
         }
         §§pop().actDealer = new §§pop().actdealer(this);
         initHObj();
         initBhObj();
      }
      
      public function dealOther() : *
      {
         if(thisStateBoard.alpha > 0)
         {
            thisStateBoard.alpha -= 0.02;
         }
      }
      
      public function changTar(param1:allrole) : *
      {
         curTar = param1;
      }
      
      public function getJumpTop(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(param1 + dropSpeed < 0)
         {
            param1 += dropSpeed;
            _loc2_ += param1;
         }
         return _loc2_;
      }
      
      public function jump() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite != "fly")
            {
               curSite = "fly";
               ++nowJumpNum;
               nowSpeedY = jumpSpeed;
            }
            else if(nowJumpNum < canJumpNum)
            {
               ++nowJumpNum;
               nowSpeedY = jumpSpeed;
            }
         }
      }
      
      public function dealScale(param1:Number) : *
      {
         if(actDealer.lockTimer <= 0)
         {
            thisObj.scaleX = param1;
         }
      }
      
      public function changState(param1:int, param2:String) : *
      {
         if(param2 == "hp")
         {
            thisCurHp += param1;
            if(thisCurHp > thisAllHp)
            {
               thisCurHp = thisAllHp;
            }
            else if(thisCurHp < 0)
            {
               thisCurHp = 0;
            }
            thisStateBoard.hpBar.scaleX = thisCurHp / thisAllHp;
            thisStateBoard.alpha = 1;
         }
      }
      
      public function beHit(param1:Object) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         _loc2_ = false;
         if(beHitObject.noHitTimer == 0)
         {
            §§push(beHitObject.beHitLeft + thisLoader.x <= param1.hitRight);
            if(beHitObject.beHitLeft + thisLoader.x <= param1.hitRight)
            {
               §§pop();
               §§push(beHitObject.beHitRight + thisLoader.x);
               if(false)
               {
                  return;
               }
               §§push(§§pop() >= param1.hitLeft);
            }
            if(§§pop() && beHitObject.beHitTop + thisLoader.y <= param1.hitBottom && beHitObject.beHitBottom + thisLoader.y >= param1.hitTop)
            {
               actDealer.setCtrl("behit","stop",hitBlockTime,true);
               if(beHitObject.beHitFly)
               {
                  if(param1.hitY < 0)
                  {
                     curSite = "fly";
                     nowSpeedY = param1.hitY;
                  }
                  §§push(thisLoader.x);
                  §§push(param1);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop() >= §§pop().hitCenter)
                  {
                     nowSpeedX = param1.hitX;
                  }
                  else
                  {
                     nowSpeedX = -param1.hitX;
                  }
               }
               _loc3_ = Math.floor((param1.hitPower - thisDef) * param1.hitMultiple * (Math.random() + 10) / 10);
               §§push(_loc3_);
               if(false)
               {
                  return;
               }
               if(§§pop() <= 0)
               {
                  _loc3_ = 1;
               }
               if(param1.hitLight == "lh1")
               {
                  addSound("behit1");
               }
               else
               {
                  addSound("behit2");
               }
               addHitLight(beHitObject.beHitLeft + thisLoader.x,param1.hitLeft,beHitObject.beHitRight + thisLoader.x,param1.hitRight,beHitObject.beHitTop + thisLoader.y,param1.hitTop,beHitObject.beHitBottom + thisLoader.y,param1.hitBottom,_loc3_,param1.hitLight);
               changState(-_loc3_,"hp");
               beHitObject.noHitTimer = protectTime;
               blockTime = defBlockTime;
               dealOnfloor = true;
               _loc2_ = true;
            }
         }
         return _loc2_;
      }
      
      public function initMySb() : *
      {
      }
      
      public function attack() : *
      {
         if(actDealer.setCtrl("attack","stop",defHitSpd + 5))
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = attSpdX * thisObj.scaleX;
               if(attSpdY < 0)
               {
                  nowSpeedY = attSpdY;
                  curSite = "fly";
               }
            }
         }
      }
      
      public function dealMove() : *
      {
         var _loc1_:Array = null;
         if(curSite == "fly")
         {
            nowSpeedY += dropSpeed;
            if(nowSpeedY > 30)
            {
               nowSpeedY = 30;
            }
         }
         else
         {
            nowJumpNum = 0;
            if(curSite != "climb")
            {
               nowSpeedY = 0;
               if(dealOnfloor)
               {
                  §§push(§§findproperty(nowSpeedX));
                  if(false)
                  {
                     throw true;
                  }
                  §§pop().nowSpeedX = 0;
                  dealOnfloor = false;
               }
            }
         }
         _loc1_ = thisFather.mapDealer.tryMove(thisLoader.x,thisLoader.y,thisLoader.x + nowSpeedX,thisLoader.y + nowSpeedY,curSite);
         if(Math.abs(_loc1_[0] - (thisLoader.x + nowSpeedX)) > 1)
         {
            hitStick = true;
         }
         else
         {
            hitStick = false;
         }
         thisLoader.x = _loc1_[0];
         thisLoader.y = _loc1_[1];
         curSite = _loc1_[2];
      }
      
      public function dead() : *
      {
         beHitObject.noHitTimer = 1000;
         if(curSite == "onfloor" || curSite == "climb")
         {
            actDealer.setCtrl("dead","stop",25);
         }
      }
      
      public function leftExp() : *
      {
         thisFather.giveExp(thisExp);
      }
      
      public function freeMove() : *
      {
         var _loc1_:Point = null;
         var _loc2_:int = 0;
         _loc1_ = new Point(thisLoader.x,thisLoader.y);
         _loc2_ = thisFather.mainLoader.localToGlobal(_loc1_).x;
         if(_loc2_ <= 0)
         {
            thisObj.scaleX = 1;
            movethis(thisObj.scaleX);
            return;
         }
         if(_loc2_ >= 640)
         {
            thisObj.scaleX = -1;
            movethis(thisObj.scaleX);
            return;
         }
         --freeTimer;
         if(freeTimer == 0)
         {
            if(Math.random() < 0.5)
            {
               movethis(thisObj.scaleX);
            }
            else
            {
               wait();
               thisObj.scaleX *= -1;
            }
            freeTimer = 50;
         }
      }
      
      public function initHObj() : *
      {
         with(hitObject)
         {
            hitTimer = 0;
            hitLeft = 0;
            if(false)
            {
               throw true;
            }
            hitRight = 0;
            hitTop = 0;
            hitBottom = 0;
            hitPower = 0;
            hitMultiple = 0;
            hitX = 0;
            hitY = 0;
            hitCenter = 0;
         }
      }
      
      public function checkNewMap(param1:String) : *
      {
      }
      
      public function checkNewPet(param1:Object) : *
      {
      }
      
      public function delHitNum() : *
      {
      }
      
      public function getExp(param1:int) : *
      {
      }
      
      public function addSound(param1:*) : *
      {
         Main.soundDealer.tryAddSound(param1);
      }
      
      public function addHitLight(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:String = "lh1") : *
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         _loc11_ = Math.floor((Math.max(param1,param2) + Math.min(param3,param4)) / 2);
         _loc12_ = Math.floor((Math.max(param5,param6) + Math.min(param7,param8)) / 2);
         thisFather.lightDealer.addHitLight(param10,_loc11_,_loc12_,thisObj.scaleX);
         thisFather.wordDealer.addWord("w1",param9,_loc11_,_loc12_);
      }
      
      public function dealHnObj(param1:int) : *
      {
      }
      
      public function shake(param1:int) : *
      {
         thisFather.setShake(param1);
      }
      
      public function searchCurTar() : allrole
      {
         var _loc1_:* = undefined;
         if(curTar != null)
         {
            return curTar;
         }
         if(searchObject.searchX > 0 && searchObject.searchY > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < tarArray.length)
            {
               §§push(Math);
               §§push(tarArray[_loc1_].thisLoader);
               if(false)
               {
                  return;
               }
               if(§§pop().abs(§§pop().x - thisLoader.x) < searchObject.searchX && Math.abs(tarArray[_loc1_].thisLoader.y - thisLoader.y) < searchObject.searchY)
               {
                  return tarArray[_loc1_];
               }
               _loc1_++;
            }
         }
         return null;
      }
      
      public function delThis() : *
      {
         thisOver = true;
         thisFather.delEnemy(this);
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
            return false;
         }
         §§pop().§§slot[9] = §§pop();
         hc = param10;
         hlight = param11;
         with(hitObject)
         {
            hitTimer = htime;
            hitLeft = hl + thisLoader.x;
            hitRight = hr + thisLoader.x;
            hitTop = ht + thisLoader.y;
            hitBottom = hb + thisLoader.y;
            hitPower = hp;
            hitMultiple = hm;
            hitX = hx;
            hitY = hy;
            hitCenter = hc + thisLoader.x;
            hitLight = hlight;
         }
      }
      
      public function fastSkill(param1:String) : *
      {
      }
      
      public function wait() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            nowSpeedX = 0;
         }
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
         dealHit();
         dealCommond();
         dealMove();
         dealAction();
         dealOther();
      }
      
      public function dealPic(param1:Array) : *
      {
      }
      
      public function dealHit() : *
      {
         var _loc1_:* = undefined;
         if(hitObject.hitTimer > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < tarArray.length)
            {
               §§push(tarArray[_loc1_].beHit(hitObject));
               if(false)
               {
                  return false;
               }
               if(§§pop())
               {
                  blockTime = defBlockTime;
                  tarArray[_loc1_].changTar(this);
               }
               _loc1_++;
            }
            --hitObject.hitTimer;
         }
         if(beHitObject.noHitTimer > 0)
         {
            --beHitObject.noHitTimer;
         }
      }
      
      public function initBhObj() : *
      {
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -15;
            beHitRight = 15;
            beHitTop = -70;
            beHitBottom = -10;
            beHitFly = true;
         }
      }
      
      public function leftItem() : *
      {
         var _loc1_:* = undefined;
         if(thisItemNum > 0)
         {
            _loc1_ = Math.random();
            if(_loc1_ < 0.3 && thisItemArr.length > 0)
            {
               §§push(Math.floor(Math.random() * thisItemArr.length));
               if(false)
               {
                  throw true;
               }
               _loc1_ = §§pop();
               thisFather.creatOneItem(thisItemArr[_loc1_],thisLoader.x,thisLoader.y);
            }
            else if(_loc1_ > 0.95 && thisSItemArr.length > 0)
            {
               _loc1_ = Math.floor(Math.random() * thisSItemArr.length);
               if(false)
               {
                  throw true;
               }
               thisFather.creatOneItem(thisSItemArr[_loc1_],thisLoader.x,thisLoader.y);
            }
            --thisItemNum;
         }
      }
      
      public function dealAction() : *
      {
         var _loc1_:Array = null;
         _loc1_ = actDealer.dealMc();
         dealPic(_loc1_);
      }
      
      public function dealCommond() : *
      {
      }
      
      public function moveToTar(param1:allrole) : *
      {
         var _loc2_:int = 0;
         if(actDealer.lockTimer <= 0)
         {
            _loc2_ = 0;
            if(hitStick && jumpSpeed != 0)
            {
               if(Math.random() > 0.5 && jumpTop < 40)
               {
                  jump();
               }
               else
               {
                  downJump();
               }
            }
            if(Math.abs(thisLoader.x - param1.thisLoader.x) > thisSpeed)
            {
               §§push(thisLoader.x);
               §§push(param1);
               if(false)
               {
                  return;
               }
               if(§§pop() <= §§pop().thisLoader.x)
               {
                  if(thisLoader.x < param1.thisLoader.x)
                  {
                     _loc2_ = 1;
                  }
               }
               else
               {
                  _loc2_ = -1;
               }
            }
            else if(param1.thisLoader.y - thisLoader.y > jumpTop && param1.thisLoader.y + beHitObject.beHitBottom - thisLoader.y < -40 && jumpTop < 40)
            {
               jump();
            }
            else if(param1.thisLoader.y - thisLoader.y > 10 && jumpSpeed != 0)
            {
               downJump();
            }
            movethis(_loc2_);
         }
      }
      
      public function movethis(param1:Number, param2:Number = 0) : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(param1 != 0)
            {
               thisObj.scaleX = param1;
            }
            nowSpeedX = thisSpeed * param1;
            if(false)
            {
               return;
            }
         }
      }
      
      public function downJump() : *
      {
         if(actDealer.lockTimer <= 0 && curSite != "fly")
         {
            curSite = "fly";
            ++nowJumpNum;
         }
      }
      
      public function changeWeapon() : *
      {
      }
   }
}

