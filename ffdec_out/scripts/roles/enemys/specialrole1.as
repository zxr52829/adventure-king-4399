package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class specialrole1 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function specialrole1(param1:fightMain, param2:int, param3:int)
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
            actDealer.setCtrl("attack1","stop",15);
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(actDealer.setCtrl("attack2","stop",30))
            {
               nowSpeedX = 0;
            }
         }
      }
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:int = 0;
         switch(param1[0])
         {
            case "wait":
            case "walk":
               _loc2_ = param1[1] % 24;
               switch(_loc2_)
               {
                  case 0:
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
                     actLoader.gotoAndStop(5);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(17);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(16);
                     break;
                  case 5:
                     actLoader.gotoAndStop(17);
                     thisFather.skillDealer.addSkill("p1mc","line",thisLoader.x,thisLoader.y - 20,this);
               }
               break;
            case "attack2":
               _loc2_ = int(param1[1]);
               var _loc3_:* = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(16);
                     break;
                  case 2:
                     actLoader.gotoAndStop(17);
                     break;
                  case 4:
                     if(false)
                     {
                        return;
                     }
                     actLoader.gotoAndStop(18);
                     break;
                  case 6:
                     actLoader.gotoAndStop(19);
                     break;
                  case 8:
                     actLoader.gotoAndStop(20);
                     break;
                  case 10:
                     actLoader.gotoAndStop(21);
                     addSound("otherskill1");
                     if(thisObj.scaleX != 1)
                     {
                        §§push(§§findproperty(setHitObj));
                        §§push(10);
                        §§push(-250);
                        §§push(0);
                        §§push(-100);
                        §§push(-20);
                        §§push(thisAtt);
                        §§push(2.5);
                        if(false)
                        {
                           return false;
                        }
                        §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),10,-20,0);
                     }
                     else
                     {
                        §§push(§§findproperty(setHitObj));
                        §§push(10);
                        §§push(0);
                        §§push(250);
                        §§push(-100);
                        if(false)
                        {
                           return;
                        }
                        §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),-20,thisAtt,2.5,10,-20,0);
                     }
                     break;
                  case 12:
                     actLoader.gotoAndStop(22);
               }
               break;
            case "behit":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(7);
                     break;
                  case 4:
                     actLoader.gotoAndStop(8);
               }
               break;
            case "dead":
               _loc2_ = int(param1[1]);
               leftPet();
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(9);
                     break;
                  case 2:
                     actLoader.gotoAndStop(10);
                     break;
                  case 4:
                     actLoader.gotoAndStop(11);
                     break;
                  case 6:
                     actLoader.gotoAndStop(12);
                     break;
                  case 8:
                     §§push(actLoader);
                     if(false)
                     {
                        return;
                     }
                     §§pop().gotoAndStop(13);
                     break;
               }
         }
      }
      
      private function leftPet() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = {
            "pName":"p1_1",
            "pLv":1,
            "pExp":0,
            "pk":"1"
         };
         §§push(thisFather.mainActor1);
         if(false)
         {
            return;
         }
         §§pop().checkNewPet(_loc1_);
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
         if(false)
         {
            throw true;
         }
         if(§§pop() >= curTar.thisLoader.x)
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
            §§push(Math.abs(thisLoader.x - curTar.thisLoader.x));
            §§push(250);
            if(false)
            {
               return false;
            }
            if(§§pop() > §§pop() || Math.abs(thisLoader.y - curTar.thisLoader.y) > 30)
            {
               moveToTar(curTar);
            }
            else if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 100)
            {
               attack();
            }
            else
            {
               §§push(Math.random());
               if(false)
               {
                  return;
               }
               _loc1_ = §§pop();
               if(_loc1_ < 0.2 && thisLoader.y - curTar.thisLoader.y > -40)
               {
                  attack2();
               }
               else
               {
                  attack();
               }
            }
         }
      }
      
      private function initThis() : *
      {
         actLoader = new pet1_2mc();
         thisAllHp = 400;
         thisCurHp = 400;
         thisAtt = 60;
         thisDef = 0;
         thisSpeed = 5;
         jumpSpeed = -35;
         thisExp = 0;
         hitBlockTime = 8;
         §§push(§§findproperty(jumpTop));
         if(false)
         {
            throw true;
         }
         §§pop().jumpTop = getJumpTop(jumpSpeed);
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -20;
            beHitRight = 20;
            beHitTop = -70;
            beHitBottom = -10;
            beHitFly = true;
         }
         with(searchObject)
         {
            §§push(§§findproperty(searchX));
            §§push(600);
            if(false)
            {
               return;
            }
            §§pop().searchX = §§pop();
            searchY = 400;
            escapeX = 640;
            escapeY = 400;
         }
      }
   }
}

