package
{
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   
   public class creatMc extends MovieClip
   {
      internal var allPic:MovieClip;
      
      public var allPicArr:Array;
      
      internal var showPic:MovieClip;
      
      public function creatMc(param1:Array)
      {
         super();
         allPic = new MovieClip();
         showPic = new MovieClip();
         allPicArr = new Array();
         §§push(§§findproperty(initAllPic));
         §§push(param1);
         if(false)
         {
            throw true;
         }
         §§pop().initAllPic(§§pop());
         drawPic();
      }
      
      private function initAllPic(param1:Array) : *
      {
         var _loc2_:* = undefined;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:MovieClip = null;
         _loc2_ = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_];
            _loc4_ = getDefinitionByName(_loc3_) as Class;
            _loc5_ = new _loc4_();
            allPic.addChild(_loc5_);
            _loc2_++;
         }
      }
      
      private function drawPic() : *
      {
         var _loc1_:* = null;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Point = null;
         var _loc7_:Rectangle = null;
         var _loc8_:BitmapData = null;
         §§push(new BitmapData(1128,2748,true,0));
         if(false)
         {
            return;
         }
         _loc1_ = §§pop();
         _loc1_.draw(allPic);
         _loc2_ = 0;
         while(_loc2_ <= 10)
         {
            _loc3_ = 0;
            while(_loc3_ <= 3)
            {
               _loc4_ = _loc3_ * 282;
               _loc5_ = _loc2_ * 229;
               _loc6_ = new Point(0,0);
               _loc7_ = new Rectangle(_loc4_,_loc5_,282,229);
               _loc8_ = new BitmapData(282,229,true,0);
               _loc8_.copyPixels(_loc1_,_loc7_,_loc6_);
               allPicArr.push(_loc8_);
               _loc3_++;
            }
            _loc2_++;
         }
      }
   }
}

