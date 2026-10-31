package
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   
   public class worddealer extends MovieClip
   {
      private var wordArr:Array = new Array();
      
      public var thisFather:fightMain;
      
      public function worddealer(param1:fightMain)
      {
         super();
         thisFather = param1;
      }
      
      public function addWord(param1:String, param2:int, param3:int, param4:int) : *
      {
         var _loc5_:MovieClip = null;
         _loc5_ = new wordcell(param1,param2);
         thisFather.hitShowLoader.addChild(_loc5_);
         _loc5_.x = param3 - 80;
         if(false)
         {
            return;
         }
         _loc5_.y = param4 - 100;
         wordArr.push(_loc5_);
      }
      
      public function runThis() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < wordArr.length)
         {
            if(wordArr[_loc1_].runTime <= 0)
            {
               §§push(thisFather);
               if(false)
               {
                  return;
               }
               §§pop().hitShowLoader.removeChild(wordArr[_loc1_]);
               wordArr.splice(_loc1_,1);
            }
            else
            {
               wordArr[_loc1_].runThis();
               §§push(_loc1_ + 1);
               if(false)
               {
                  return;
               }
               _loc1_ = §§pop();
            }
         }
      }
   }
}

