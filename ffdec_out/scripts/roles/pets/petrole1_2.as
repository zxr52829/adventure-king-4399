package roles.pets
{
   import flash.display.MovieClip;
   import roles.allrole;
   
   public class petrole1_2 extends petrole
   {
      public function petrole1_2(param1:fightMain, param2:Object, param3:allrole, param4:int, param5:int)
      {
         var _loc6_:MovieClip = null;
         super();
         nextName = "p1_3";
         specialLevel = 20;
         initMyPro(param2);
         thisCurHp = thisAllHp;
         thisCurMp = thisAllMp;
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         actLoader = new pet1_2mc();
         thisObj.addChild(actLoader);
         _loc6_ = new peticon();
         _loc6_.y = -100;
         thisLoader.addChild(_loc6_);
         §§push(_loc6_);
         if(false)
         {
            return;
         }
         §§pop().gotoAndStop(2);
         thisFather = param1;
         thisFather.petRoleLoader.addChild(thisLoader);
         myMaster = param3;
         myMaster.myPet = this;
         thisLoader.x = param4;
         if(false)
         {
            return false;
         }
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
            actDealer.setCtrl("attack1","stop",15);
         }
      }
      
      override public function initMyHead() : *
      {
         var _loc1_:MovieClip = null;
         _loc1_ = new head1_2mc();
         thisStateBoard.addChild(_loc1_);
         _loc1_.x = 27;
         _loc1_.y = 50;
      }
      
      private function attack2() : *
      {
         if(actDealer.lockTimer <= 0 && thisCurMp >= 10)
         {
            §§push(actDealer);
            §§push("attack2");
            §§push("stop");
            §§push(30);
            if(false)
            {
               return;
            }
            if(§§pop().setCtrl(§§pop(),§§pop(),§§pop()))
            {
               changState(-10,"mp");
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
                     if(false)
                     {
                        return;
                     }
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
                     break;
                  default:
                     if(false)
                     {
                        return;
                     }
                     break;
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
                  case §§push(4), §§pop():
                     actLoader.gotoAndStop(18);
                     break;
                  case 6:
                     actLoader.gotoAndStop(19);
                     break;
                  case 8:
                     actLoader.gotoAndStop(20);
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
               _loc3_ = _loc2_;
               if(0 !== _loc3_)
               {
                  §§push(2 === _loc3_ ? 1 : (4 === _loc3_ ? 2 : (6 === _loc3_ ? 3 : (8 === _loc3_ ? 4 : (10 === _loc3_ ? 5 : (12 === _loc3_ ? 6 : (14 === _loc3_ ? 7 : 8)))))));
               }
               else
               {
                  §§push(0);
                  if(false)
                  {
                     return false;
                  }
               }
               switch(§§pop())
               {
                  case 0:
                     actLoader.gotoAndStop(9);
                     break;
                  case 1:
                     actLoader.gotoAndStop(10);
                     break;
                  case 2:
                     actLoader.gotoAndStop(11);
                     break;
                  case 3:
                     actLoader.gotoAndStop(12);
                     break;
                  case 4:
                     actLoader.gotoAndStop(13);
                     break;
                  case 5:
                     actLoader.gotoAndStop(14);
                     if(false)
                     {
                        return;
                     }
                     break;
                  case 6:
                     actLoader.gotoAndStop(15);
                     break;
                  case 7:
                     delThis();
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
         if(Math.abs(thisLoader.x - myMaster.thisLoader.x) > 600 || Math.abs(thisLoader.y - myMaster.thisLoader.y) > 300)
         {
            curTar = null;
            flyToMaster();
            return;
         }
         if(curTar == null)
         {
            §§push(thisLoader);
            if(false)
            {
               return;
            }
            if(§§pop().x < myMaster.thisLoader.x)
            {
               dealScale(1);
            }
            else
            {
               dealScale(-1);
            }
            §§push(Math);
            §§push(thisLoader.x);
            §§push(myMaster.thisLoader);
            if(false)
            {
               return;
            }
            if(§§pop().abs(§§pop() - §§pop().x) > 80 || Math.abs(thisLoader.y - myMaster.thisLoader.y) >= 120)
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
            §§push(Math);
            §§push(thisLoader);
            if(false)
            {
               return;
            }
            §§push(§§pop().abs(§§pop().x - curTar.thisLoader.x) > 250);
            if(!(§§pop().abs(§§pop().x - curTar.thisLoader.x) > 250))
            {
               §§pop();
               §§push(Math);
               §§push(thisLoader.y - curTar.thisLoader.y);
               if(false)
               {
                  return;
               }
               §§push(§§pop().abs(§§pop()) > 30);
            }
            if(§§pop())
            {
               moveToTar(curTar);
            }
            else if(Math.abs(thisLoader.x - curTar.thisLoader.x) > 100)
            {
               if(false)
               {
                  return;
               }
               attack();
            }
            else
            {
               _loc1_ = Math.random();
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
   }
}

§§push(§§findproperty(petrole1_2));
§§push(Sprite);
if(false)
{
   return;
}

