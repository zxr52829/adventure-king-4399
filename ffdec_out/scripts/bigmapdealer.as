package
{
   import flash.display.*;
   import flash.events.*;
   import flash.net.*;
   
   public class bigmapdealer extends MovieClip
   {
      public var thisFather:Main;
      
      public var bigMapMc:MovieClip;
      
      public function bigmapdealer(param1:Main)
      {
         var _loc2_:* = undefined;
         super();
         thisFather = param1;
         bigMapMc = new bigMap();
         thisFather.addChild(bigMapMc);
         _loc2_ = 1;
         while(_loc2_ <= 10)
         {
            bigMapMc["btn" + _loc2_].stop();
            bigMapMc["btn" + _loc2_].addEventListener(MouseEvent.MOUSE_DOWN,MethodUtil.create(selectMap,_loc2_));
            bigMapMc["btn" + _loc2_].visible = false;
            _loc2_++;
         }
         bigMapMc.visible = false;
      }
      
      public function initBigMap(param1:Array) : *
      {
         var _loc2_:* = undefined;
         bigMapMc.visible = true;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            if(bigMapMc["btn" + param1[_loc2_]].visible == false)
            {
               bigMapMc["btn" + param1[_loc2_]].play();
               bigMapMc["btn" + param1[_loc2_]].visible = true;
            }
            _loc2_++;
         }
      }
      
      public function hidBigMap() : *
      {
         bigMapMc.visible = false;
      }
      
      private function selectMap(param1:MouseEvent, param2:int) : void
      {
         Main.soundDealer.tryAddSound("selectOk");
         thisFather.gameLevel = param2;
         thisFather.beginFight();
      }
   }
}

