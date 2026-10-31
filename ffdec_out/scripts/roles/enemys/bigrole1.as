package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole1 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole1(param1:fightMain, param2:int, param3:int)
      {
         super();
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         if(false)
         {
            return;
         }
         thisLoader.x = param2;
         thisLoader.y = param3;
         thisFather = param1;
         initThis();
         thisObj.addChild(actLoader);
         if(false)
         {
            return;
         }
         thisFather.enemyRoleLoader.addChild(thisLoader);
         initMySb();
         tarArray = thisFather.teamArr;
      }
      
      override public function initMySb() : *
      {
         thisStateBoard = new otherBoard();
         thisLoader.addChild(thisStateBoard);
         thisStateBoard.x = -20;
         thisStateBoard.y = -180;
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
            §§push(actDealer);
            §§push("attack1");
            §§push("stop");
            §§push(30);
            if(false)
            {
               return;
            }
            §§pop().setCtrl(§§pop(),§§pop(),§§pop());
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
               §§push(actDealer);
               §§push("attack2");
               if(false)
               {
                  return;
               }
               §§pop().setCtrl(§§pop(),"stop",50);
            }
         }
      }
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:int = 0;
         switch(param1[0])
         {
            case "wait":
               _loc2_ = param1[1] % 12;
               var _loc3_:* = _loc2_;
               if(false)
               {
                  return;
               }
               switch(_loc3_)
               {
                  case 0:
                     actLoader.gotoAndStop(1);
                     break;
                  case 4:
                     actLoader.gotoAndStop(2);
                     break;
                  case 8:
                     actLoader.gotoAndStop(3);
               }
               break;
            case "walk":
               _loc2_ = param1[1] % 20;
               switch(_loc2_)
               {
                  case 0:
                     §§push(actLoader);
                     if(false)
                     {
                        return;
                     }
                     §§pop().gotoAndStop(4);
                     break;
                  case 4:
                     actLoader.gotoAndStop(5);
                     break;
                  case 8:
                     actLoader.gotoAndStop(6);
                     break;
                  case 12:
                     actLoader.gotoAndStop(7);
                     break;
                  case 16:
                     actLoader.gotoAndStop(8);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(8);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(9);
                     break;
                  case 4:
                     actLoader.gotoAndStop(10);
                     break;
                  case 8:
                     actLoader.gotoAndStop(11);
                     if(thisObj.scaleX == 1)
                     {
                        setHitObj(3,0,250,-250,20,thisAtt,1,3,-10,0);
                     }
                     else
                     {
                        setHitObj(3,-250,0,-250,20,thisAtt,1,3,-10,0);
                     }
                     break;
                  case 12:
                     actLoader.gotoAndStop(12);
                     break;
                  case 16:
                     actLoader.gotoAndStop(13);
               }
               break;
            case "attack2":
               if(false)
               {
                  return;
               }
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(14);
                     break;
                  case 3:
                     actLoader.gotoAndStop(15);
                     break;
                  case 6:
                     actLoader.gotoAndStop(16);
               }
               break;
            case "behit":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(22);
                     break;
                  case 4:
                     actLoader.gotoAndStop(23);
               }
               break;
            case "dead":
               _loc2_ = int(param1[1]);
               leftItem();
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     leftExp();
                     actLoader.gotoAndStop(24);
                     break;
                  case 2:
                     actLoader.gotoAndStop(25);
                     break;
                  case 4:
                     actLoader.gotoAndStop(26);
                     break;
                  case 6:
                     if(false)
                     {
                        return;
                     }
                     actLoader.gotoAndStop(27);
                     break;
                  case 8:
                     actLoader.gotoAndStop(28);
                     break;
                  case 10:
                     actLoader.gotoAndStop(29);
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
            if(false)
            {
               return;
            }
            --thisItemNum;
         }
         else
         {
            §§push(thisItemNum == 1);
            if(thisItemNum == 1)
            {
               §§pop();
               if(false)
               {
                  return;
               }
               §§push(thisSItemArr.length > 0);
            }
            if(§§pop())
            {
               _loc1_ = Math.floor(Math.random() * thisSItemArr.length);
               §§push(thisFather);
               if(false)
               {
                  return false;
               }
               §§pop().creatOneItem(thisSItemArr[_loc1_],thisLoader.x,thisLoader.y);
               --thisItemNum;
            }
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
         }
         else if(Math.abs(thisLoader.x - curTar.thisLoader.x) >= 400)
         {
            moveToTar(curTar);
         }
         else
         {
            §§push(Math.abs(thisLoader.x - curTar.thisLoader.x) >= 200 && thisLoader.y - curTar.thisLoader.y >= 0);
            if(Math.abs(thisLoader.x - curTar.thisLoader.x) >= 200 && thisLoader.y - curTar.thisLoader.y >= 0)
            {
               §§pop();
               §§push(thisLoader.y);
               if(false)
               {
                  throw true;
               }
               §§push(§§pop() - curTar.thisLoader.y <= 100);
            }
            if(!§§pop())
            {
               if(Math.abs(thisLoader.x - curTar.thisLoader.x) < 200 && thisLoader.y - curTar.thisLoader.y > 100)
               {
                  attack();
               }
               else
               {
                  §§push(Math);
                  §§push(thisLoader.x);
                  §§push(curTar);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop().abs(§§pop() - §§pop().thisLoader.x) < 200 && thisLoader.y - curTar.thisLoader.y >= 0 && thisLoader.y - curTar.thisLoader.y < 100)
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
                     moveToTar(curTar);
                  }
               }
            }
            else
            {
               _loc1_ = Math.random();
               if(_loc1_ < 0.1)
               {
                  attack2();
               }
               else
               {
                  moveToTar(curTar);
               }
            }
         }
      }
      
      private function initThis() : *
      {
         actLoader = new b1mc();
         thisAllHp = 1500;
         thisCurHp = 1500;
         thisAtt = 50;
         thisDef = 0;
         thisSpeed = 3;
         jumpSpeed = -3;
         thisExp = 200;
         hitBlockTime = 8;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expm"];
         §§push(§§findproperty(thisSItemArr));
         §§push("s2");
         §§push("ws2");
         §§push("wd2");
         §§push("d2");
         if(false)
         {
            return;
         }
         §§pop().thisSItemArr = null;
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -70;
            beHitRight = 70;
            if(false)
            {
               return;
            }
            beHitTop = -150;
            beHitBottom = -10;
            beHitFly = true;
         }
         with(searchObject)
         {
            if(false)
            {
               return;
            }
            searchX = 600;
            searchY = 400;
            escapeX = 640;
            escapeY = 400;
         }
      }
   }
}

§§push(§§findproperty(bigrole1));
§§push(MovieClip);
if(false)
{
   return;
}

