package
{
   import flash.display.*;
   import flash.events.*;
   import flash.media.*;
   import flash.utils.*;
   
   public class sounddealer extends MovieClip
   {
      public var music:Sound;
      
      public var musicCtrl:SoundChannel = new SoundChannel();
      
      public var suondArray:Array = new Array();
      
      public var curStatus:Boolean = true;
      
      public var curFramArray:Array = new Array();
      
      public function sounddealer()
      {
         if(false)
         {
            return;
         }
         super();
         this.addEventListener(Event.ENTER_FRAME,dealCur);
      }
      
      public function musicHide() : *
      {
         musicCtrl.soundTransform = new SoundTransform(0);
      }
      
      private function dealCur(param1:Event) : *
      {
         curFramArray = new Array();
      }
      
      public function changeMusic(param1:String) : *
      {
         var _loc2_:Class = null;
         musicCtrl.stop();
         _loc2_ = getDefinitionByName(param1) as Class;
         music = new _loc2_();
         musicCtrl = music.play(0,1000);
         musicCtrl.addEventListener(Event.SOUND_COMPLETE,musicReplay);
      }
      
      public function musicReplay(param1:Event) : *
      {
         musicCtrl = music.play();
      }
      
      public function soundOver(param1:Event) : *
      {
         var _loc2_:* = undefined;
         param1.target.removeEventListener(Event.SOUND_COMPLETE,musicReplay);
         _loc2_ = 0;
         while(_loc2_ < suondArray.length)
         {
            if(false)
            {
               return;
            }
            if(suondArray[_loc2_] == param1.target)
            {
               suondArray.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      public function tryAddSound(param1:String) : *
      {
         var _loc2_:* = undefined;
         _loc2_ = 0;
         while(_loc2_ < curFramArray.length)
         {
            if(param1 == curFramArray[_loc2_])
            {
               if(false)
               {
                  throw true;
               }
               return;
            }
            _loc2_++;
         }
         curFramArray.push(param1);
         addSound(param1);
      }
      
      public function changeStatus() : *
      {
         if(curStatus)
         {
            SoundMixer.soundTransform = new SoundTransform(0);
            curStatus = false;
         }
         else
         {
            SoundMixer.soundTransform = new SoundTransform(1);
            curStatus = true;
         }
      }
      
      public function addSound(param1:String) : *
      {
         var _loc2_:Sound = null;
         var _loc3_:SoundChannel = null;
         var _loc4_:Class = null;
         if(suondArray.length >= 5)
         {
            return;
         }
         _loc3_ = new SoundChannel();
         _loc4_ = getDefinitionByName(param1) as Class;
         _loc2_ = new _loc4_();
         _loc3_ = _loc2_.play();
         _loc3_.addEventListener(Event.SOUND_COMPLETE,soundOver);
         suondArray.push(_loc3_);
      }
   }
}

