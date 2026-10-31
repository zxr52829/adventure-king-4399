package roles.pets
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.enemys.*;
   import roles.items.*;
   
   public class petrole1_3 extends petrole
   {
      public function petrole1_3(param1:fightMain, param2:Object, param3:allrole, param4:int, param5:int)
      {
         var _loc6_:MovieClip = null;
         super();
         initMyPro(param2);
         thisCurHp = thisAllHp;
         §§push(§§findproperty(thisCurMp));
         §§push(thisAllMp);
         if(false)
         {
            return;
         }
         §§pop().thisCurMp = §§pop();
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         actLoader = new pet1_3mc();
         if(false)
         {
            throw true;
         }
         thisObj.addChild(actLoader);
         _loc6_ = new peticon();
         _loc6_.y = -120;
         thisLoader.addChild(_loc6_);
         _loc6_.gotoAndStop(3);
         thisFather = param1;
         thisFather.petRoleLoader.addChild(thisLoader);
         myMaster = param3;
         myMaster.myPet = this;
         thisLoader.x = param4;
         thisLoader.y = param5;
         initMySb();
         tarArray = thisFather.enemyArr;
      }
      
      override public function attack() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(curSite == "onfloor")
            {
               nowSpeedX = 0;
            }
            actDealer.setCtrl("attack1","stop",40);
         }
      }
      
      override public function initMyHead() : *
      {
         var _loc1_:MovieClip = null;
         _loc1_ = new head1_3mc();
         thisStateBoard.addChild(_loc1_);
         _loc1_.x = 27;
         _loc1_.y = 50;
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0 && thisCurMp >= 50)
         {
            if(actDealer.setCtrl("attack2","stop",50))
            {
               changState(-50,"mp");
               beHitObject.noHitTimer = 30;
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
               var _loc3_:* = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(1);
                     break;
                  case 4:
                     actLoader.gotoAndStop(2);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(1);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               if(0 === _loc3_)
               {
                  if(false)
                  {
                     throw true;
                  }
                  §§push(0);
               }
               else
               {
                  §§push(2 === _loc3_ ? 1 : (4 === _loc3_ ? 2 : (6 === _loc3_ ? 3 : (8 === _loc3_ ? 4 : 5))));
               }
               switch(§§pop())
               {
                  case 0:
                     actLoader.gotoAndStop(18);
                     break;
                  case 1:
                     actLoader.gotoAndStop(19);
                     break;
                  case 2:
                     actLoader.gotoAndStop(20);
                     break;
                  case 3:
                     actLoader.gotoAndStop(21);
                     thisFather.skillDealer.addSkill("p2mc","line",thisLoader.x,thisLoader.y - 30,this);
                     break;
                  case 4:
                     actLoader.gotoAndStop(22);
               }
               break;
            case "attack2":
               §§push(param1);
               §§push(1);
               if(false)
               {
                  throw true;
               }
               _loc2_ = int(§§pop()[§§pop()]);
               _loc3_ = _loc2_;
               if(0 === _loc3_)
               {
                  if(false)
                  {
                     throw true;
                  }
                  §§push(0);
               }
               else if(2 !== _loc3_)
               {
                  if(4 === _loc3_)
                  {
                     §§push(2);
                  }
                  else
                  {
                     §§push(6);
                     §§push(_loc3_);
                     if(false)
                     {
                        throw true;
                     }
                     §§push(§§pop() === §§pop() ? 3 : (8 === _loc3_ ? 4 : (10 === _loc3_ ? 5 : (12 === _loc3_ ? 6 : (14 === _loc3_ ? 7 : (16 === _loc3_ ? 8 : (18 === _loc3_ ? 9 : (20 === _loc3_ ? 10 : (22 === _loc3_ ? 11 : (24 === _loc3_ ? 12 : (26 !== _loc3_ ? (28 === _loc3_ ? 14 : (29 === _loc3_ ? 15 : (33 === _loc3_ ? 16 : (37 === _loc3_ ? 17 : 18)))) : 13)))))))))));
                  }
               }
               else
               {
                  §§push(1);
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
                     break;
                  case 9:
                     actLoader.gotoAndStop(25);
                     if(false)
                     {
                        return false;
                     }
                     break;
                  case 10:
                     actLoader.gotoAndStop(26);
                     break;
                  case 11:
                     actLoader.gotoAndStop(27);
                     break;
                  case 12:
                     actLoader.gotoAndStop(28);
                     break;
                  case 13:
                     if(false)
                     {
                        return;
                     }
                     actLoader.gotoAndStop(29);
                     break;
                  case 14:
                     actLoader.gotoAndStop(30);
                     break;
                  case 15:
                     addSound("otherskill1");
                     §§push(thisFather.skillDealer);
                     §§push("p3mc");
                     §§push("line");
                     if(false)
                     {
                        return;
                     }
                     §§pop().addSkill(§§pop(),§§pop(),thisLoader.x,thisLoader.y,this);
                     break;
                  case 16:
                     addSound("otherskill1");
                     thisFather.skillDealer.addSkill("p3mc","line",thisLoader.x - 90,thisLoader.y,this);
                     break;
                  case 17:
                     addSound("otherskill1");
                     thisFather.skillDealer.addSkill("p3mc","line",thisLoader.x + 90,thisLoader.y,this);
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
                     break;
                  default:
                     if(false)
                     {
                        return false;
                     }
                     break;
               }
               break;
            case "dead":
               _loc2_ = int(param1[1]);
               _loc3_ = _loc2_;
               switch(_loc3_)
               {
                  case 0:
                  default:
                     actLoader.gotoAndStop(9);
                     break;
                  case 2:
                     actLoader.gotoAndStop(10);
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
         §§push(Math);
         §§push(thisLoader.x);
         §§push(myMaster.thisLoader);
         if(false)
         {
            return;
         }
         if(§§pop().abs(§§pop() - §§pop().x) > 600 || Math.abs(thisLoader.y - myMaster.thisLoader.y) > 300)
         {
            curTar = null;
            flyToMaster();
            return;
         }
         if(curTar == null)
         {
            if(thisLoader.x < myMaster.thisLoader.x)
            {
               dealScale(1);
            }
            else
            {
               dealScale(-1);
            }
            §§push(Math);
            §§push(thisLoader);
            if(false)
            {
               return;
            }
            if(§§pop().abs(§§pop().x - myMaster.thisLoader.x) > 80 || Math.abs(thisLoader.y - myMaster.thisLoader.y) >= 120)
            {
               moveToTar(myMaster);
            }
            else
            {
               wait();
            }
         }
         else
         {
            §§push(curTar.thisCurHp);
            if(false)
            {
               return;
            }
            if(§§pop() <= 0)
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
            if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 250 || Math.abs(thisLoader.y - curTar.thisLoader.y) > 30)
            {
               moveToTar(curTar);
            }
            else if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 100)
            {
               attack();
            }
            else
            {
               _loc1_ = Math.random();
               if(_loc1_ < 0.2 && thisLoader.y - curTar.thisLoader.y > -40)
               {
                  attack2();
                  if(false)
                  {
                     throw true;
                  }
               }
               else
               {
                  attack();
               }
            }
         }
      }
   }
}

