package roles.pets
{
   import flash.display.MovieClip;
   import roles.allrole;
   
   public class petrole1_1 extends petrole
   {
      public function petrole1_1(param1:fightMain, param2:Object, param3:allrole, param4:int, param5:int)
      {
         var _loc6_:MovieClip = null;
         super();
         specialLevel = 10;
         nextName = "p1_2";
         initMyPro(param2);
         thisCurHp = thisAllHp;
         thisCurMp = thisAllMp;
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         if(false)
         {
            return;
         }
         actLoader = new pet1_1mc();
         thisObj.addChild(actLoader);
         _loc6_ = new peticon();
         _loc6_.y = -70;
         thisLoader.addChild(_loc6_);
         _loc6_.gotoAndStop(1);
         thisFather = param1;
         thisFather.petRoleLoader.addChild(thisLoader);
         §§push(§§findproperty(myMaster));
         if(false)
         {
            return false;
         }
         §§pop().myMaster = param3;
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
            actDealer.setCtrl("attack1","stop",20);
         }
      }
      
      override public function initMyHead() : *
      {
         var _loc1_:MovieClip = null;
         _loc1_ = new head1_1mc();
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
         var _loc2_:* = 0;
         switch(param1[0])
         {
            case "wait":
               _loc2_ = param1[1] % 20;
               var _loc3_:* = _loc2_;
               switch(_loc3_)
               {
                  case 0:
               }
               actLoader.gotoAndStop(1);
               break;
            case "walk":
               §§push(int(param1[1] % 12));
               if(false)
               {
                  return;
               }
               _loc2_ = §§pop();
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(6);
                     break;
                  case 2:
                     actLoader.gotoAndStop(7);
                     break;
                  case 4:
                     actLoader.gotoAndStop(8);
                     break;
                  case 6:
                     if(false)
                     {
                        return;
                     }
                     actLoader.gotoAndStop(9);
                     break;
                  case 8:
                     actLoader.gotoAndStop(10);
                     break;
                  case 10:
                     actLoader.gotoAndStop(11);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(23);
               break;
            case "attack1":
               _loc2_ = int(param1[1]);
               §§push(_loc2_);
               if(false)
               {
                  return;
               }
               switch(§§pop())
               {
                  case 0:
                     §§push(actLoader);
                     if(false)
                     {
                        throw true;
                     }
                     §§pop().gotoAndStop(19);
                     break;
                  case 2:
                     actLoader.gotoAndStop(20);
                     break;
                  case 4:
                     actLoader.gotoAndStop(21);
                     break;
                  case 6:
                     actLoader.gotoAndStop(22);
                     thisFather.skillDealer.addSkill("p1mc","line",thisLoader.x,thisLoader.y - 20,this);
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
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(24);
                     break;
                  case 2:
                     actLoader.gotoAndStop(25);
                     break;
                  case 4:
                     if(false)
                     {
                        return;
                     }
                     actLoader.gotoAndStop(26);
                     break;
                  case 6:
                     actLoader.gotoAndStop(27);
                     addSound("otherskill1");
                     if(thisObj.scaleX != 1)
                     {
                        §§push(§§findproperty(setHitObj));
                        §§push(10);
                        §§push(-250);
                        §§push(0);
                        §§push(-50);
                        §§push(0);
                        if(false)
                        {
                           return;
                        }
                        §§pop().setHitObj(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),thisAtt,2.5,10,-20,0);
                     }
                     else
                     {
                        setHitObj(10,0,250,-50,0,thisAtt,2.5,10,-20,0);
                     }
                     break;
                  case 8:
                     actLoader.gotoAndStop(28);
                     break;
                  case 10:
                     actLoader.gotoAndStop(29);
                     break;
                  case 12:
                     actLoader.gotoAndStop(30);
                     break;
                  case 14:
                     actLoader.gotoAndStop(31);
                     break;
                  case 16:
                     actLoader.gotoAndStop(32);
                     break;
                  case 18:
                     if(false)
                     {
                        return;
                     }
                     actLoader.gotoAndStop(33);
                     break;
                  case 20:
                     actLoader.gotoAndStop(34);
               }
               break;
            case "behit":
               §§push(param1);
               if(false)
               {
                  return;
               }
               _loc2_ = int(§§pop()[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(12);
                     break;
                  case 4:
                     actLoader.gotoAndStop(13);
               }
               break;
            case "dead":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(14);
                     break;
                  case 2:
                     actLoader.gotoAndStop(15);
                     break;
                  case 4:
                     actLoader.gotoAndStop(16);
                     break;
                  case 6:
                     actLoader.gotoAndStop(17);
                     break;
                  case 8:
                     actLoader.gotoAndStop(18);
                     break;
                  case 10:
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
            if(thisLoader.x >= myMaster.thisLoader.x)
            {
               dealScale(-1);
            }
            else
            {
               dealScale(1);
            }
            if(Math.abs(thisLoader.x - myMaster.thisLoader.x) > 80 || Math.abs(thisLoader.y - myMaster.thisLoader.y) >= 120)
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
            §§push(thisLoader.x);
            §§push(curTar.thisLoader);
            if(false)
            {
               return;
            }
            if(§§pop() >= §§pop().x)
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
                  if(false)
                  {
                     return;
                  }
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

§§push(§§findproperty(petrole1_1));
§§push(allrole);
if(false)
{
   return;
}

