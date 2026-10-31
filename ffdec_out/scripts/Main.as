package
{
   import flash.display.*;
   import flash.events.*;
   import flash.media.*;
   import flash.net.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class Main extends MovieClip
   {
      public static var keyObject:keyDealer;
      
      public static var soundDealer:sounddealer = new sounddealer();
      
      public static var gameLevelDate:levelDate = new levelDate();
      
      public static var saveDealer:savedealer = new savedealer();
      
      public var makerMc:MovieClip;
      
      public var thisFight:fightMain;
      
      public var curFocusMc:MovieClip;
      
      public var continueBtn:SimpleButton;
      
      public var setKeyBoard:MovieClip;
      
      public var storyMc:MovieClip;
      
      public var bigMapDealer:bigmapdealer;
      
      public var upLayer:MovieClip = new MovieClip();
      
      public var newGameBtn:SimpleButton;
      
      public var setKeyBtn:SimpleButton;
      
      public var showMakerBtn:SimpleButton;
      
      public var gameLayer:MovieClip = new MovieClip();
      
      public var gameLevel:int = 1;
      
      public var soundBtn:soundBtnMc = new soundBtnMc();
      
      public var loadingMc:MovieClip;
      
      public function Main()
      {
         super();
         addFrameScript(0,frame1,2,frame3,12,frame13);
      }
      
      public function changeFocus(param1:MouseEvent) : *
      {
         stage.focus = curFocusMc;
      }
      
      private function showSetKey() : *
      {
         soundDealer.tryAddSound("selectOk");
         keyObject.showThis();
         curFocusMc = keyObject;
         stage.focus = keyObject;
      }
      
      public function setKeyOver() : *
      {
         soundDealer.tryAddSound("selectOk");
         curFocusMc = this;
         stage.focus = this;
      }
      
      public function fwAd_onClickStartBtn() : void
      {
         (root as MovieClip).play();
      }
      
      public function changeSoundStatus(param1:MouseEvent) : *
      {
         soundDealer.changeStatus();
         checkSoundStatus();
      }
      
      public function deleteGame(param1:Boolean) : *
      {
         gameLayer.removeChild(thisFight);
         if(param1)
         {
            saveDealer.tempDate = ObjectUtil.baseClone(saveDealer.curDate);
            saveDealer.saveDate();
         }
         else
         {
            §§push(saveDealer);
            §§push(ObjectUtil);
            if(false)
            {
               return;
            }
            §§pop().curDate = §§pop().baseClone(saveDealer.tempDate);
         }
         bigMapDealer.initBigMap(saveDealer.curDate.mapArray);
         soundDealer.changeMusic("musicBegin");
      }
      
      private function skipStoryEnd(param1:MouseEvent) : *
      {
         gotoMain();
      }
      
      private function continueGame(param1:MouseEvent) : *
      {
         soundDealer.tryAddSound("selectOk");
         saveDealer.loadDate();
         saveDealer.tempDate = ObjectUtil.baseClone(saveDealer.curDate);
         bigMapDealer.initBigMap(saveDealer.curDate.mapArray);
      }
      
      public function moveSonud(param1:MouseEvent) : *
      {
         soundDealer.tryAddSound("moveIn");
      }
      
      internal function frame3() : *
      {
         stop();
         this.addEventListener(Event.ENTER_FRAME,loadOver);
      }
      
      private function gotoFight() : *
      {
         storyMc.skipBtn.removeEventListener(MouseEvent.MOUSE_UP,skipStoryBegin);
         storyMc.removeEventListener(Event.ENTER_FRAME,checkStoryBeginOver);
         removeChild(storyMc);
         beginFight();
      }
      
      public function initAll() : *
      {
         bigMapDealer = new bigmapdealer(this);
         addChild(gameLayer);
         addChild(upLayer);
         upLayer.addChild(soundBtn);
         soundBtn.x = 616;
         soundBtn.y = 457;
         checkSoundStatus();
         initMainBtn();
         keyObject = new keyDealer(setKeyBoard,this);
         curFocusMc = this;
         soundDealer.changeMusic("musicBegin");
         this.addEventListener(MouseEvent.MOUSE_DOWN,changeFocus);
      }
      
      internal function frame1() : *
      {
         stop();
         FWAd_AS3.showAd({
            "container":this,
            "x":0,
            "y":0,
            "wid":640,
            "hei":480,
            "id":"qikeguolei-maoxianwang-1",
            "adType":"loading",
            "onClickStartBtn":fwAd_onClickStartBtn
         });
      }
      
      private function makerPlay(param1:MouseEvent) : *
      {
         makerMc.play();
      }
      
      private function setKey(param1:MouseEvent) : *
      {
         showSetKey();
      }
      
      public function showEnd() : *
      {
         storyMc = new storyEnd();
         addChild(storyMc);
         storyMc.skipBtn.addEventListener(MouseEvent.MOUSE_UP,skipStoryEnd);
         storyMc.addEventListener(Event.ENTER_FRAME,checkStoryEndOver);
      }
      
      public function initMainBtn() : *
      {
         soundBtn.addEventListener(MouseEvent.MOUSE_DOWN,changeSoundStatus);
         newGameBtn.addEventListener(MouseEvent.MOUSE_UP,setNewGame);
         newGameBtn.addEventListener(MouseEvent.MOUSE_OVER,moveSonud);
         §§push(continueBtn);
         §§push(MouseEvent);
         if(false)
         {
            return;
         }
         §§pop().addEventListener(§§pop().MOUSE_UP,continueGame);
         continueBtn.addEventListener(MouseEvent.MOUSE_OVER,moveSonud);
         setKeyBtn.addEventListener(MouseEvent.MOUSE_UP,setKey);
         §§push(setKeyBtn);
         §§push(MouseEvent.MOUSE_OVER);
         if(false)
         {
            throw true;
         }
         §§pop().addEventListener(§§pop(),moveSonud);
         showMakerBtn.addEventListener(MouseEvent.MOUSE_UP,makerPlay);
         showMakerBtn.addEventListener(MouseEvent.MOUSE_OVER,moveSonud);
         makerMc.closeBtn.addEventListener(MouseEvent.MOUSE_UP,makerPlay);
         if(!saveDealer.checkDate())
         {
            continueBtn.visible = false;
         }
      }
      
      private function skipStoryBegin(param1:MouseEvent) : *
      {
         gotoFight();
      }
      
      public function openNewWeb(param1:MouseEvent) : *
      {
         navigateToURL(new URLRequest(""),"_blank");
      }
      
      private function checkStoryEndOver(param1:Event) : *
      {
         if(storyMc.currentFrame == storyMc.totalFrames)
         {
            bigMapDealer.hidBigMap();
            storyMc.removeEventListener(Event.ENTER_FRAME,checkStoryEndOver);
            storyMc.stop();
            curFocusMc = storyMc;
            stage.focus = storyMc;
            storyMc.addEventListener(KeyboardEvent.KEY_DOWN,keyDownMethod);
         }
      }
      
      private function gotoMain() : *
      {
         if(storyMc.currentFrame == storyMc.totalFrames)
         {
            storyMc.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownMethod);
         }
         storyMc.skipBtn.removeEventListener(MouseEvent.MOUSE_UP,skipStoryEnd);
         storyMc.removeEventListener(Event.ENTER_FRAME,checkStoryEndOver);
         removeChild(storyMc);
         curFocusMc = this;
         stage.focus = this;
      }
      
      private function checkStoryBeginOver(param1:Event) : *
      {
         if(storyMc.currentFrame == storyMc.totalFrames)
         {
            storyMc.removeEventListener(Event.ENTER_FRAME,checkStoryBeginOver);
            gotoFight();
         }
      }
      
      public function checkSoundStatus() : *
      {
         if(soundDealer.curStatus)
         {
            soundBtn.gotoAndStop(1);
         }
         else
         {
            soundBtn.gotoAndStop(2);
         }
      }
      
      internal function frame13() : *
      {
         initAll();
         stop();
      }
      
      public function loadOver(param1:Event) : void
      {
         loadingMc.loadingBar.x = loaderInfo.bytesLoaded / loaderInfo.bytesTotal * 350 - 350;
         §§push(this.loaderInfo.bytesLoaded);
         if(false)
         {
            return false;
         }
         if(§§pop() >= this.loaderInfo.bytesTotal)
         {
            this.removeEventListener(Event.ENTER_FRAME,loadOver);
            this.gotoAndStop(1,"game");
         }
      }
      
      private function keyDownMethod(param1:KeyboardEvent) : void
      {
         gotoMain();
      }
      
      public function beginFight() : *
      {
         stage.stageFocusRect = false;
         if(keyObject.isChange)
         {
            saveDealer.curDate.keyArray = keyObject.keyArray;
         }
         thisFight = new fightMain(this,saveDealer.curDate,gameLevel);
         gameLayer.addChild(thisFight);
         curFocusMc = thisFight;
         stage.focus = thisFight;
      }
      
      private function setNewGame(param1:MouseEvent) : *
      {
         soundDealer.tryAddSound("selectOk");
         saveDealer.curDate = ObjectUtil.baseClone(saveDealer.defDate);
         saveDealer.tempDate = ObjectUtil.baseClone(saveDealer.curDate);
         bigMapDealer.initBigMap(saveDealer.curDate.mapArray);
         storyMc = new storyBegin();
         addChild(storyMc);
         storyMc.x = 320;
         storyMc.y = 240;
         storyMc.skipBtn.addEventListener(MouseEvent.MOUSE_UP,skipStoryBegin);
         storyMc.addEventListener(Event.ENTER_FRAME,checkStoryBeginOver);
      }
   }
}

