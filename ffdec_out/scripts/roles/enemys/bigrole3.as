package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class bigrole3 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function bigrole3(param1:fightMain, param2:int, param3:int)
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
         if(false)
         {
            return;
         }
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
            actDealer.setCtrl("attack1","stop",12);
         }
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
               actDealer.setCtrl("attack2","stop",45);
            }
         }
      }
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1[0];
         §§push("wait");
         §§push(_loc3_);
         if(false)
         {
            return;
         }
         switch(§§pop() === §§pop() ? 0 : ("walk" === _loc3_ ? 1 : ("jump" === _loc3_ ? 2 : ("attack1" === _loc3_ ? 3 : ("attack2" === _loc3_ ? 4 : ("behit" === _loc3_ ? 5 : ("dead" === _loc3_ ? 6 : 7)))))))
         {
            case 0:
               _loc2_ = param1[1] % 56;
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(7);
                     break;
                  case 4:
                     actLoader.gotoAndStop(8);
                     break;
                  case 8:
                     actLoader.gotoAndStop(9);
                     break;
                  case 12:
                     actLoader.gotoAndStop(10);
               }
               break;
            case 1:
               _loc2_ = param1[1] % 24;
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
            case 2:
               actLoader.gotoAndStop(8);
               break;
            case 3:
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(30);
                     break;
                  case 2:
                     actLoader.gotoAndStop(31);
                     break;
                  case 4:
                     actLoader.gotoAndStop(32);
                     if(thisObj.scaleX == 1)
                     {
                        setHitObj(5,0,250,-200,20,thisAtt,1,3,-10,0);
                     }
                     else
                     {
                        §§push(§§findproperty(setHitObj));
                        if(false)
                        {
                           return;
                        }
                        §§pop().setHitObj(5,-250,0,-200,20,thisAtt,1,3,-10,0);
                     }
                     break;
                  case 6:
                     actLoader.gotoAndStop(33);
                     break;
                  case 8:
                     actLoader.gotoAndStop(34);
                     break;
                  case 10:
                     actLoader.gotoAndStop(35);
               }
               break;
            case 4:
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               if(0 === _loc3_)
               {
                  §§push(0);
               }
               else if(3 !== _loc3_)
               {
                  if(6 === _loc3_)
                  {
                     §§push(2);
                  }
                  else if(9 === _loc3_)
                  {
                     §§push(3);
                  }
                  else
                  {
                     §§push(12);
                     if(false)
                     {
                        throw true;
                     }
                     if(§§pop() === _loc3_)
                     {
                        §§push(4);
                     }
                     else if(15 === _loc3_)
                     {
                        §§push(5);
                     }
                     else if(18 === _loc3_)
                     {
                        §§push(6);
                     }
                     else if(21 === _loc3_)
                     {
                        §§push(7);
                     }
                     else if(24 === _loc3_)
                     {
                        §§push(8);
                     }
                     else if(27 === _loc3_)
                     {
                        §§push(9);
                        if(false)
                        {
                           return;
                        }
                     }
                     else if(30 === _loc3_)
                     {
                        §§push(10);
                     }
                     else if(33 === _loc3_)
                     {
                        §§push(11);
                     }
                     else if(36 === _loc3_)
                     {
                        §§push(12);
                     }
                     else
                     {
                        §§push(39);
                        if(false)
                        {
                           return;
                        }
                        §§push(§§pop() !== _loc3_ ? (42 === _loc3_ ? 14 : 15) : 13);
                     }
                  }
               }
               else
               {
                  §§push(1);
               }
               if(false)
               {
                  return;
               }
               switch(§§pop())
               {
                  case 0:
                     actLoader.gotoAndStop(36);
                     break;
                  case 1:
                     actLoader.gotoAndStop(37);
                     break;
                  case 2:
                     actLoader.gotoAndStop(38);
                     break;
                  case 3:
                     actLoader.gotoAndStop(39);
                     break;
                  case 4:
                     actLoader.gotoAndStop(40);
                     break;
                  case 5:
                     actLoader.gotoAndStop(41);
                     break;
                  case 6:
                     actLoader.gotoAndStop(42);
                     break;
                  case 7:
                     actLoader.gotoAndStop(43);
                     break;
                  case 8:
                     §§push(actLoader);
                     if(false)
                     {
                        return;
                     }
                     §§pop().gotoAndStop(44);
                     if(curTar != null)
                     {
                        §§push(thisFather.skillDealer);
                        §§push("s3mc");
                        §§push("tarlocal");
                        §§push(curTar.thisLoader.x);
                        §§push(curTar.thisLoader.y);
                        if(false)
                        {
                           return;
                        }
                        §§pop().addSkill(§§pop(),§§pop(),§§pop(),§§pop(),this);
                     }
                     break;
                  case 9:
                     actLoader.gotoAndStop(45);
                     break;
                  case 10:
                     actLoader.gotoAndStop(46);
                     §§push(curTar);
                     §§push(null);
                     if(false)
                     {
                        return;
                     }
                     if(§§pop() != §§pop())
                     {
                        thisFather.skillDealer.addSkill("s3mc","tarlocal",curTar.thisLoader.x,curTar.thisLoader.y,this);
                     }
                     break;
                  case 11:
                     actLoader.gotoAndStop(47);
                     if(false)
                     {
                        return;
                     }
                     break;
                  case 12:
                     actLoader.gotoAndStop(48);
                     if(curTar != null)
                     {
                        thisFather.skillDealer.addSkill("s3mc","tarlocal",curTar.thisLoader.x,curTar.thisLoader.y,this);
                     }
                     break;
                  case 13:
                     actLoader.gotoAndStop(49);
                     break;
                  case 14:
                     actLoader.gotoAndStop(50);
               }
               break;
            case 5:
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(21);
                     break;
                  case 4:
                     actLoader.gotoAndStop(22);
               }
               break;
            case 6:
               _loc2_ = int(param1[1]);
               leftItem();
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     leftExp();
                     actLoader.gotoAndStop(23);
                     break;
                  case 2:
                     actLoader.gotoAndStop(24);
                     break;
                  case 4:
                     actLoader.gotoAndStop(25);
                     break;
                  case 6:
                     actLoader.gotoAndStop(26);
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
               return;
            }
            _loc1_ = §§pop().floor(Math.random() * thisItemArr.length);
            thisFather.creatOneItem(thisItemArr[_loc1_],thisLoader.x,thisLoader.y);
            --thisItemNum;
         }
         else if(thisItemNum == 1 && thisSItemArr.length > 0)
         {
            §§push(Math);
            §§push(Math.random() * thisSItemArr.length);
            if(false)
            {
               return;
            }
            _loc1_ = §§pop().floor(§§pop());
            thisFather.creatOneItem(thisSItemArr[_loc1_],thisLoader.x,thisLoader.y);
            var _loc2_:* = §§findproperty(thisItemNum);
            §§push(_loc2_.thisItemNum - 1);
            if(false)
            {
               return false;
            }
            var _loc3_:* = §§pop();
            _loc2_.thisItemNum = _loc3_;
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
         else
         {
            §§push(Math.abs(thisLoader.x - curTar.thisLoader.x));
            if(false)
            {
               return;
            }
            if(§§pop() >= 400)
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
            else
            {
               §§push(Math);
               if(false)
               {
                  return;
               }
               if(§§pop().abs(thisLoader.x - curTar.thisLoader.x) <= 250)
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
      }
      
      private function initThis() : *
      {
         actLoader = new b3mc();
         thisAllHp = 4000;
         thisCurHp = 4000;
         thisAtt = 100;
         thisDef = 0;
         thisSpeed = 2;
         jumpSpeed = -3;
         thisExp = 1000;
         hitBlockTime = 8;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["expb"];
         thisSItemArr = ["s5","ws5","wd5","d5"];
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
            searchX = 640;
            searchY = 480;
            escapeX = 640;
            escapeY = 480;
         }
      }
   }
}

