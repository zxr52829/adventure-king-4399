package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol545")]
   public class scoreshow extends MovieClip
   {
      internal var wordArr:Array = new Array();
      
      internal var isNew:Boolean;
      
      internal var thisFather:fightMain;
      
      internal var scoreNum:int = 0;
      
      internal var gameLevel:int = 1;
      
      internal var timeScore:int = 0;
      
      public function scoreshow(param1:fightMain, param2:int, param3:int, param4:Boolean)
      {
         super();
         §§push(§§findproperty(thisFather));
         if(false)
         {
            throw true;
         }
         §§pop().thisFather = param1;
         gameLevel = param2;
         isNew = param4;
         if(!isNew)
         {
            this.visible = false;
         }
         scoreNum = param3;
         getScore(0);
      }
      
      public function getScore(param1:int) : *
      {
         if(!isNew)
         {
            return;
         }
         scoreNum += param1;
         delWord();
      }
      
      private function delWord() : *
      {
         var _loc1_:Array = null;
         var _loc2_:String = null;
         var _loc3_:Class = null;
         var _loc4_:MovieClip = null;
         var _loc5_:* = undefined;
         while(wordArr.length > 0)
         {
            removeChild(wordArr.shift());
         }
         _loc1_ = scoreNum.toString().split("");
         _loc5_ = 0;
         while(_loc5_ < _loc1_.length)
         {
            _loc2_ = "s_" + _loc1_[_loc5_];
            _loc3_ = getDefinitionByName(_loc2_) as Class;
            if(false)
            {
               return;
            }
            _loc4_ = new _loc3_();
            addChild(_loc4_);
            _loc4_.x = _loc5_ * 15 + 70;
            _loc4_.y = 12;
            wordArr.push(_loc4_);
            _loc5_++;
         }
      }
   }
}

