package roles
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class mainrole extends allrole
   {
      private var levelArr:Array;
      
      private var thisSkillBoard:MovieClip;
      
      public var curWeapon:int;
      
      private var specialLightMc:MovieClip;
      
      private var combHitObj:Object;
      
      public var picArray:Array;
      
      private var hitNumObj:Object;
      
      private var thisPro:Object;
      
      private var combMoveObj:Object;
      
      public var actLoader:Bitmap;
      
      private var lightMc:MovieClip;
      
      public function mainrole(param1:fightMain, param2:int, param3:int, param4:Object)
      {
         var father:fightMain = param1;
         var tx:int = param2;
         var ty:int = param3;
         var pro:Object = param4;
         §§push(§§findproperty(levelArr));
         if(false)
         {
            throw true;
         }
         §§push(50);
         §§push(100);
         §§push(200);
         §§push(350);
         §§push(500);
         §§push(750);
         §§push(1000);
         §§push(1300);
         §§push(1800);
         §§push(2500);
         §§push(3500);
         §§push(5000);
         §§push(7000);
         §§push(9000);
         §§push(11000);
         §§push(13000);
         §§push(15000);
         §§push(17000);
         §§push(19000);
         §§push(21000);
         §§push(23000);
         §§push(25000);
         §§push(27000);
         §§push(29000);
         §§push(31000);
         §§push(33000);
         §§push(35000);
         §§push(37000);
         §§push(39000);
         §§push(41000);
         §§push(43000);
         §§push(45000);
         if(false)
         {
            return;
         }
         §§pop().levelArr = null;
         combHitObj = {
            "hitTimer":int,
            "hitNum":int
         };
         combMoveObj = {
            "moveTimer":int,
            "moveDirect":int,
            "moveNum":int
         };
         hitNumObj = {
            "hitTimer":int,
            "hitNum":int
         };
         super();
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         initMyPro(pro);
         thisCurHp = thisAllHp;
         if(false)
         {
            return false;
         }
         thisCurMp = thisAllMp;
         dealWeapon();
         thisLoader.x = tx;
         thisLoader.y = ty;
         thisFather = father;
         thisFather.mainRoleLoader.addChild(thisLoader);
         tarArray = thisFather.enemyArr;
         protectTime = 20;
         hitBlockTime = 5;
         initMySb();
         with(combHitObj)
         {
            hitTimer = 0;
            hitNum = 0;
         }
         with(combMoveObj)
         {
            moveTimer = 0;
            moveNum = 0;
         }
         with(hitNumObj)
         {
            hitTimer = 0;
            hitNum = 0;
         }
      }
      
      override public function dealOther() : *
      {
         --combHitObj.hitTimer;
         --combMoveObj.moveTimer;
         --hitNumObj.hitTimer;
         dealLight();
         if(false)
         {
            return;
         }
      }
      
      internal function changeCommond() : *
      {
         var _loc1_:String = nowCommond;
         §§push("attack");
         §§push(_loc1_);
         if(false)
         {
            return;
         }
         switch(if(§§pop() === §§pop())
         {
            §§push(0);
         }
         else if("jump" === _loc1_)
         {
            §§push(1);
         }
         else if("downjump" === _loc1_)
         {
            §§push(2);
         }
         else if("skill" === _loc1_)
         {
            if(false)
            {
               return;
            }
            else
            {
               §§push(3);
            }
         }
         else
         {
            §§push("getitem" === _loc1_ ? 4 : ("toLeft" === _loc1_ ? 5 : ("toRight" === _loc1_ ? 6 : 7)));
         })
         {
            case 0:
               attack();
               break;
            case 1:
               jump();
               break;
            case 2:
               downJump();
               break;
            case 3:
               skill();
               break;
            case 4:
               getItem();
               break;
            case 5:
               if(curSite == "onfloor" && actDealer.lockTimer <= 0)
               {
                  dealCmObj(-1);
               }
               break;
            case 6:
               if(curSite == "onfloor" && actDealer.lockTimer <= 0)
               {
                  dealCmObj(1);
               }
         }
      }
      
      override public function changTar(param1:allrole) : *
      {
         if(myPet != null)
         {
            myPet.changTar(param1);
         }
      }
      
      private function dealLight() : *
      {
         if(lightMc != null)
         {
            lightMc.nextFrame();
            if(lightMc.currentFrame == lightMc.totalFrames)
            {
               removeLight();
            }
         }
         if(specialLightMc != null)
         {
            §§push(specialLightMc);
            if(false)
            {
               return;
            }
            §§pop().nextFrame();
            if(specialLightMc.currentFrame == specialLightMc.totalFrames)
            {
               removeSpecialLight();
            }
         }
      }
      
      private function initMyPro(param1:Object) : *
      {
         thisPro = param1;
         thisAllHp = 150 + thisPro.roleLevel * 30 + thisPro.roleDress * 120;
         thisAllMp = 50 + thisPro.roleLevel * 10;
         curWeapon = thisPro.curWeapon;
         jumpSpeed = -30;
         if(thisPro.roleLevel >= 10)
         {
            canJumpNum = 2;
         }
         else
         {
            canJumpNum = 1;
         }
      }
      
      override public function changState(param1:int, param2:String) : *
      {
         switch(param2)
         {
            case "hp":
               thisCurHp += param1;
               if(thisCurHp > thisAllHp)
               {
                  thisCurHp = thisAllHp;
               }
               else if(thisCurHp < 0)
               {
                  thisCurHp = 0;
               }
               thisStateBoard.hpBar.scaleX = thisCurHp / thisAllHp;
               thisStateBoard.hpWard.text = thisCurHp + "/" + thisAllHp;
               break;
            case "mp":
               thisCurMp += param1;
               if(thisCurMp > thisAllMp)
               {
                  if(false)
                  {
                     return;
                  }
                  thisCurMp = thisAllMp;
               }
               else if(thisCurMp < 0)
               {
                  thisCurMp = 0;
               }
               thisStateBoard.mpBar.scaleX = thisCurMp / thisAllMp;
               thisStateBoard.mpWard.text = thisCurMp + "/" + thisAllMp;
               break;
            case "exp":
               if(thisPro.pLv >= 25)
               {
                  thisStateBoard.expBar.scaleX = 1;
                  thisStateBoard.expWard.text = "MAX";
               }
               else
               {
                  thisStateBoard.expBar.scaleX = thisPro.roleExp / levelArr[thisPro.roleLevel - 1];
                  thisStateBoard.expWard.text = thisPro.roleExp + "/" + levelArr[thisPro.roleLevel - 1];
               }
               break;
            case "wp":
               thisStateBoard.weaponShow.gotoAndStop(param1);
         }
      }
      
      private function initSkillBoard() : *
      {
         if(thisPro.roleLevel < 5)
         {
            thisSkillBoard.visible = false;
         }
         else
         {
            thisSkillBoard.visible = true;
            thisSkillBoard.s1.visible = false;
            thisSkillBoard.s2.visible = false;
            thisSkillBoard.s3.visible = false;
            thisSkillBoard.s4.visible = false;
            if(thisPro.roleLevel >= 5)
            {
               thisSkillBoard.s1.visible = true;
            }
            if(thisPro.roleLevel >= 7)
            {
               thisSkillBoard.s2.visible = true;
            }
            if(thisPro.roleLevel >= 15)
            {
               thisSkillBoard.s3.visible = true;
            }
            if(thisPro.roleLevel >= 20)
            {
               thisSkillBoard.s4.visible = true;
            }
         }
      }
      
      override public function initMySb() : *
      {
         thisStateBoard = new stateBoard();
         thisFather.uiLoader.addChild(thisStateBoard);
         thisSkillBoard = new skillBoard();
         §§push(thisFather.uiLoader);
         §§push(thisSkillBoard);
         if(false)
         {
            return false;
         }
         §§pop().addChild(§§pop());
         Main.keyObject.initShow(thisSkillBoard.s1,Main.keyObject.keyArray[7]);
         Main.keyObject.initShow(thisSkillBoard.s2,Main.keyObject.keyArray[8]);
         Main.keyObject.initShow(thisSkillBoard.s3,Main.keyObject.keyArray[9]);
         §§push(Main.keyObject);
         if(false)
         {
            return;
         }
         §§pop().initShow(thisSkillBoard.s4,Main.keyObject.keyArray[10]);
         initSkillBoard();
         thisStateBoard.x = 10;
         thisStateBoard.y = 10;
         if(false)
         {
            return;
         }
         thisSkillBoard.x = 445;
         thisSkillBoard.y = 435;
         thisStateBoard.lvWard.text = thisPro.roleLevel;
         changState(0,"hp");
         changState(0,"mp");
         changState(0,"exp");
         changState(curWeapon,"wp");
      }
      
      override public function attack() : *
      {
         §§push(commond.runjump && curSite == "onfloor");
         if(commond.runjump && curSite == "onfloor")
         {
            if(false)
            {
               return;
            }
            §§pop();
            §§push(thisCurMp >= 20);
         }
         if(§§pop() && thisPro.roleLevel >= 7)
         {
            if(actDealer.setCtrl("rollattack","stop",28))
            {
               changState(-20,"mp");
               nowSpeedX = 0;
               beHitObject.noHitTimer = 28;
               return;
            }
         }
         if(curSite == "onfloor")
         {
            §§push(combMoveObj);
            if(false)
            {
               return;
            }
            if(§§pop().moveNum > 0 && thisPro.roleLevel >= 3)
            {
               if(curWeapon == 1)
               {
                  if(actDealer.setCtrl("attack3","stop",7))
                  {
                     nowSpeedY = -10;
                     curSite = "fly";
                  }
               }
               else if(actDealer.setCtrl("attack3","stop",11))
               {
                  nowSpeedY = -10;
                  curSite = "fly";
               }
            }
            else
            {
               nowSpeedX = 0;
               if(commond.runup && thisCurMp >= 10 && thisPro.roleLevel >= 5)
               {
                  §§push(actDealer);
                  §§push("attack4");
                  §§push("stop");
                  if(false)
                  {
                     throw true;
                  }
                  if(§§pop().setCtrl(§§pop(),§§pop(),20))
                  {
                     changState(-10,"mp");
                     return;
                  }
               }
               if(combHitObj.hitNum < 2)
               {
                  if(curWeapon == 1)
                  {
                     §§push(actDealer);
                     §§push("attack1");
                     if(false)
                     {
                        return;
                     }
                     if(§§pop().setCtrl(§§pop(),"stop",7))
                     {
                        dealChObj();
                     }
                  }
                  else if(actDealer.setCtrl("attack1","stop",12))
                  {
                     dealChObj();
                  }
               }
               else
               {
                  §§push(combHitObj.hitNum);
                  if(false)
                  {
                     return;
                  }
                  if(§§pop() == 2)
                  {
                     if(curWeapon == 1)
                     {
                        if(actDealer.setCtrl("attack2","stop",10))
                        {
                           dealChObj();
                        }
                     }
                     else
                     {
                        §§push(actDealer);
                        §§push("attack2");
                        if(false)
                        {
                           return;
                        }
                        if(§§pop().setCtrl(§§pop(),"stop",15))
                        {
                           dealChObj();
                        }
                     }
                  }
                  else if(curWeapon == 1)
                  {
                     if(actDealer.setCtrl("attack3","stop",10))
                     {
                        dealChObj();
                     }
                  }
                  else if(actDealer.setCtrl("attack3","stop",15))
                  {
                     dealChObj();
                  }
               }
            }
            combMoveObj.moveTimer = 0;
         }
         else if(curWeapon == 1)
         {
            actDealer.setCtrl("jumpattack","stop",5);
         }
         else
         {
            actDealer.setCtrl("jumpattack","stop",7);
         }
      }
      
      private function skill() : *
      {
         if(commond.rundown && curSite == "fly" && thisCurMp >= 80 && thisPro.roleLevel >= 20)
         {
            if(actDealer.setCtrl("skill2_1","stop",8))
            {
               changState(-80,"mp");
               beHitObject.noHitTimer = 8;
            }
         }
         else if(thisCurMp >= 30 && thisPro.roleLevel >= 15)
         {
            if(actDealer.setCtrl("skill1","stop",15))
            {
               changState(-30,"mp");
               nowSpeedX = 20 * thisObj.scaleX;
            }
         }
      }
      
      private function removeSpecialLight() : *
      {
         if(specialLightMc != null)
         {
            thisLoader.removeChild(specialLightMc);
            specialLightMc = null;
         }
      }
      
      override public function checkNewMap(param1:String) : *
      {
         var _loc2_:* = undefined;
         if(param1 != "")
         {
            _loc2_ = 0;
            while(_loc2_ < thisPro.mapArray.length)
            {
               if(param1 == thisPro.mapArray[_loc2_])
               {
                  return;
               }
               _loc2_++;
            }
            thisPro.mapArray.push(param1);
            thisFather.showTip("nmt");
         }
      }
      
      override public function checkNewPet(param1:Object) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < thisPro.rolePet.length)
         {
            if(param1.pk == thisPro.rolePet[_loc2_].pk)
            {
               return;
            }
            _loc2_++;
         }
         §§push(thisPro.rolePet);
         §§push(param1);
         if(false)
         {
            return;
         }
         §§pop().push(§§pop());
         thisFather.showTip("npt");
         if(myPet == null)
         {
            thisPro.curPet = _loc2_;
            thisFather.creatNewPet(param1,this,thisLoader.x,200);
         }
      }
      
      override public function delHitNum() : *
      {
         hitNumObj.hitNum = 0;
      }
      
      override public function getExp(param1:int) : *
      {
         if(thisPro.roleLevel >= 40)
         {
            thisStateBoard.expBar.scaleX = 1;
            thisStateBoard.expWard.text = "MAX";
            return;
         }
         §§push(thisPro);
         §§push(thisPro);
         if(false)
         {
            return;
         }
         §§pop().roleExp = §§pop().roleExp + param1;
         if(thisPro.roleExp >= levelArr[thisPro.roleLevel - 1])
         {
            §§push(thisPro);
            §§push(thisPro.roleExp);
            §§push(levelArr);
            §§push(thisPro);
            if(false)
            {
               return;
            }
            §§pop().roleExp = §§pop() - §§pop()[§§pop().roleLevel - 1];
            levelUp();
            getExp(0);
         }
         changState(thisPro.roleExp,"exp");
         §§push(thisFather.scoreBar);
         if(false)
         {
            return;
         }
         §§pop().getScore(param1);
      }
      
      override public function addHitLight(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:String = "lh1") : *
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         _loc11_ = Math.floor((Math.max(param1,param2) + Math.min(param3,param4)) / 2);
         §§push(Math);
         §§push(Math.max(param5,param6));
         §§push(Math.min(param7,param8));
         if(false)
         {
            return;
         }
         _loc12_ = int(§§pop().floor((§§pop() + §§pop()) / 2));
         thisFather.lightDealer.addHitLight(param10,_loc11_,_loc12_,thisObj.scaleX);
         thisFather.wordDealer.addWord("w2",param9,_loc11_,_loc12_);
      }
      
      override public function dealHnObj(param1:int) : *
      {
         if(hitNumObj.hitTimer <= 0)
         {
            hitNumObj.hitNum = 0;
         }
         hitNumObj.hitNum += param1;
         if(false)
         {
            return;
         }
         if(hitNumObj.hitNum > 1)
         {
            thisFather.combShow.getWord(hitNumObj.hitNum);
         }
         hitNumObj.hitTimer = 30;
      }
      
      private function addLight(param1:String) : *
      {
         var _loc2_:Class = null;
         removeLight();
         _loc2_ = getDefinitionByName(param1) as Class;
         lightMc = new _loc2_();
         lightMc.gotoAndStop(1);
         thisObj.addChild(lightMc);
      }
      
      internal function dealOnce() : *
      {
         var theCommond:String = null;
         with(commond)
         {
            if(runattack)
            {
               theCommond = "attack";
            }
            else if(runskill)
            {
               theCommond = "skill";
            }
            else if(runjump)
            {
               if(!rundown)
               {
                  theCommond = "jump";
               }
               else
               {
                  theCommond = "downjump";
               }
            }
            else if(rundown)
            {
               theCommond = "getitem";
            }
            else if(Boolean(runleft) && !runright)
            {
               theCommond = "toLeft";
            }
            else if(Boolean(runright) && !runleft)
            {
               theCommond = "toRight";
            }
         }
         if(theCommond != nowCommond)
         {
            nowCommond = theCommond;
            changeCommond();
         }
      }
      
      private function addSpecialLight(param1:String) : *
      {
         var _loc2_:Class = null;
         removeSpecialLight();
         _loc2_ = getDefinitionByName(param1) as Class;
         specialLightMc = new _loc2_();
         specialLightMc.gotoAndStop(1);
         thisLoader.addChild(specialLightMc);
      }
      
      private function removeLight() : *
      {
         if(lightMc != null)
         {
            thisObj.removeChild(lightMc);
            lightMc = null;
         }
      }
      
      private function dealCmObj(param1:int) : *
      {
         if(combMoveObj.moveTimer > 0 && combMoveObj.moveDirect == param1)
         {
            ++combMoveObj.moveNum;
         }
         else
         {
            combMoveObj.moveNum = 0;
         }
         combMoveObj.moveTimer = 10;
         if(false)
         {
            return false;
         }
         combMoveObj.moveDirect = param1;
      }
      
      private function levelUp() : *
      {
         addSpecialLight("llvup");
         addSound("lvup");
         ++thisPro.roleLevel;
         thisStateBoard.lvWard.text = thisPro.roleLevel;
         initMyPro(thisPro);
         thisCurHp = thisAllHp;
         thisCurMp = thisAllMp;
         if(false)
         {
            throw true;
         }
         changState(0,"hp");
         changState(0,"mp");
         checkNewSkill();
         initSkillBoard();
      }
      
      private function creatThisPic() : *
      {
         var _loc1_:creatMc = null;
         var _loc2_:Array = null;
         var _loc3_:* = null;
         _loc2_ = [];
         if(curWeapon == 1)
         {
            _loc3_ = "pics" + thisPro.roleShield;
            _loc2_.push(_loc3_);
            _loc3_ = "picb";
            _loc2_.push(_loc3_);
            §§push("pich");
            if(false)
            {
               return;
            }
            _loc3_ = §§pop();
            _loc2_.push(_loc3_);
            _loc3_ = "picd" + thisPro.roleDress;
            _loc2_.push(_loc3_);
            _loc3_ = "picws" + thisPro.roleWeapon1;
            _loc2_.push(_loc3_);
         }
         else
         {
            _loc3_ = "picb";
            _loc2_.push(_loc3_);
            _loc3_ = "pich";
            _loc2_.push(_loc3_);
            _loc3_ = "picd" + thisPro.roleDress;
            _loc2_.push(_loc3_);
            _loc3_ = "picwd" + thisPro.roleWeapon2;
            _loc2_.push(_loc3_);
         }
         _loc1_ = new creatMc(_loc2_);
         picArray = _loc1_.allPicArr;
         actLoader = new Bitmap();
         if(curWeapon == 1)
         {
            if(false)
            {
               throw true;
            }
            actLoader.bitmapData = picArray[0];
         }
         else
         {
            actLoader.bitmapData = picArray[24];
         }
         thisObj.addChild(actLoader);
         actLoader.x = -125;
         actLoader.y = -161;
      }
      
      private function dealChObj() : *
      {
         if(combHitObj.hitTimer > 0)
         {
            ++combHitObj.hitNum;
            if(combHitObj.hitNum >= 4)
            {
               combHitObj.hitNum = 0;
            }
         }
         else
         {
            combHitObj.hitNum = 0;
         }
         combHitObj.hitTimer = 20;
      }
      
      override public function fastSkill(param1:String) : *
      {
         switch(param1)
         {
            case "1":
               if(curSite == "onfloor" && thisCurMp >= 10 && thisPro.roleLevel >= 5)
               {
                  if(actDealer.setCtrl("attack4","stop",20))
                  {
                     changState(-10,"mp");
                     nowSpeedX = 0;
                  }
               }
               break;
            case "2":
               if(curSite == "onfloor" && thisCurMp >= 20 && thisPro.roleLevel >= 7)
               {
                  if(actDealer.setCtrl("rollattack","stop",28))
                  {
                     changState(-20,"mp");
                     if(false)
                     {
                        return;
                     }
                     nowSpeedX = 0;
                     beHitObject.noHitTimer = 28;
                  }
               }
               break;
            case "3":
               §§push(thisCurMp >= 30);
               if(thisCurMp >= 30)
               {
                  §§pop();
                  §§push(thisPro.roleLevel >= 15);
                  if(false)
                  {
                     return;
                  }
               }
               if(§§pop())
               {
                  if(actDealer.setCtrl("skill1","stop",15))
                  {
                     changState(-30,"mp");
                     nowSpeedX = 20 * thisObj.scaleX;
                  }
               }
               break;
            case "4":
               if(thisCurMp >= 80 && thisPro.roleLevel >= 20)
               {
                  if(actDealer.setCtrl("skill2_1","stop",8))
                  {
                     if(false)
                     {
                        return;
                     }
                     changState(-80,"mp");
                     beHitObject.noHitTimer = 8;
                  }
               }
         }
      }
      
      override public function wait() : *
      {
         if(actDealer.lockTimer <= 0)
         {
            nowSpeedX = 0;
            combMoveObj.moveNum = 0;
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
               if(curWeapon == 1)
               {
                  _loc3_ = _loc2_;
                  if(0 === _loc3_)
                  {
                     if(false)
                     {
                        throw true;
                     }
                     §§push(0);
                  }
                  else if(4 !== _loc3_)
                  {
                     if(8 === _loc3_)
                     {
                        §§push(2);
                     }
                     else if(12 === _loc3_)
                     {
                        §§push(3);
                        if(false)
                        {
                           return;
                        }
                     }
                     else
                     {
                        §§push(4);
                     }
                  }
                  else
                  {
                     §§push(1);
                  }
                  switch(§§pop())
                  {
                     case 0:
                        if(false)
                        {
                           return;
                        }
                        actLoader.bitmapData = picArray[0];
                        break;
                     case 1:
                        actLoader.bitmapData = picArray[1];
                        break;
                     case 2:
                        actLoader.bitmapData = picArray[2];
                        break;
                     case 3:
                        actLoader.bitmapData = picArray[3];
                  }
               }
               else
               {
                  _loc3_ = _loc2_;
                  switch(_loc3_)
                  {
                     case 0:
                  }
                  actLoader.bitmapData = picArray[24];
                  if(false)
                  {
                     return false;
                  }
               }
               break;
            case "walk":
               _loc2_ = param1[1] % 16;
               if(curWeapon == 1)
               {
                  switch(_loc2_)
                  {
                     case 0:
                        actLoader.bitmapData = picArray[4];
                        break;
                     case 4:
                        actLoader.bitmapData = picArray[5];
                        break;
                     case 8:
                        actLoader.bitmapData = picArray[6];
                        break;
                     case 12:
                        actLoader.bitmapData = picArray[7];
                  }
               }
               else
               {
                  switch(_loc2_)
                  {
                     case 0:
                        actLoader.bitmapData = picArray[28];
                        break;
                     case 4:
                        actLoader.bitmapData = picArray[29];
                        break;
                     case 8:
                        actLoader.bitmapData = picArray[30];
                        break;
                     case 12:
                        §§push(actLoader);
                        §§push(picArray);
                        §§push(31);
                        if(false)
                        {
                           return;
                        }
                        §§pop().bitmapData = §§pop()[§§pop()];
                        break;
                  }
               }
         }
      }
      
      override public function dealHit() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         if(hitObject.hitTimer > 0)
         {
            _loc1_ = 0;
            _loc2_ = 0;
            while(_loc2_ < tarArray.length)
            {
               if(tarArray[_loc2_].beHit(hitObject))
               {
                  blockTime = defBlockTime;
                  §§push(tarArray);
                  §§push(_loc2_);
                  if(false)
                  {
                     return;
                  }
                  §§pop()[§§pop()].changTar(this);
                  if(myPet != null && myPet.curTar == null)
                  {
                     myPet.changTar(tarArray[_loc2_]);
                  }
                  _loc1_++;
               }
               _loc2_++;
            }
            if(_loc1_ > 0)
            {
               changState(1,"mp");
               dealHnObj(_loc1_);
            }
            --hitObject.hitTimer;
            if(false)
            {
               return;
            }
         }
         if(beHitObject.noHitTimer > 0)
         {
            --beHitObject.noHitTimer;
         }
      }
      
      internal function getItem() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < thisFather.itemArr.length)
         {
            §§push(thisFather.itemArr[_loc1_]);
            §§push(this);
            if(false)
            {
               return false;
            }
            §§pop().beGet(§§pop());
            _loc1_++;
         }
      }
      
      internal function dealContinued() : *
      {
         var mX:int = 0;
         var mY:int = 0;
         with(commond)
         {
            if(Boolean(runleft) && !runright)
            {
               mX = -1;
            }
            else if(Boolean(runright) && !runleft)
            {
               mX = 1;
            }
            else
            {
               mX = 0;
            }
            if(Boolean(runup) && !rundown)
            {
               if(thisFather.mapDealer.tryChangeLine(thisLoader.x,thisLoader.y))
               {
                  thisLoader.y -= 5;
               }
               §§push(thisFather.mapDealer);
               §§push(thisLoader.x + mX * thisSpeed);
               §§push(thisLoader);
               if(false)
               {
                  return;
               }
               if(§§pop().tryClimb(§§pop(),§§pop().y - climbSpeed))
               {
                  curSite = "climb";
               }
               else if(curSite == "climb")
               {
                  curSite = "fly";
                  §§push(thisLoader);
                  §§push(thisLoader);
                  if(false)
                  {
                     return;
                  }
                  §§pop().y = §§pop().y - 5;
               }
               mY = -1;
            }
            else if(Boolean(rundown) && !runup)
            {
               if(!thisFather.mapDealer.tryClimb(thisLoader.x + mX * thisSpeed,thisLoader.y + climbSpeed))
               {
                  if(curSite == "climb")
                  {
                     curSite = "fly";
                  }
               }
               else
               {
                  curSite = "climb";
               }
               mY = 1;
            }
            else
            {
               mY = 0;
            }
            movethis(mX,mY);
         }
         if(mX == 0)
         {
            wait();
         }
      }
      
      public function dealWeapon() : *
      {
         creatThisPic();
         if(curWeapon == 1)
         {
            thisAtt = 10 + thisPro.roleWeapon1 * 15;
            thisDef = 10 + thisPro.roleShield * 10;
         }
         else
         {
            thisAtt = 20 + thisPro.roleWeapon2 * 25;
            thisDef = 0;
         }
      }
      
      private function checkNewSkill() : *
      {
         var _loc1_:* = thisPro.roleLevel;
         switch(_loc1_)
         {
            case 2:
            default:
               thisFather.showTip("st1");
               break;
            case 3:
               thisFather.showTip("st2");
               break;
            case 5:
               thisFather.showTip("st3");
               break;
            case 7:
               thisFather.showTip("st4");
         }
      }
      
      override public function dealCommond() : *
      {
         if(thisCurHp <= 0)
         {
            dead();
            return;
         }
         dealOnce();
         dealContinued();
      }
      
      public function getNewEquip(param1:int, param2:String) : *
      {
         thisFather.scoreBar.getScore(param1 * 1000);
         switch(param2)
         {
            case "shield":
               if(thisPro.roleShield < param1)
               {
                  if(false)
                  {
                     return;
                  }
                  thisFather.showTip("net");
                  thisPro.roleShield = param1;
                  thisObj.removeChild(actLoader);
                  dealWeapon();
               }
               break;
            case "weapon1":
               §§push(thisPro.roleWeapon1);
               if(false)
               {
                  throw true;
               }
               if(§§pop() < param1)
               {
                  thisFather.showTip("net");
                  thisPro.roleWeapon1 = param1;
                  thisObj.removeChild(actLoader);
                  dealWeapon();
               }
               break;
            case "weapon2":
               if(thisPro.roleWeapon2 < param1)
               {
                  thisFather.showTip("net");
                  thisPro.roleWeapon2 = param1;
                  thisObj.removeChild(actLoader);
                  dealWeapon();
               }
               break;
            case "dress":
               if(thisPro.roleDress < param1)
               {
                  thisFather.showTip("net");
                  thisPro.roleDress = param1;
                  thisObj.removeChild(actLoader);
                  creatThisPic();
                  thisAllHp = 150 + thisPro.roleLevel * 30 + thisPro.roleDress * 120;
                  changState(0,"hp");
               }
         }
      }
      
      override public function movethis(param1:Number, param2:Number = 0) : *
      {
         if(actDealer.lockTimer <= 0)
         {
            if(param1 != 0)
            {
               thisObj.scaleX = param1;
            }
            if(combMoveObj.moveNum > 0 && thisPro.roleLevel >= 2)
            {
               nowSpeedX = thisSpeed * param1 * 2;
            }
            else
            {
               nowSpeedX = thisSpeed * param1;
            }
            if(curSite == "climb")
            {
               nowSpeedY = climbSpeed * param2;
            }
         }
      }
      
      override public function changeWeapon() : *
      {
         if(curWeapon == 1)
         {
            curWeapon = 2;
         }
         else
         {
            curWeapon = 1;
         }
         thisPro.curWeapon = curWeapon;
         thisObj.removeChild(actLoader);
         dealWeapon();
         if(false)
         {
            return;
         }
         changState(curWeapon,"wp");
      }
   }
}

