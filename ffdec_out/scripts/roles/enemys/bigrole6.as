package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole6 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole6(param1:fightMain, param2:int, param3:int)
      {
         super();
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         thisLoader.x = param2;
         thisLoader.y = param3;
         thisFather = param1;
         initThis();
         thisObj.addChild(actLoader);
         thisFather.enemyRoleLoader.addChild(thisLoader);
         initMySb();
         tarArray = thisFather.teamArr;
      }
      
      override public function beHit(param1:Object) : Boolean
      {
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         _loc2_ = false;
         if(beHitObject.noHitTimer == 0)
         {
            §§push(beHitObject.beHitLeft + thisLoader.x <= param1.hitRight && beHitObject.beHitRight + thisLoader.x >= param1.hitLeft);
            if(beHitObject.beHitLeft + thisLoader.x <= param1.hitRight && beHitObject.beHitRight + thisLoader.x >= param1.hitLeft)
            {
               §§pop();
               §§push(beHitObject.beHitTop);
               if(false)
               {
                  return false;
               }
               §§push(§§pop() + thisLoader.y <= param1.hitBottom);
            }
            if(§§pop())
            {
               §§pop();
               §§push(beHitObject.beHitBottom + thisLoader.y >= param1.hitTop);
               if(false)
               {
                  throw true;
               }
            }
            if(§§pop())
            {
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
               if(_loc3_ <= 0)
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
      
      override public function initMySb() : *
      {
         thisStateBoard = new otherBoard();
         thisLoader.addChild(thisStateBoard);
         thisStateBoard.x = -20;
         thisStateBoard.y = -180;
         §§push(§§findproperty(changState));
         if(false)
         {
            return;
         }
         §§pop().changState(0,"hp");
         thisStateBoard.alpha = 0;
      }
      
      override public function attack() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
            }
            §§push(actDealer);
            §§push("attack1");
            §§push("stop");
            if(false)
            {
               return;
            }
            §§pop().setCtrl(§§pop(),§§pop(),50);
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
               actDealer.setCtrl("attack2","stop",50);
            }
         }
      }
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1[0];
         switch(_loc3_)
         {
            case "wait":
            default:
               _loc2_ = param1[1] % 32;
               _loc3_ = _loc2_;
               if(false)
               {
                  return;
               }
               switch(_loc3_)
               {
                  case 0:
                     actLoader.gotoAndStop(1);
                     break;
                  case 8:
                     actLoader.gotoAndStop(2);
                     break;
                  case 16:
                     actLoader.gotoAndStop(3);
                     break;
                  case 24:
                     actLoader.gotoAndStop(4);
               }
               break;
            case "walk":
               _loc2_ = param1[1] % 32;
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(5);
                     break;
                  case 8:
                     actLoader.gotoAndStop(6);
                     break;
                  case 16:
                     actLoader.gotoAndStop(7);
                     break;
                  case 24:
                     actLoader.gotoAndStop(8);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(8);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               if(0 !== _loc3_)
               {
                  §§push(4 === _loc3_ ? 1 : (8 === _loc3_ ? 2 : (12 === _loc3_ ? 3 : (16 === _loc3_ ? 4 : (20 === _loc3_ ? 5 : (24 === _loc3_ ? 6 : (28 === _loc3_ ? 7 : (32 === _loc3_ ? 8 : (36 !== _loc3_ ? (40 === _loc3_ ? 10 : 11) : 9)))))))));
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
                     actLoader.gotoAndStop(16);
                     break;
                  case 1:
                     actLoader.gotoAndStop(17);
                     break;
                  case 2:
                     actLoader.gotoAndStop(18);
                     break;
                  case 3:
                     actLoader.gotoAndStop(19);
                     break;
                  case 4:
                     actLoader.gotoAndStop(20);
                     break;
                  case 5:
                     actLoader.gotoAndStop(21);
                     break;
                  case 6:
                     actLoader.gotoAndStop(22);
                     break;
                  case 7:
                     actLoader.gotoAndStop(23);
                     break;
                  case 8:
                     actLoader.gotoAndStop(24);
                     §§push(thisFather);
                     if(false)
                     {
                        return false;
                     }
                     §§pop().skillDealer.addSkill("s7mc","tarlocal",thisLoader.x - 50,thisLoader.y,this);
                     thisFather.skillDealer.addSkill("s7mc","tarlocal",thisLoader.x + 50,thisLoader.y,this);
                     break;
                  case 9:
                     thisFather.skillDealer.addSkill("s7mc","tarlocal",thisLoader.x - 150,thisLoader.y,this);
                     thisFather.skillDealer.addSkill("s7mc","tarlocal",thisLoader.x + 150,thisLoader.y,this);
                     if(false)
                     {
                        return;
                     }
                     break;
                  case 10:
                     thisFather.skillDealer.addSkill("s7mc","tarlocal",thisLoader.x - 250,thisLoader.y,this);
                     thisFather.skillDealer.addSkill("s7mc","tarlocal",thisLoader.x + 250,thisLoader.y,this);
               }
               break;
            case "attack2":
               _loc2_ = int(param1[1]);
               §§push(_loc2_);
               if(false)
               {
                  return;
               }
               switch(§§pop())
               {
                  case 0:
                     actLoader.gotoAndStop(16);
                     break;
                  case 4:
                     actLoader.gotoAndStop(17);
                     break;
                  case 8:
                     actLoader.gotoAndStop(18);
                     break;
                  case 12:
                     actLoader.gotoAndStop(19);
                     break;
                  case 16:
                     actLoader.gotoAndStop(20);
                     thisFather.skillDealer.addSkill("s6mc","tarline",thisLoader.x + 50 * thisObj.scaleX,thisLoader.y - 350,this);
                     break;
                  case 20:
                     actLoader.gotoAndStop(21);
                     §§push(thisFather.skillDealer);
                     §§push("s6mc");
                     if(false)
                     {
                        return;
                     }
                     §§pop().addSkill(§§pop(),"tarline",thisLoader.x + 50 * thisObj.scaleX,thisLoader.y - 350,this);
                     break;
                  case 24:
                     actLoader.gotoAndStop(22);
                     thisFather.skillDealer.addSkill("s6mc","tarline",thisLoader.x + 50 * thisObj.scaleX,thisLoader.y - 350,this);
                     break;
                  case 28:
                     actLoader.gotoAndStop(23);
                     thisFather.skillDealer.addSkill("s6mc","tarline",thisLoader.x + 50 * thisObj.scaleX,thisLoader.y - 350,this);
                     break;
                  case 32:
                     actLoader.gotoAndStop(24);
                     thisFather.skillDealer.addSkill("s6mc","tarline",thisLoader.x + 50 * thisObj.scaleX,thisLoader.y - 350,this);
               }
               break;
            case "behit":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     §§push(actLoader);
                     §§push(9);
                     if(false)
                     {
                        return false;
                     }
                     §§pop().gotoAndStop(§§pop());
                     break;
               }
         }
      }
      
      override public function leftItem() : *
      {
         var _loc1_:* = undefined;
         if(thisItemNum > 1 && thisItemArr.length > 0)
         {
            _loc1_ = Math.floor(Math.random() * thisItemArr.length);
            thisFather.creatOneItem(thisItemArr[_loc1_],thisLoader.x,thisLoader.y);
            --thisItemNum;
         }
         else if(thisItemNum == 1 && thisSItemArr.length > 0)
         {
            _loc1_ = Math.floor(Math.random() * thisSItemArr.length);
            thisFather.creatOneItem(thisSItemArr[_loc1_],thisLoader.x,thisLoader.y);
            --thisItemNum;
         }
      }
      
      override public function dealCommond() : *
      {
         if(thisCurHp <= 0)
         {
            dead();
            return;
         }
         curTar = searchCurTar();
         if(curTar == null)
         {
            freeMove();
            return;
         }
         if(curTar.thisCurHp <= 0)
         {
            curTar = null;
            return;
         }
         if(thisLoader.x >= curTar.thisLoader.x)
         {
            dealScale(-1);
         }
         else
         {
            dealScale(1);
         }
         if(Math.abs(thisLoader.x - curTar.thisLoader.x) > searchObject.escapeX || Math.abs(thisLoader.y - curTar.thisLoader.y) > searchObject.escapeY)
         {
            curTar = null;
            if(false)
            {
               return false;
            }
         }
         else if(Math.abs(thisLoader.x - curTar.thisLoader.x) >= 400)
         {
            moveToTar(curTar);
         }
         else if(Math.abs(thisLoader.y - curTar.thisLoader.y) > 100)
         {
            attack2();
         }
         else if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 250)
         {
            attack2();
         }
         else
         {
            attack();
         }
      }
      
      private function initThis() : *
      {
         actLoader = new b6mc();
         thisAllHp = 10000;
         thisCurHp = 10000;
         thisAtt = 250;
         thisDef = 0;
         thisSpeed = 2;
         jumpSpeed = -3;
         thisExp = 10000;
         hitBlockTime = 8;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expb"];
         §§push(§§findproperty(thisSItemArr));
         §§push("s9");
         §§push("ws9");
         §§push("wd9");
         if(false)
         {
            return;
         }
         §§pop().thisSItemArr = null;
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -80;
            §§push(§§findproperty(beHitRight));
            §§push(80);
            if(false)
            {
               return;
            }
            §§pop().beHitRight = §§pop();
            beHitTop = -280;
            beHitBottom = -120;
            beHitFly = false;
         }
         §§push(searchObject);
         §§push(searchObject);
         if(false)
         {
            return;
         }
         var _loc2_:* = §§pop();
         with(§§pop())
         {
            searchX = 640;
            searchY = 480;
            escapeX = 640;
            escapeY = 480;
         }
         if(false)
         {
            return;
         }
      }
   }
}

§§push(§§findproperty(bigrole6));
§§push(§§newclass(bigrole6,allrole));
if(false)
{
   throw true;
}

