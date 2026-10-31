package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole4 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole4(param1:fightMain, param2:int, param3:int)
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
         §§push(thisFather.enemyRoleLoader);
         §§push(thisLoader);
         if(false)
         {
            return;
         }
         §§pop().addChild(§§pop());
         initMySb();
         tarArray = thisFather.teamArr;
      }
      
      override public function initMySb() : *
      {
         thisStateBoard = new otherBoard();
         thisLoader.addChild(thisStateBoard);
         thisStateBoard.x = -20;
         thisStateBoard.y = -100;
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
            actDealer.setCtrl("attack1","stop",10);
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
               actDealer.setCtrl("attack2","stop",70);
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
         }
         _loc2_ = param1[1] % 28;
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
               §§push(actLoader);
               if(false)
               {
                  return;
               }
               §§pop().gotoAndStop(8);
               break;
            case 16:
               actLoader.gotoAndStop(9);
               break;
            case 20:
               actLoader.gotoAndStop(10);
               break;
            case 24:
               actLoader.gotoAndStop(11);
               break;
            case 28:
               actLoader.gotoAndStop(12);
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
            §§push(thisFather);
            if(false)
            {
               return;
            }
            §§pop().creatOneItem(thisSItemArr[_loc1_],thisLoader.x,thisLoader.y);
            var _loc2_:* = §§findproperty(thisItemNum);
            var _loc3_:* = _loc2_.thisItemNum - 1;
            §§push(_loc2_);
            if(false)
            {
               return;
            }
            §§pop().thisItemNum = _loc3_;
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
            if(false)
            {
               return false;
            }
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
            if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 180)
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
         actLoader = new b4mc();
         thisAllHp = 5000;
         thisCurHp = 5000;
         thisAtt = 110;
         thisDef = 30;
         thisSpeed = 2;
         jumpSpeed = -30;
         thisExp = 2500;
         hitBlockTime = 8;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expm","expb"];
         thisSItemArr = ["s6","ws6","wd6","d6"];
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -40;
            beHitRight = 40;
            beHitTop = -100;
            beHitBottom = 0;
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

