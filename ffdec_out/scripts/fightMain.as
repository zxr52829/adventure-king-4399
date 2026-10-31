package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import roles.*;
   import roles.enemys.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class fightMain extends MovieClip
   {
      public var curEArr:Array = new Array();
      
      public var scoreBar:MovieClip;
      
      public var allTimer:int = 0;
      
      public var pauseMc:MovieClip;
      
      public var tipShow:MovieClip;
      
      public var itemArr:Array = new Array();
      
      public var upBgLoader:MovieClip;
      
      public var mapDealer:mapdealer;
      
      public var winMc:MovieClip;
      
      public var petRoleLoader:MovieClip;
      
      private var saveLoadX:int;
      
      public var stageDealer:stagedealer;
      
      public var gameLevel:int;
      
      private var saveLoadY:int;
      
      public var mainRoleLoader:MovieClip;
      
      public var teamArr:Array = new Array();
      
      public var gameDate:Object;
      
      public var lightLoader:MovieClip;
      
      public var lightDealer:lightdealer;
      
      public var backgroundLoader:MovieClip;
      
      public var farBgLoader:MovieClip;
      
      public var itemLoader:MovieClip;
      
      public var mainLoader:MovieClip;
      
      public var gameRun:Boolean = true;
      
      public var stageLock:Boolean = false;
      
      public var hitShowLoader:MovieClip;
      
      public var bossBar:MovieClip;
      
      public var gameActorDate:Object = new Object();
      
      private var keyArr:Array;
      
      public var bossRole:allrole;
      
      public var overMc:MovieClip;
      
      public var thisFather:Main;
      
      public var combShow:MovieClip;
      
      public var lockEArr:Array = new Array();
      
      public var enemyArr:Array = new Array();
      
      public var wordDealer:worddealer;
      
      public var bgMapLoader:MovieClip;
      
      public var uiLoader:MovieClip;
      
      public var enemyRoleLoader:MovieClip;
      
      public var skillDealer:skilldealer;
      
      public var doorMc:MovieClip;
      
      public var shakeTimer:int = 0;
      
      public var mainActor1:allrole;
      
      public function fightMain(param1:Main, param2:Object, param3:int)
      {
         super();
         thisFather = param1;
         gameActorDate = param2;
         keyArr = gameActorDate.keyArray;
         gameLevel = param3;
         gameDate = ObjectUtil.baseClone(Main.gameLevelDate["lvDate" + param3]);
         if(false)
         {
            return;
         }
         initLoader();
         initAllDealer();
         loadBgPic(gameDate.bgnPic,gameDate.bgfPic,gameDate.bguPic,gameDate.bgSize);
         initSbg(param3);
         Main.soundDealer.changeMusic(gameDate.bgMusic);
         initMe();
         pauseMc = new pauseMC(keyArr);
         this.addChild(pauseMc);
         §§push(pauseMc);
         if(false)
         {
            return;
         }
         §§pop().visible = false;
      }
      
      private function checkMASite() : *
      {
         if(gameDate.enemyArr.length > 0)
         {
            if(mainActor1.thisLoader.x >= gameDate.enemyArr[0][0] * 40 + 20)
            {
               if(gameDate.enemyArr[0][1] != 0 && gameDate.enemyArr[0][2] != 0)
               {
                  §§push(stageDealer);
                  §§push(gameDate.enemyArr[0]);
                  §§push(1);
                  if(false)
                  {
                     throw true;
                  }
                  §§pop().setLockArea(§§pop()[§§pop()],gameDate.enemyArr[0][2],1,mapDealer.mapHeight - 1);
                  stageLock = true;
               }
               curEArr = gameDate.enemyArr[0][3];
               if(gameDate.specialEn.length > 0)
               {
                  if(Math.random() < 0.1)
                  {
                     curEArr.push(gameDate.specialEn.shift());
                  }
               }
               gameDate.enemyArr.shift();
               §§push(gameLevel == 10);
               if(gameLevel == 10)
               {
                  §§pop();
                  if(false)
                  {
                     return;
                  }
                  §§push(gameDate.enemyArr.length == 1);
               }
               if(§§pop())
               {
                  Main.soundDealer.changeMusic("music6");
               }
            }
         }
      }
      
      public function dealOutDoor() : *
      {
         if(doorMc != null)
         {
            if(mainActor1.commond.runup)
            {
               §§push(mainActor1.thisLoader.x >= gameDate.doorPoint[0] * 40 && mainActor1.thisLoader.x <= gameDate.doorPoint[0] * 40 + 40 && mainActor1.thisLoader.y >= gameDate.doorPoint[1] * 40);
               §§push(mainActor1.thisLoader.x >= gameDate.doorPoint[0] * 40 && mainActor1.thisLoader.x <= gameDate.doorPoint[0] * 40 + 40 && mainActor1.thisLoader.y >= gameDate.doorPoint[1] * 40);
               if(false)
               {
                  return;
               }
               if(§§pop())
               {
                  §§pop();
                  §§push(mainActor1.thisLoader.y <= gameDate.doorPoint[1] * 40 + 40);
               }
               if(§§pop())
               {
                  gameOver(true);
                  if(scoreBar.isNew)
                  {
                     gameActorDate.scoreArray[gameLevel - 1] = scoreBar.scoreNum;
                  }
                  this.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownmethod);
                  this.removeEventListener(KeyboardEvent.KEY_UP,keyUpmethod);
                  thisFather.deleteGame(true);
                  if(gameLevel == 10)
                  {
                     if(false)
                     {
                        return;
                     }
                     thisFather.showEnd();
                  }
               }
            }
         }
      }
      
      private function initControl() : *
      {
         this.addEventListener(Event.ENTER_FRAME,dealGame);
         this.addEventListener(KeyboardEvent.KEY_DOWN,keyDownmethod);
         this.addEventListener(KeyboardEvent.KEY_UP,keyUpmethod);
      }
      
      public function delEnemy(param1:allrole) : *
      {
         enemyRoleLoader.removeChild(param1.thisLoader);
      }
      
      public function showDoor() : *
      {
         doorMc = new door();
         bgMapLoader.addChild(doorMc);
         Main.keyObject.initShow(doorMc.btn,keyArr[2]);
         §§push(doorMc);
         if(false)
         {
            return false;
         }
         §§pop().x = gameDate.doorPoint[0] * 40;
         doorMc.y = gameDate.doorPoint[1] * 40;
      }
      
      public function showTip(param1:String) : *
      {
         tipShow.showTip(param1);
      }
      
      public function creatOneEnemy(param1:String, param2:int, param3:int, param4:allrole = null) : *
      {
         var _loc5_:allrole = null;
         var _loc6_:* = param1;
         switch(_loc6_)
         {
            case "l1":
            case "l2":
            case "l3":
            case "l4":
            case "l5":
            case "l6":
            case "l7":
            case "l8":
            case "l9":
            case "l10":
            case "l11":
            case "l12":
            case "l13":
            case "l14":
         }
         _loc5_ = new littlerole1(this,param2,param3,param1);
         enemyArr.push(_loc5_);
         if(stageLock)
         {
            lockEArr.push(_loc5_);
         }
         if(param1 == gameDate.bossName)
         {
            bossRole = _loc5_;
            bossBar = new bossStaBoard();
            if(false)
            {
               return false;
            }
            uiLoader.addChild(bossBar);
            bossBar.x = 330;
            bossBar.y = 20;
         }
      }
      
      private function dealGame(param1:Event) : *
      {
         if(!gameRun)
         {
            return;
         }
         ++allTimer;
         §§push(§§findproperty(checkMASite));
         if(false)
         {
            return;
         }
         §§pop().checkMASite();
         if(shakeTimer == 0)
         {
            stageDealer.changeStage();
         }
         else
         {
            shakeStage();
         }
         if(upBgLoader.numChildren > 0)
         {
            upBgLoader.x = mainLoader.x % 640;
            upBgLoader.y = mainLoader.y;
         }
         lightDealer.runThis();
         skillDealer.runThis();
         wordDealer.runThis();
         combShow.runThis();
         §§push(tipShow);
         if(false)
         {
            return;
         }
         §§pop().runThis();
         dealAllArr();
         dealOutStage();
         creatEnemyActor();
         dealBossBar();
         dealLock();
         dealOutDoor();
         if(winMc != null && winMc.currentFrame == winMc.totalFrames)
         {
            if(doorMc == null)
            {
               showDoor();
            }
         }
      }
      
      private function dealAllArr() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < teamArr.length)
         {
            if(!teamArr[_loc1_].thisOver)
            {
               teamArr[_loc1_].runMe();
               _loc1_++;
            }
            else
            {
               teamArr.splice(_loc1_,1);
            }
         }
         _loc1_ = 0;
         while(true)
         {
            if(_loc1_ >= enemyArr.length)
            {
               _loc1_ = 0;
               while(true)
               {
                  §§push(_loc1_);
                  §§push(itemArr.length);
                  if(false)
                  {
                     break;
                  }
                  if(§§pop() < §§pop())
                  {
                     §§push(itemArr[_loc1_].thisOver);
                     if(false)
                     {
                        return;
                     }
                     if(!§§pop())
                     {
                        itemArr[_loc1_].runMe();
                        _loc1_++;
                     }
                     else
                     {
                        itemArr.splice(_loc1_,1);
                     }
                  }
                  else
                  {
                     return;
                  }
               }
               throw true;
            }
            if(!enemyArr[_loc1_].thisOver)
            {
               enemyArr[_loc1_].runMe();
               _loc1_++;
            }
            else
            {
               _loc2_ = 0;
               while(_loc2_ < lockEArr.length)
               {
                  if(lockEArr[_loc2_] == enemyArr[_loc1_])
                  {
                     lockEArr.splice(_loc2_,1);
                     break;
                  }
                  _loc2_++;
               }
               §§push(enemyArr);
               §§push(_loc1_);
               §§push(1);
               if(false)
               {
                  break;
               }
               §§pop().splice(§§pop(),§§pop());
            }
         }
         throw true;
      }
      
      private function keyUpmethod(param1:KeyboardEvent) : void
      {
         switch(param1.keyCode)
         {
            case keyArr[0]:
               mainActor1.commond.runleft = false;
               break;
            case keyArr[1]:
               mainActor1.commond.runright = false;
               break;
            case keyArr[2]:
               if(false)
               {
                  return;
               }
               mainActor1.commond.runup = false;
               break;
            case keyArr[3]:
               mainActor1.commond.rundown = false;
               break;
            case keyArr[4]:
               mainActor1.commond.runattack = false;
               break;
            case keyArr[5]:
               mainActor1.commond.runjump = false;
               break;
            case keyArr[6]:
               mainActor1.commond.runskill = false;
         }
      }
      
      private function creatEnemyActor() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         §§push(curEArr.length);
         §§push(0);
         if(false)
         {
            return;
         }
         if(§§pop() <= §§pop() || lockEArr.length >= 12 || allTimer % 10 != 0)
         {
            return;
         }
         _loc1_ = Math.random();
         if(_loc1_ >= 0.5)
         {
            _loc4_ = new Point(720,200);
         }
         else
         {
            _loc4_ = new Point(-80,200);
         }
         _loc2_ = mainLoader.globalToLocal(_loc4_).x;
         if(false)
         {
            return;
         }
         _loc3_ = mainLoader.globalToLocal(_loc4_).y;
         creatOneEnemy(curEArr.shift(),_loc2_,_loc3_);
      }
      
      public function initMe() : *
      {
         creatMainActor();
         initControl();
      }
      
      private function initSbg(param1:int) : *
      {
         var _loc2_:MovieClip = null;
         var _loc3_:* = param1;
         if(1 === _loc3_)
         {
            §§push(0);
            if(false)
            {
               return;
            }
         }
         else
         {
            §§push(3 !== _loc3_ ? 2 : 1);
         }
         switch(§§pop())
         {
            case 0:
               _loc2_ = new sbg1();
               bgMapLoader.addChild(_loc2_);
               _loc2_.x = 100;
               _loc2_.y = 450;
               Main.keyObject.initShow(_loc2_.c1,keyArr[0]);
               Main.keyObject.initShow(_loc2_.c2,keyArr[1]);
               Main.keyObject.initShow(_loc2_.c3,keyArr[4]);
               Main.keyObject.initShow(_loc2_.c4,keyArr[5]);
               Main.keyObject.initShow(_loc2_.c5,keyArr[3]);
               Main.keyObject.initShow(_loc2_.c6,keyArr[11]);
               Main.keyObject.initShow(_loc2_.c7,keyArr[12]);
               break;
            case 1:
               _loc2_ = new sbg2();
               bgMapLoader.addChild(_loc2_);
               _loc2_.x = 400;
               _loc2_.y = 490;
               Main.keyObject.initShow(_loc2_.c1,keyArr[2]);
         }
      }
      
      private function dealOutStage() : *
      {
         var _loc1_:Point = null;
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc1_ = new Point(mainActor1.thisLoader.x,mainActor1.thisLoader.y);
         _loc2_ = mainLoader.localToGlobal(_loc1_).x;
         if(_loc2_ <= 20)
         {
            if(false)
            {
               throw true;
            }
            mainActor1.thisLoader.x += 20 - _loc2_ + 1;
         }
         else if(_loc2_ >= 620)
         {
            mainActor1.thisLoader.x -= _loc2_ - 620 - 1;
         }
         _loc3_ = 0;
         while(_loc3_ < lockEArr.length)
         {
            if(lockEArr[_loc3_].thisCurHp > 0 && Boolean(lockEArr[_loc3_].hitStick))
            {
               _loc1_ = new Point(lockEArr[_loc3_].thisLoader.x,lockEArr[_loc3_].thisLoader.y);
               _loc2_ = mainLoader.localToGlobal(_loc1_).x;
               if(_loc2_ <= -80)
               {
                  _loc4_ = new Point(-80,200);
                  _loc5_ = mainLoader.globalToLocal(_loc4_).x;
                  _loc6_ = mainLoader.globalToLocal(_loc4_).y;
                  lockEArr[_loc3_].thisLoader.x = _loc5_;
                  lockEArr[_loc3_].thisLoader.y = _loc6_;
               }
               else if(_loc2_ >= 720)
               {
                  _loc4_ = new Point(720,200);
                  _loc5_ = mainLoader.globalToLocal(_loc4_).x;
                  _loc6_ = mainLoader.globalToLocal(_loc4_).y;
                  lockEArr[_loc3_].thisLoader.x = _loc5_;
                  if(false)
                  {
                     return false;
                  }
                  lockEArr[_loc3_].thisLoader.y = _loc6_;
               }
            }
            _loc3_++;
         }
      }
      
      public function delPet(param1:allrole) : *
      {
         petRoleLoader.removeChild(param1.thisLoader);
      }
      
      private function creatMainActor() : *
      {
         mainActor1 = new mainrole(this,100,100,gameActorDate);
         teamArr.push(mainActor1);
         if(gameActorDate.rolePet[gameActorDate.curPet] != null)
         {
            creatNewPet(gameActorDate.rolePet[gameActorDate.curPet],mainActor1,mainActor1.thisLoader.x,mainActor1.thisLoader.y);
         }
      }
      
      private function initLoader() : *
      {
         farBgLoader = new MovieClip();
         addChild(farBgLoader);
         mainLoader = new MovieClip();
         backgroundLoader = new MovieClip();
         §§push(§§findproperty(bgMapLoader));
         §§push(§§findproperty(MovieClip));
         if(false)
         {
            return;
         }
         §§pop().bgMapLoader = new §§pop().MovieClip();
         mainRoleLoader = new MovieClip();
         petRoleLoader = new MovieClip();
         enemyRoleLoader = new MovieClip();
         lightLoader = new MovieClip();
         hitShowLoader = new MovieClip();
         itemLoader = new MovieClip();
         this.addChild(mainLoader);
         mainLoader.addChild(backgroundLoader);
         backgroundLoader.alpha = 0;
         mainLoader.addChild(bgMapLoader);
         mainLoader.addChild(enemyRoleLoader);
         mainLoader.addChild(mainRoleLoader);
         mainLoader.addChild(petRoleLoader);
         §§push(mainLoader);
         if(false)
         {
            return;
         }
         §§pop().addChild(itemLoader);
         mainLoader.addChild(lightLoader);
         mainLoader.addChild(hitShowLoader);
         upBgLoader = new MovieClip();
         addChild(upBgLoader);
         combShow = new combshow();
         addChild(combShow);
         combShow.alpha = 0;
         combShow.x = 450;
         combShow.y = 100;
         uiLoader = new MovieClip();
         §§push(§§findproperty(addChild));
         if(false)
         {
            return;
         }
         §§pop().addChild(uiLoader);
         tipShow = new tipshow();
         addChild(tipShow);
         tipShow.x = 300;
         tipShow.y = 400;
         initScoreBar();
      }
      
      public function creatNewPet(param1:Object, param2:allrole, param3:int, param4:int) : petrole
      {
         var _loc5_:petrole = null;
         var _loc6_:* = param1.pName;
         §§push("p1_1");
         §§push(_loc6_);
         if(false)
         {
            return;
         }
         §§push(§§pop() !== §§pop() ? ("p1_2" === _loc6_ ? 1 : ("p1_3" === _loc6_ ? 2 : 3)) : 0);
         if(false)
         {
            return false;
         }
         switch(§§pop())
         {
            case 0:
               _loc5_ = new petrole1_1(this,param1,param2,param3,param4);
               break;
            case 1:
               _loc5_ = new petrole1_2(this,param1,param2,param3,param4);
               break;
            case 2:
               _loc5_ = new petrole1_3(this,param1,param2,param3,param4);
         }
         teamArr.push(_loc5_);
         return _loc5_;
      }
      
      public function giveExp(param1:int) : *
      {
         var _loc2_:int = 0;
         _loc2_ = param1 + Math.floor(combShow.hitNum / 5);
         mainActor1.getExp(_loc2_);
         §§push(mainActor1.myPet);
         if(false)
         {
            return;
         }
         if(§§pop() != null)
         {
            mainActor1.myPet.getExp(_loc2_);
         }
      }
      
      private function initScoreBar() : *
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         _loc1_ = 0;
         _loc2_ = 0;
         while(_loc2_ < gameActorDate.scoreArray.length)
         {
            if(false)
            {
               throw true;
            }
            _loc1_ += gameActorDate.scoreArray[_loc2_];
            _loc2_++;
         }
         if(gameActorDate.scoreArray[gameLevel - 1] == 0)
         {
            scoreBar = new scoreshow(this,gameLevel,_loc1_,true);
         }
         else
         {
            scoreBar = new scoreshow(this,gameLevel,0,false);
         }
         uiLoader.addChild(scoreBar);
         scoreBar.x = 280;
         scoreBar.y = 450;
      }
      
      public function dealBossBar() : *
      {
         if(bossBar != null)
         {
            bossBar.hpBar.x = bossRole.thisCurHp / bossRole.thisAllHp * 300 - 300;
            if(bossRole.thisCurHp <= 0)
            {
               uiLoader.removeChild(bossBar);
               bossBar = null;
            }
         }
      }
      
      public function petEvolve(param1:Object, param2:petrole) : *
      {
         var _loc3_:petrole = null;
         var _loc4_:* = undefined;
         §§push(§§findproperty(creatNewPet));
         §§push(param1);
         §§push(param2.myMaster);
         §§push(param2.thisLoader.x);
         §§push(param2.thisLoader);
         if(false)
         {
            throw true;
         }
         _loc3_ = §§pop().creatNewPet(§§pop(),§§pop(),§§pop(),§§pop().y);
         _loc3_.changTar(param2.curTar);
         _loc3_.addSpecialLight("llvup");
         _loc3_.addSound("lvup");
         _loc4_ = 0;
         while(_loc4_ < enemyArr.length)
         {
            if(enemyArr[_loc4_].curTar == param2)
            {
               enemyArr[_loc4_].changTar(_loc3_);
            }
            _loc4_++;
         }
      }
      
      private function shakeStage() : *
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         --shakeTimer;
         if(shakeTimer == 0)
         {
            mainLoader.x = saveLoadX;
            mainLoader.y = saveLoadY;
         }
         else
         {
            _loc1_ = Math.floor(Math.random() * 10 - 5);
            §§push(Math);
            §§push(Math.random() * 10);
            §§push(5);
            if(false)
            {
               return;
            }
            _loc2_ = §§pop().floor(§§pop() - §§pop());
            mainLoader.x += _loc1_;
            mainLoader.y += _loc2_;
            if(false)
            {
               return;
            }
         }
      }
      
      private function dealLock() : *
      {
         if(lockEArr.length <= 0 && curEArr.length <= 0)
         {
            stageDealer.setLockArea(0,mapDealer.mapWidth - 1,0,mapDealer.mapHeight - 1);
            stageLock = false;
            if(gameDate.enemyArr.length <= 0)
            {
               if(winMc == null)
               {
                  Main.soundDealer.tryAddSound("win");
                  winMc = new winBoard();
                  addChild(winMc);
                  mainActor1.checkNewMap(gameDate.nextMap);
               }
            }
         }
      }
      
      public function delItem(param1:item) : *
      {
         itemLoader.removeChild(param1.thisLoader);
      }
      
      private function keyDownmethod(param1:KeyboardEvent) : void
      {
         if(overMc != null)
         {
            if(overMc.currentFrame == overMc.totalFrames)
            {
               this.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownmethod);
               this.removeEventListener(KeyboardEvent.KEY_UP,keyUpmethod);
               thisFather.deleteGame(false);
            }
            return;
         }
         if(param1.keyCode == keyArr[12])
         {
            §§push(§§findproperty(gameRun));
            §§push(gameRun);
            if(false)
            {
               return;
            }
            §§pop().gameRun = !§§pop();
            if(gameRun)
            {
               pauseMc.visible = false;
            }
            else
            {
               pauseMc.visible = true;
            }
         }
         if(param1.keyCode == keyArr[11])
         {
            mainActor1.changeWeapon();
         }
         if(gameRun)
         {
            var _loc2_:* = param1.keyCode;
            switch(_loc2_)
            {
               case keyArr[0]:
               default:
                  mainActor1.commond.runleft = true;
                  break;
               case keyArr[1]:
                  mainActor1.commond.runright = true;
                  break;
               case keyArr[2]:
                  mainActor1.commond.runup = true;
            }
            return;
         }
      }
      
      public function creatOneItem(param1:String, param2:int, param3:int) : *
      {
         var _loc4_:item = null;
         var _loc5_:* = param1;
         switch(_loc5_)
         {
            case "hps":
            case "hpm":
            case "hpb":
            default:
               _loc4_ = new itemhp(this,param2,param3,param1);
               break;
            case "mps":
            case "mpm":
            case "mpb":
               _loc4_ = new itemmp(this,param2,param3,param1);
               break;
            case "exps":
            case "expm":
            case "expb":
               _loc4_ = new itemexp(this,param2,param3,param1);
         }
         itemArr.push(_loc4_);
      }
      
      public function setShake(param1:int) : *
      {
         shakeTimer = param1;
         saveLoadX = mainLoader.x;
         saveLoadY = mainLoader.y;
      }
      
      private function loadBgPic(param1:String, param2:String, param3:String, param4:Array) : *
      {
         var _loc5_:Class = null;
         var _loc6_:* = undefined;
         var _loc7_:MovieClip = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:* = undefined;
         var _loc11_:* = undefined;
         var _loc12_:BitmapData = null;
         var _loc13_:Bitmap = null;
         §§push(getDefinitionByName(param1));
         if(false)
         {
            return;
         }
         _loc5_ = §§pop() as Class;
         _loc6_ = new _loc5_();
         _loc7_ = new MovieClip();
         _loc7_.addChild(_loc6_);
         _loc8_ = Math.ceil(param4[0] / 16);
         _loc9_ = Math.ceil(param4[1] / 16);
         _loc10_ = 0;
         while(_loc10_ < _loc9_)
         {
            _loc11_ = 0;
            while(_loc11_ < _loc8_)
            {
               _loc6_.x = -_loc11_ * 640;
               _loc6_.y = -_loc10_ * 480;
               _loc12_ = new BitmapData(640,480,true,0);
               _loc12_.draw(_loc7_);
               _loc13_ = new Bitmap(_loc12_);
               bgMapLoader.addChild(_loc13_);
               _loc13_.x = _loc11_ * 640;
               _loc13_.y = _loc10_ * 480;
               _loc11_++;
            }
            _loc10_++;
         }
         §§push(getDefinitionByName(param2));
         if(false)
         {
            return;
         }
         _loc5_ = §§pop() as Class;
         _loc6_ = new _loc5_();
         farBgLoader.addChild(_loc6_);
         if(param3 != "")
         {
            _loc5_ = getDefinitionByName(param3) as Class;
            _loc6_ = new _loc5_();
            upBgLoader.addChild(_loc6_);
         }
      }
      
      public function gameOver(param1:Boolean) : *
      {
         if(!param1)
         {
            Main.soundDealer.tryAddSound("lose");
            overMc = new overBoard();
            addChild(overMc);
         }
         this.removeEventListener(Event.ENTER_FRAME,dealGame);
      }
      
      public function delMainActor(param1:allrole) : *
      {
         mainRoleLoader.removeChild(param1.thisLoader);
      }
      
      private function initAllDealer() : *
      {
         mapDealer = new mapdealer(this,gameDate.bgCell);
         stageDealer = new stagedealer(this);
         lightDealer = new lightdealer(this);
         if(false)
         {
            return false;
         }
         skillDealer = new skilldealer(this);
         wordDealer = new worddealer(this);
      }
   }
}

