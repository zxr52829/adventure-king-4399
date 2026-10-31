package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   public class wordcell extends MovieClip
   {
      internal var spdX:int;
      
      internal var spdY:int;
      
      internal var thisMc:MovieClip;
      
      internal var runTime:int;
      
      public function wordcell(param1:String, param2:int)
      {
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Class = null;
         var _loc6_:MovieClip = null;
         var _loc7_:* = undefined;
         §§push(§§findproperty(thisMc));
         §§push(§§findproperty(MovieClip));
         if(false)
         {
            return;
         }
         §§pop().thisMc = new §§pop().MovieClip();
         super();
         spdX = Math.floor(Math.random() * 2 - 1);
         §§push(§§findproperty(spdY));
         §§push(Math);
         §§push(-Math.random());
         if(false)
         {
            throw true;
         }
         §§pop().spdY = §§pop().floor(§§pop() * 2);
         runTime = 20;
         thisMc = new MovieClip();
         addChild(thisMc);
         _loc3_ = param2.toString().split("");
         _loc7_ = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc4_ = param1 + "_" + _loc3_[_loc7_];
            _loc5_ = getDefinitionByName(_loc4_) as Class;
            _loc6_ = new _loc5_();
            thisMc.addChild(_loc6_);
            if(_loc7_ == 0)
            {
               _loc6_.scaleX = 1.2;
               _loc6_.scaleY = 1.2;
               _loc6_.y = -10;
            }
            else
            {
               §§push(_loc6_);
               §§push(_loc7_ * 20);
               §§push(10);
               if(false)
               {
                  return false;
               }
               §§pop().x = §§pop() + §§pop();
               _loc6_.y = Math.floor(Math.random() * 4 - 2);
            }
            _loc7_++;
         }
      }
      
      public function runThis() : *
      {
         thisMc.x += spdX;
         thisMc.y += spdY;
         var _loc1_:* = §§findproperty(runTime);
         §§push(_loc1_.runTime - 1);
         if(false)
         {
            return;
         }
         var _loc2_:* = §§pop();
         _loc1_.runTime = _loc2_;
      }
   }
}

