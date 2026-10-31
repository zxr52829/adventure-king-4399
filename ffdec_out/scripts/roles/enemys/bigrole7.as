package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole7 extends allrole
   {
      private var shadowNum:int = 3;
      
      public var actLoader:MovieClip;
      
      public function bigrole7(param1:fightMain, param2:int, param3:int)
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
      
      override public function initMySb() : *
      {
         thisStateBoard = new otherBoard();
         thisLoader.addChild(thisStateBoard);
         thisStateBoard.x = -20;
         thisStateBoard.y = -80;
         changState(0,"hp");
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
            actDealer.setCtrl("attack1","stop",12);
         }
      }
      
      private function fastMove() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(actDealer.setCtrl("fastmove","stop",15))
            {
               nowSpeedX = 30 * thisObj.scaleX;
               beHitObject.noHitTimer = 15;
            }
         }
      }
      
      private function attack3() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            actDealer.setCtrl("attack3","stop",15);
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedY = -30;
               curSite = "fly";
               actDealer.setCtrl("attack2","stop",35);
            }
         }
      }
      
      private function callShadow() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            §§push(shadowNum >= 3 && thisCurHp / thisAllHp < 0.75 || shadowNum >= 2 && thisCurHp / thisAllHp < 0.5);
            §§push(shadowNum >= 3 && thisCurHp / thisAllHp < 0.75 || shadowNum >= 2 && thisCurHp / thisAllHp < 0.5);
            if(false)
            {
               return;
            }
            if(!§§pop())
            {
               §§pop();
               §§push(shadowNum >= 1 && thisCurHp / thisAllHp < 0.25);
            }
            if(§§pop())
            {
               §§push(actDealer);
               if(false)
               {
                  return;
               }
               if(§§pop().setCtrl("call","stop",10))
               {
                  nowSpeedX = 0;
                  beHitObject.noHitTimer = 10;
                  --shadowNum;
               }
            }
         }
      }
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:* = 0;
         var _loc3_:* = param1[0];
         §§push("wait" === _loc3_ ? 0 : ("run" === _loc3_ ? 1 : ("walk" === _loc3_ ? 2 : ("jump" === _loc3_ ? 3 : ("attack1" === _loc3_ ? 4 : ("attack2" === _loc3_ ? 5 : ("attack3" === _loc3_ ? 6 : ("behit" === _loc3_ ? 7 : ("dead" !== _loc3_ ? ("call" === _loc3_ ? 9 : ("fastmove" === _loc3_ ? 10 : 11)) : 8)))))))));
         if(false)
         {
            return;
         }
         switch(§§pop())
         {
            case 0:
            case 1:
               _loc2_ = param1[1] % 8;
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     §§push(actLoader);
                     §§push(1);
                     if(false)
                     {
                        return;
                     }
                     §§pop().gotoAndStop(§§pop());
                     break;
                  case 2:
                     actLoader.gotoAndStop(2);
               }
               break;
            case 2:
               _loc2_ = param1[1] % 16;
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(5);
                     break;
                  case 4:
                     actLoader.gotoAndStop(6);
                     break;
                  case 8:
                     §§push(actLoader);
                     if(false)
                     {
                        return;
                     }
                     §§pop().gotoAndStop(7);
                     break;
                  case 12:
                     actLoader.gotoAndStop(8);
               }
               break;
            case 3:
               actLoader.gotoAndStop(36);
               break;
            case 4:
               §§push(int(param1[1]));
               if(false)
               {
                  throw true;
               }
               _loc2_ = §§pop();
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(21);
                     break;
                  case 1:
                     actLoader.gotoAndStop(22);
                     break;
                  case 2:
                     actLoader.gotoAndStop(23);
                     break;
                  case 3:
                     actLoader.gotoAndStop(24);
                     if(thisObj.scaleX == 1)
                     {
                        setHitObj(5,0,150,-100,-10,thisAtt,1,3,-10,0);
                     }
                     else
                     {
                        setHitObj(5,-150,0,-100,-10,thisAtt,1,3,-10,0);
                     }
               }
               break;
            case 5:
               _loc2_ = int(param1[1]);
               if(_loc2_ >= 12 && _loc2_ <= 25)
               {
                  §§push(§§findproperty(nowSpeedX));
                  §§push(20);
                  §§push(thisObj);
                  if(false)
                  {
                     return;
                  }
                  §§pop().nowSpeedX = §§pop() * §§pop().scaleX;
                  if(thisObj.scaleX != 1)
                  {
                     setHitObj(1,-180,0,-100,50,thisAtt,2,3,-10,0);
                  }
                  else
                  {
                     §§push(§§findproperty(setHitObj));
                     §§push(1);
                     §§push(0);
                     §§push(180);
                     §§push(-100);
                     §§push(50);
                     §§push(thisAtt);
                     §§push(2);
                     §§push(3);
                     §§push(-10);
                     §§push(0);
                     if(false)
                     {
                        return;
                     }
                     §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop());
                  }
               }
               else
               {
                  §§push(_loc2_);
                  §§push(25);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop() > §§pop())
                  {
                     nowSpeedX = -10 * thisObj.scaleX;
                     nowSpeedY = -20;
                     curSite = "fly";
                     setHitObj(1,-30,30,-100,-10,thisAtt,1,3,-10,0);
                  }
               }
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(33);
                     break;
                  case 1:
                     actLoader.gotoAndStop(34);
                     break;
                  case 3:
                     actLoader.gotoAndStop(35);
                     break;
                  case 5:
                     actLoader.gotoAndStop(36);
               }
               break;
            case 6:
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(29);
                     break;
                  case 5:
                     actLoader.gotoAndStop(35);
                     thisFather.skillDealer.addSkill("s8mc","tar",thisLoader.x - 50,thisLoader.y,this);
                     §§push(thisCurHp / thisAllHp);
                     if(false)
                     {
                        return;
                     }
                     if(§§pop() < 0.2)
                     {
                        thisFather.skillDealer.addSkill("s8mc","tar",thisLoader.x - 50,thisLoader.y,this);
                        §§push(thisFather);
                        if(false)
                        {
                           return;
                        }
                        §§pop().skillDealer.addSkill("s8mc","tar",thisLoader.x - 50,thisLoader.y,this);
                     }
                     break;
               }
               break;
            case 7:
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(9);
                     break;
                  case 4:
                     actLoader.gotoAndStop(10);
                     break;
                  default:
                     if(false)
                     {
                        throw true;
                     }
                     break;
               }
               break;
            case 8:
               _loc2_ = int(param1[1]);
               leftItem();
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
               }
               leftExp();
               §§push(actLoader);
               if(false)
               {
                  return;
               }
               §§pop().gotoAndStop(11);
               break;
            case 9:
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(43);
                     setHitObj(8,-100,100,-180,0,thisAtt,1,3,-10,0);
                     break;
                  case 2:
                     §§push(actLoader);
                     §§push(44);
                     if(false)
                     {
                        throw true;
                     }
                     §§pop().gotoAndStop(§§pop());
                     thisFather.creatOneEnemy("b7_1",thisLoader.x,thisLoader.y,this);
                     break;
                  case 4:
                     actLoader.gotoAndStop(45);
                     thisFather.creatOneEnemy("b7_1",thisLoader.x,thisLoader.y,this);
                     break;
                  case 6:
                     actLoader.gotoAndStop(46);
                     thisFather.creatOneEnemy("b7_1",thisLoader.x,thisLoader.y,this);
               }
               break;
            case 10:
               dealOnfloor = false;
               if(param1[1] == 0)
               {
                  thisFather.lightDealer.addLight("lsmove",thisLoader.x,thisLoader.y,thisObj.scaleX);
                  thisObj.alpha = 0;
               }
               else
               {
                  §§push(param1[1]);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop() == 14)
                  {
                     thisFather.lightDealer.addLight("lsmove",thisLoader.x,thisLoader.y,thisObj.scaleX);
                     thisObj.alpha = 1;
                  }
               }
         }
      }
      
      override public function leftItem() : *
      {
         var _loc1_:* = undefined;
         if(thisItemNum > 1 && thisItemArr.length > 0)
         {
            §§push(Math);
            if(false)
            {
               return false;
            }
            _loc1_ = §§pop().floor(Math.random() * thisItemArr.length);
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
         var _loc1_:* = undefined;
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
         §§push(thisLoader.x);
         §§push(curTar.thisLoader);
         if(false)
         {
            throw true;
         }
         if(§§pop() >= §§pop().x)
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
         }
         else
         {
            callShadow();
            §§push(curTar.beHitObject);
            if(false)
            {
               return false;
            }
            §§push(§§pop().noHitTimer > 0);
            if(§§pop().noHitTimer > 0)
            {
               §§pop();
               §§push(Math.abs(thisLoader.x - curTar.thisLoader.x));
               §§push(200);
               if(false)
               {
                  return false;
               }
               §§push(§§pop() < §§pop());
            }
            if(§§pop() && Math.abs(thisLoader.y - curTar.thisLoader.y) < 100)
            {
               fastMove();
            }
            else if(Math.abs(thisLoader.x - curTar.thisLoader.x) < 400)
            {
               §§push(Math);
               §§push(thisLoader);
               if(false)
               {
                  return;
               }
               if(§§pop().abs(§§pop().y - curTar.thisLoader.y) > 40)
               {
                  _loc1_ = Math.random();
                  §§push(_loc1_);
                  §§push(0.1);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop() < §§pop())
                  {
                     attack2();
                  }
                  else if(_loc1_ < 0.2)
                  {
                     attack3();
                  }
                  else
                  {
                     moveToTar(curTar);
                  }
               }
               else
               {
                  §§push(Math);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop().abs(thisLoader.x - curTar.thisLoader.x) > 300)
                  {
                     moveToTar(curTar);
                  }
                  else if(Math.abs(thisLoader.x - curTar.thisLoader.x) <= 120)
                  {
                     _loc1_ = Math.random();
                     if(_loc1_ < 0.1)
                     {
                        attack2();
                     }
                     else
                     {
                        attack();
                     }
                  }
                  else
                  {
                     _loc1_ = Math.random();
                     if(_loc1_ < 0.1)
                     {
                        attack2();
                     }
                     else if(_loc1_ < 0.2)
                     {
                        attack3();
                     }
                     else
                     {
                        moveToTar(curTar);
                     }
                  }
               }
            }
            else
            {
               moveToTar(curTar);
            }
         }
      }
      
      private function initThis() : *
      {
         actLoader = new b7mc();
         thisAllHp = 5000;
         thisCurHp = 5000;
         §§push(§§findproperty(thisAtt));
         §§push(200);
         if(false)
         {
            return;
         }
         §§pop().thisAtt = §§pop();
         thisDef = 60;
         thisSpeed = 10;
         jumpSpeed = -40;
         thisExp = 20000;
         hitBlockTime = 5;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expb"];
         thisSItemArr = ["s10","ws10","wd10","d10"];
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -15;
            beHitRight = 15;
            if(false)
            {
               return;
            }
            beHitTop = -70;
            beHitBottom = -10;
            beHitFly = true;
         }
         var _loc2_:Object = searchObject;
         §§push(_loc2_);
         if(false)
         {
            return;
         }
         with(§§pop())
         {
            searchX = 600;
            searchY = 400;
            escapeX = 640;
            escapeY = 400;
         }
         if(false)
         {
            return false;
         }
      }
   }
}

