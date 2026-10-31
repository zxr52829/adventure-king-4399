package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole5 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole5(param1:fightMain, param2:int, param3:int)
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
            return false;
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
            actDealer.setCtrl("attack1","stop",20);
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
         switch(param1[0])
         {
            case "wait":
               _loc2_ = param1[1] % 16;
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(12);
                     break;
                  case 4:
                     actLoader.gotoAndStop(13);
                     break;
                  case 8:
                     actLoader.gotoAndStop(14);
                     break;
                  case 12:
                     actLoader.gotoAndStop(15);
               }
               break;
            case "walk":
               _loc2_ = param1[1] % 44;
               var _loc3_:* = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(1);
                     break;
                  case 4:
                     actLoader.gotoAndStop(2);
                     break;
                  case 8:
                     actLoader.gotoAndStop(3);
                     break;
                  case 12:
                     actLoader.gotoAndStop(4);
                     break;
                  case 16:
                     actLoader.gotoAndStop(5);
                     break;
                  case 20:
                     actLoader.gotoAndStop(6);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(19);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(24);
                     break;
                  case 2:
                     actLoader.gotoAndStop(25);
                     break;
                  case 5:
                     actLoader.gotoAndStop(26);
                     if(thisObj.scaleX == 1)
                     {
                        setHitObj(10,0,250,-250,20,thisAtt,1,30,-20,0);
                     }
                     else
                     {
                        setHitObj(10,-250,0,-250,20,thisAtt,1,30,-20,0);
                     }
                     break;
                  case 6:
                     §§push(actLoader);
                     if(false)
                     {
                        return false;
                     }
                     §§pop().gotoAndStop(27);
                     break;
                  case 7:
                     actLoader.gotoAndStop(28);
                     break;
                  case 8:
                     actLoader.gotoAndStop(29);
                     break;
                  case 9:
                     actLoader.gotoAndStop(30);
                     break;
                  case 10:
                     actLoader.gotoAndStop(31);
                     break;
                  case 11:
                     actLoader.gotoAndStop(32);
                     break;
                  case 12:
                     actLoader.gotoAndStop(33);
               }
               break;
            case "attack2":
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(38);
                     break;
                  case 3:
                     actLoader.gotoAndStop(39);
                     break;
                  case 10:
                     actLoader.gotoAndStop(40);
                     break;
                  case 12:
                     actLoader.gotoAndStop(41);
                     addSound("otherskill1");
                     if(thisObj.scaleX == 1)
                     {
                        setHitObj(15,0,400,-100,0,thisAtt,2,30,-20,0);
                     }
                     else
                     {
                        §§push(§§findproperty(setHitObj));
                        §§push(15);
                        §§push(-400);
                        §§push(0);
                        §§push(-100);
                        §§push(0);
                        §§push(thisAtt);
                        §§push(2);
                        §§push(30);
                        §§push(-20);
                        §§push(0);
                        if(false)
                        {
                           return;
                        }
                        §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop());
                     }
                     break;
                  case 14:
                     actLoader.gotoAndStop(42);
                     break;
                  case 16:
                     actLoader.gotoAndStop(43);
                     shake(20);
                     break;
                  case 18:
                     actLoader.gotoAndStop(44);
                     break;
                  case 20:
                     actLoader.gotoAndStop(45);
               }
               break;
            case "behit":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     if(false)
                     {
                        throw true;
                     }
                     actLoader.gotoAndStop(17);
                     break;
                  case 4:
                     actLoader.gotoAndStop(16);
               }
               break;
            case "dead":
               _loc2_ = int(param1[1]);
               if(false)
               {
                  return;
               }
               leftItem();
               switch(_loc2_)
               {
                  case 0:
                     leftExp();
                     actLoader.gotoAndStop(18);
                     break;
                  case 2:
                     actLoader.gotoAndStop(19);
                     break;
                  case 4:
                     actLoader.gotoAndStop(20);
                     break;
                  case 6:
                     actLoader.gotoAndStop(21);
                     break;
                  case 8:
                     actLoader.gotoAndStop(22);
                     break;
                  case 10:
                     actLoader.gotoAndStop(23);
                     break;
                  case 15:
                     delThis();
               }
               break;
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
            §§push(thisItemNum);
            §§push(1);
            if(false)
            {
               return;
            }
            if(§§pop() == §§pop() && thisSItemArr.length > 0)
            {
               §§push(Math);
               §§push(Math.random());
               §§push(thisSItemArr.length);
               if(false)
               {
                  return;
               }
               _loc1_ = §§pop().floor(§§pop() * §§pop());
               thisFather.creatOneItem(thisSItemArr[_loc1_],thisLoader.x,thisLoader.y);
               var _loc2_:* = §§findproperty(thisItemNum);
               §§push(_loc2_);
               if(false)
               {
                  return;
               }
               var _loc3_:* = §§pop().thisItemNum - 1;
               _loc2_.thisItemNum = _loc3_;
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
         else if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 300 || thisLoader.y - curTar.thisLoader.y > 160 || thisLoader.y - curTar.thisLoader.y < 0)
         {
            moveToTar(curTar);
         }
         else
         {
            §§push(Math);
            §§push(thisLoader.x);
            if(false)
            {
               return;
            }
            if(§§pop().abs(§§pop() - curTar.thisLoader.x) < 200)
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
               else
               {
                  moveToTar(curTar);
               }
            }
         }
      }
      
      private function initThis() : *
      {
         actLoader = new b5mc();
         thisAllHp = 5000;
         thisCurHp = 5000;
         thisAtt = 200;
         thisDef = 30;
         thisSpeed = 4;
         jumpSpeed = -35;
         thisExp = 4000;
         hitBlockTime = 8;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expb"];
         thisSItemArr = ["s7","ws7","wd7","d7"];
         thisItemNum = 10;
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -70;
            beHitRight = 70;
            beHitTop = -150;
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

