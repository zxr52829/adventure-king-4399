package roles.pets
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.enemys.*;
   import roles.items.*;
   
   public class petrole extends allrole
   {
      public var nextName:String;
      
      public var levelArr:Array;
      
      public var specialLightMc:MovieClip;
      
      public var specialLevel:int;
      
      public var thisPro:Object;
      
      public var actLoader:MovieClip;
      
      public function petrole()
      {
         §§push(§§findproperty(levelArr));
         §§push(100);
         §§push(200);
         §§push(300);
         §§push(400);
         §§push(500);
         §§push(600);
         §§push(700);
         §§push(800);
         §§push(1000);
         §§push(1200);
         §§push(1400);
         §§push(1600);
         §§push(1800);
         §§push(2000);
         §§push(2200);
         if(false)
         {
            return false;
         }
         §§pop().levelArr = null;
         super();
      }
      
      override public function dealOther() : *
      {
         if(curTar == null)
         {
            changState(1,"hp");
         }
         dealLight();
      }
      
      public function dealLight() : *
      {
         if(specialLightMc != null)
         {
            specialLightMc.nextFrame();
            if(specialLightMc.currentFrame == specialLightMc.totalFrames)
            {
               removeSpecialLight();
            }
         }
      }
      
      public function initMyPro(param1:Object) : *
      {
         thisPro = param1;
         thisAllHp = 100 + thisPro.pLv * 50;
         §§push(§§findproperty(thisAllMp));
         §§push(50);
         if(false)
         {
            throw true;
         }
         §§pop().thisAllMp = §§pop() + thisPro.pLv * 25;
         thisAtt = 10 + thisPro.pLv * 8;
         §§push(§§findproperty(thisDef));
         §§push(thisPro);
         if(false)
         {
            throw true;
         }
         §§pop().thisDef = §§pop().pLv * 3;
         jumpSpeed = -35;
         jumpTop = getJumpTop(jumpSpeed);
         protectTime = 20;
         §§push(§§findproperty(hitBlockTime));
         §§push(5);
         if(false)
         {
            return;
         }
         §§pop().hitBlockTime = §§pop();
      }
      
      override public function changState(param1:int, param2:String) : *
      {
         var _loc3_:* = param2;
         §§push("hp");
         §§push(_loc3_);
         if(false)
         {
            return;
         }
         §§push(§§pop() !== §§pop() ? ("mp" === _loc3_ ? 1 : ("exp" === _loc3_ ? 2 : 3)) : 0);
         if(false)
         {
            return;
         }
         switch(§§pop())
         {
            case 0:
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
            case 1:
               thisCurMp += param1;
               if(thisCurMp > thisAllMp)
               {
                  thisCurMp = thisAllMp;
               }
               else if(thisCurMp < 0)
               {
                  thisCurMp = 0;
               }
               thisStateBoard.mpBar.scaleX = thisCurMp / thisAllMp;
               thisStateBoard.mpWard.text = thisCurMp + "/" + thisAllMp;
               break;
            case 2:
               if(thisPro.pLv >= 30)
               {
                  thisStateBoard.expBar.scaleX = 1;
                  §§push(thisStateBoard);
                  if(false)
                  {
                     return;
                  }
                  §§pop().expWard.text = "MAX";
               }
               else
               {
                  thisStateBoard.expBar.scaleX = thisPro.pExp / levelArr[thisPro.pLv - 1];
                  §§push(thisStateBoard.expWard);
                  if(false)
                  {
                     return;
                  }
                  §§pop().text = thisPro.pExp + "/" + levelArr[thisPro.pLv - 1];
               }
         }
      }
      
      override public function initMySb() : *
      {
         thisStateBoard = new petStaBoard();
         thisFather.uiLoader.addChild(thisStateBoard);
         thisStateBoard.y = 400;
         changState(0,"hp");
         changState(0,"mp");
         changState(0,"exp");
         thisStateBoard.lvWard.text = thisPro.pLv;
         initMyHead();
      }
      
      public function flyToMaster() : *
      {
         thisLoader.x = myMaster.thisLoader.x;
         thisLoader.y = myMaster.thisLoader.y;
         curSite = "fly";
         §§push(thisFather.lightDealer);
         §§push("lsmove");
         §§push(thisLoader);
         if(false)
         {
            return;
         }
         §§pop().addLight(§§pop(),§§pop().x,thisLoader.y,thisObj.scaleX);
      }
      
      public function removeSpecialLight() : *
      {
         if(specialLightMc != null)
         {
            thisLoader.removeChild(specialLightMc);
            specialLightMc = null;
         }
      }
      
      override public function getExp(param1:int) : *
      {
         thisPro.pExp += param1;
         if(thisPro.pExp >= levelArr[thisPro.pLv - 1])
         {
            §§push(thisPro);
            §§push(thisPro.pExp);
            §§push(levelArr);
            if(false)
            {
               return false;
            }
            §§pop().pExp = §§pop() - §§pop()[thisPro.pLv - 1];
            levelUp();
            getExp(0);
         }
         changState(thisPro.pExp,"exp");
      }
      
      public function initMyHead() : *
      {
      }
      
      override public function addHitLight(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:String = "lh1") : *
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         _loc11_ = Math.floor((Math.max(param1,param2) + Math.min(param3,param4)) / 2);
         _loc12_ = Math.floor((Math.max(param5,param6) + Math.min(param7,param8)) / 2);
         thisFather.lightDealer.addHitLight(param10,_loc11_,_loc12_,thisObj.scaleX);
         thisFather.wordDealer.addWord("w2",param9,_loc11_,_loc12_);
      }
      
      public function addSpecialLight(param1:String) : *
      {
         var _loc2_:Class = null;
         removeSpecialLight();
         _loc2_ = getDefinitionByName(param1) as Class;
         specialLightMc = new _loc2_();
         specialLightMc.gotoAndStop(1);
         thisLoader.addChild(specialLightMc);
      }
      
      public function levelUp() : *
      {
         ++thisPro.pLv;
         if(thisPro.pLv == specialLevel)
         {
            delThis();
            thisFather.uiLoader.removeChild(thisStateBoard);
            thisPro.pName = nextName;
            thisFather.petEvolve(thisPro,this);
         }
         else
         {
            addSpecialLight("llvup");
            addSound("lvup");
            thisStateBoard.lvWard.text = thisPro.pLv;
            initMyPro(thisPro);
            if(false)
            {
               return;
            }
            thisCurHp = thisAllHp;
            thisCurMp = thisAllMp;
            changState(0,"hp");
            changState(0,"mp");
         }
      }
      
      override public function delThis() : *
      {
         thisOver = true;
         myMaster.myPet = null;
         thisFather.delPet(this);
      }
   }
}

