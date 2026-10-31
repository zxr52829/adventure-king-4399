package
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class lightdealer extends MovieClip
   {
      private var curFrameHitArr:Array = new Array();
      
      private var lightArr:Array = new Array();
      
      public var thisFather:fightMain;
      
      public function lightdealer(param1:fightMain)
      {
         super();
         thisFather = param1;
      }
      
      public function addHitLight(param1:String, param2:int, param3:int, param4:int) : *
      {
         var _loc5_:* = undefined;
         var _loc6_:Class = null;
         var _loc7_:* = undefined;
         _loc5_ = 0;
         while(_loc5_ < curFrameHitArr.length)
         {
            if(Math.abs(param2 - curFrameHitArr[_loc5_][0]) < 20 && Math.abs(param3 - curFrameHitArr[_loc5_][1]) < 20)
            {
               return;
            }
            _loc5_++;
         }
         curFrameHitArr.push([param2,param3]);
         _loc6_ = getDefinitionByName(param1) as Class;
         _loc7_ = new _loc6_();
         _loc7_.gotoAndStop(1);
         thisFather.lightLoader.addChild(_loc7_);
         _loc7_.x = param2;
         _loc7_.y = param3;
         _loc7_.scaleX = param4;
         lightArr.push(_loc7_);
      }
      
      public function addLight(param1:String, param2:int, param3:int, param4:int) : *
      {
         var _loc5_:Class = null;
         var _loc6_:* = undefined;
         _loc5_ = getDefinitionByName(param1) as Class;
         _loc6_ = new _loc5_();
         _loc6_.gotoAndStop(1);
         thisFather.lightLoader.addChild(_loc6_);
         _loc6_.x = param2;
         _loc6_.y = param3;
         _loc6_.scaleX = param4;
         lightArr.push(_loc6_);
      }
      
      public function runThis() : *
      {
         var _loc1_:* = undefined;
         curFrameHitArr = new Array();
         _loc1_ = 0;
         while(_loc1_ < lightArr.length)
         {
            §§push(lightArr);
            §§push(_loc1_);
            if(false)
            {
               return;
            }
            if(§§pop()[§§pop()].currentFrame == lightArr[_loc1_].totalFrames)
            {
               thisFather.lightLoader.removeChild(lightArr[_loc1_]);
               lightArr.splice(_loc1_,1);
            }
            else
            {
               lightArr[_loc1_].nextFrame();
               _loc1_++;
            }
         }
      }
   }
}

§§push(§§findproperty(lightdealer));
if(false)
{
   return;
}

