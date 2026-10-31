package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole7_1 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole7_1(param1:fightMain, param2:int, param3:int, param4:allrole)
      {
         super();
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         thisLoader.x = param2;
         §§push(thisLoader);
         if(false)
         {
            return;
         }
         §§pop().y = param3;
         thisFather = param1;
         myMaster = param4;
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
            if(false)
            {
               return;
            }
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
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:int = 0;
         switch(param1[0])
         {
            case "wait":
            case "run":
               _loc2_ = param1[1] % 8;
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(1);
                     break;
                  case 2:
                     actLoader.gotoAndStop(2);
                     break;
                  case 4:
                     actLoader.gotoAndStop(3);
                     break;
                  case 6:
                     actLoader.gotoAndStop(4);
               }
               break;
            case "walk":
               _loc2_ = param1[1] % 16;
               var _loc3_:* = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(5);
                     break;
                  case 4:
                     actLoader.gotoAndStop(6);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(36);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
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
                     break;
                  case 4:
                     actLoader.gotoAndStop(25);
                     break;
                  case 5:
                     actLoader.gotoAndStop(26);
                     break;
                  case 6:
                     actLoader.gotoAndStop(27);
               }
               break;
            case "attack2":
               _loc2_ = int(param1[1]);
               if(_loc2_ >= 12 && _loc2_ <= 25)
               {
                  nowSpeedX = 20 * thisObj.scaleX;
                  if(thisObj.scaleX == 1)
                  {
                     setHitObj(1,0,180,-100,50,thisAtt,1,3,-10,0);
                  }
                  else
                  {
                     setHitObj(1,-180,0,-100,50,thisAtt,1,3,-10,0);
                  }
               }
               else if(_loc2_ > 25)
               {
                  nowSpeedX = -10 * thisObj.scaleX;
                  nowSpeedY = -20;
                  curSite = "fly";
                  setHitObj(1,-30,30,-100,-10,thisAtt,1,3,-10,0);
               }
               switch(_loc2_)
               {
                  case 0:
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
                     break;
                  case 10:
                     actLoader.gotoAndStop(37);
                     break;
                  case 12:
                     actLoader.gotoAndStop(38);
                     break;
                  case 25:
                     actLoader.gotoAndStop(39);
                     break;
                  case 27:
                     actLoader.gotoAndStop(40);
                     break;
                  case 30:
                     actLoader.gotoAndStop(41);
                     break;
                  case 33:
                     actLoader.gotoAndStop(42);
               }
               break;
            case "behit":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     §§push(actLoader);
                     if(false)
                     {
                        return false;
                     }
                     §§pop().gotoAndStop(9);
                     break;
                  case 4:
                     actLoader.gotoAndStop(10);
               }
               break;
            case "dead":
               §§push(param1);
               §§push(1);
               if(false)
               {
                  return;
               }
               _loc2_ = int(§§pop()[§§pop()]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(43);
                     §§push(§§findproperty(setHitObj));
                     §§push(8);
                     §§push(-100);
                     §§push(100);
                     §§push(-180);
                     §§push(0);
                     §§push(thisAtt);
                     §§push(2);
                     if(false)
                     {
                        throw true;
                     }
                     §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),3,-10,0);
                     break;
                  case 2:
                     actLoader.gotoAndStop(44);
                     break;
                  case 4:
                     actLoader.gotoAndStop(45);
                     break;
                  case 6:
                     actLoader.gotoAndStop(46);
                     break;
                  case 10:
                     delThis();
               }
               break;
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
         if(myMaster.thisCurHp <= 0)
         {
            thisCurHp = 0;
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
         actLoader = new b7mc();
         thisAllHp = 2000;
         thisCurHp = 2000;
         if(false)
         {
            return;
         }
         thisAtt = 160;
         thisDef = 0;
         thisSpeed = 10;
         jumpSpeed = -40;
         thisExp = 0;
         hitBlockTime = 5;
         if(false)
         {
            return false;
         }
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expm","expb"];
         thisSItemArr = ["s3","ws3","wd3","d3"];
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -15;
            beHitRight = 15;
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

