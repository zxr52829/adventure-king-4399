package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2135")]
   public class combshow extends MovieClip
   {
      internal var wordArr:Array = new Array();
      
      public var hitNum:int = 0;
      
      public function combshow()
      {
         super();
      }
      
      public function getWord(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:String = null;
         var _loc4_:Class = null;
         var _loc5_:MovieClip = null;
         var _loc6_:* = undefined;
         hitNum = param1;
         this.alpha = 1;
         while(wordArr.length > 0)
         {
            removeChild(wordArr.shift());
         }
         _loc2_ = param1.toString().split("");
         _loc6_ = 0;
         while(_loc6_ < _loc2_.length)
         {
            _loc3_ = "w3_" + _loc2_[_loc6_];
            _loc4_ = getDefinitionByName(_loc3_) as Class;
            _loc5_ = new _loc4_();
            addChild(_loc5_);
            if(false)
            {
               return;
            }
            _loc5_.x = _loc6_ * 30 + 60;
            _loc5_.y = -45;
            wordArr.push(_loc5_);
            _loc6_++;
         }
      }
      
      public function runThis() : *
      {
         if(this.alpha > 0)
         {
            this.alpha -= 0.03;
         }
         else
         {
            hitNum = 0;
         }
      }
   }
}

§§push(§§findproperty(combshow));
if(false)
{
   throw true;
}

