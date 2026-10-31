package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole2 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole2(param1:fightMain, param2:int, param3:int)
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
            §§push(actDealer);
            §§push("attack1");
            §§push("stop");
            if(false)
            {
               return;
            }
            §§pop().setCtrl(§§pop(),§§pop(),20);
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
               actDealer.setCtrl("attack2","stop",40);
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
                     actLoader.gotoAndStop(7);
                     break;
                  case 12:
                     actLoader.gotoAndStop(8);
               }
               break;
            case "walk":
               _loc2_ = param1[1] % 16;
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(1);
                     break;
                  case 4:
                     actLoader.gotoAndStop(2);
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
            §§push(§§findproperty(thisItemNum));
            §§push(§§findproperty(thisItemNum));
            if(false)
            {
               return;
            }
            var _loc2_:* = §§pop();
            var _loc3_:* = §§pop().thisItemNum - 1;
            _loc2_.thisItemNum = _loc3_;
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
         if(thisLoader.x >= curTar.thisLoader.x)
         {
            dealScale(-1);
         }
         else
         {
            dealScale(1);
         }
         §§push(Math.abs(thisLoader.x - curTar.thisLoader.x) > searchObject.escapeX);
         if(!(Math.abs(thisLoader.x - curTar.thisLoader.x) > searchObject.escapeX))
         {
            §§pop();
            §§push(Math.abs(thisLoader.y - curTar.thisLoader.y));
            §§push(searchObject.escapeY);
            if(false)
            {
               return;
            }
            §§push(§§pop() > §§pop());
         }
         if(§§pop())
         {
            curTar = null;
         }
         else if(Math.abs(thisLoader.x - curTar.thisLoader.x) >= 400)
         {
            moveToTar(curTar);
         }
         else if(Math.abs(thisLoader.y - curTar.thisLoader.y) > 40)
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
         else if(Math.abs(thisLoader.x - curTar.thisLoader.x) <= 300)
         {
            if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 120)
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
            else
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
         }
         else
         {
            moveToTar(curTar);
         }
      }
      
      private function initThis() : *
      {
         actLoader = new b2mc();
         thisAllHp = 2000;
         thisCurHp = 2000;
         thisAtt = 60;
         thisDef = 10;
         thisSpeed = 4;
         jumpSpeed = -30;
         thisExp = 500;
         hitBlockTime = 8;
         if(false)
         {
            return false;
         }
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expm","expb"];
         §§push(§§findproperty(thisSItemArr));
         §§push("s3");
         §§push("ws3");
         §§push("wd3");
         if(false)
         {
            return;
         }
         §§pop().thisSItemArr = null;
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -25;
            beHitRight = 25;
            beHitTop = -70;
            beHitBottom = -10;
            beHitFly = true;
         }
         with(searchObject)
         {
            searchX = 600;
            searchY = 400;
            escapeX = 640;
            escapeY = 400;
         }
      }
   }
}

§§push(§§findproperty(bigrole2));
§§push(allrole);
if(false)
{
   return;
}

