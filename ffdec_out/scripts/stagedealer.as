package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class stagedealer extends MovieClip
   {
      public var lockTop:int;
      
      public var lockBottom:int;
      
      public var thisFather:fightMain;
      
      public var lockRight:int;
      
      public var lockLeft:int;
      
      public function stagedealer(param1:fightMain)
      {
         super();
         thisFather = param1;
         §§push(§§findproperty(setLockArea));
         §§push(0);
         §§push(thisFather.mapDealer.mapWidth - 1);
         §§push(0);
         §§push(thisFather);
         if(false)
         {
            return;
         }
         §§pop().setLockArea(§§pop(),§§pop(),§§pop(),§§pop().mapDealer.mapHeight - 1);
      }
      
      public function changeStage() : *
      {
         var _loc1_:Point = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         §§push(§§findproperty(Point));
         §§push(thisFather);
         if(false)
         {
            return;
         }
         _loc1_ = new §§pop().Point(§§pop().mainActor1.thisLoader.x,thisFather.mainActor1.thisLoader.y);
         _loc2_ = thisFather.mainRoleLoader.localToGlobal(_loc1_).x;
         _loc3_ = thisFather.mainRoleLoader.localToGlobal(_loc1_).y;
         _loc4_ = 0;
         _loc5_ = 0;
         if(_loc2_ < 200)
         {
            _loc4_ = _loc2_ - 200;
            if(_loc4_ < -10)
            {
               _loc4_ = -10;
            }
         }
         else if(_loc2_ > 440)
         {
            _loc4_ = _loc2_ - 440;
            if(_loc4_ > 10)
            {
               _loc4_ = 10;
            }
         }
         if(_loc3_ < 200)
         {
            _loc5_ = _loc3_ - 200;
            if(false)
            {
               return;
            }
            if(_loc4_ < -10)
            {
               _loc4_ = -10;
            }
         }
         else if(_loc3_ > 380)
         {
            _loc5_ = _loc3_ - 380;
            if(_loc4_ > 10)
            {
               _loc4_ = 10;
            }
         }
         if(thisFather.mainLoader.x - _loc4_ > lockLeft)
         {
            thisFather.mainLoader.x = lockLeft;
         }
         else
         {
            §§push(thisFather);
            if(false)
            {
               return;
            }
            if(§§pop().mainLoader.x - _loc4_ >= lockRight)
            {
               thisFather.mainLoader.x -= _loc4_;
            }
            else
            {
               thisFather.mainLoader.x = lockRight;
            }
         }
         if(thisFather.mainLoader.y - _loc5_ > lockTop)
         {
            thisFather.mainLoader.y = lockTop;
         }
         else if(thisFather.mainLoader.y - _loc5_ < lockBottom)
         {
            thisFather.mainLoader.y = lockBottom;
         }
         else
         {
            thisFather.mainLoader.y -= _loc5_;
         }
         thisFather.farBgLoader.x = thisFather.mainLoader.x / 5;
         thisFather.farBgLoader.y = thisFather.mainLoader.y / 5;
      }
      
      public function setLockArea(param1:int, param2:int, param3:int, param4:int) : *
      {
         lockLeft = -(param1 * 40 + 20);
         lockRight = 640 - (param2 * 40 + 20);
         lockTop = -(param3 * 40 + 20);
         lockBottom = 480 - (param4 * 40 + 20);
      }
   }
}

