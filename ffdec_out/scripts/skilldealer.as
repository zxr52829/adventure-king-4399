package
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import skills.*;
   
   public class skilldealer extends MovieClip
   {
      private var skillArr:Array = new Array();
      
      public var thisFather:fightMain;
      
      public function skilldealer(param1:fightMain)
      {
         super();
         thisFather = param1;
      }
      
      public function addSkill(param1:String, param2:String, param3:int, param4:int, param5:allrole, param6:allrole = null) : *
      {
         var _loc7_:Class = null;
         var _loc8_:* = undefined;
         var _loc9_:allskill = null;
         _loc7_ = getDefinitionByName(param1) as Class;
         _loc8_ = new _loc7_();
         thisFather.lightLoader.addChild(_loc8_);
         _loc8_.gotoAndStop(1);
         _loc8_.x = param3;
         §§push(_loc8_);
         §§push(param4);
         if(false)
         {
            return;
         }
         §§pop().y = §§pop();
         var _loc10_:* = param2;
         switch(_loc10_)
         {
            case "line":
         }
         _loc9_ = new lineskill(param1,_loc8_,param5);
         skillArr.push(_loc9_);
      }
      
      public function runThis() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < skillArr.length)
         {
            if(!skillArr[_loc1_].thisOver)
            {
               skillArr[_loc1_].runMe();
               _loc1_++;
            }
            else
            {
               thisFather.lightLoader.removeChild(skillArr[_loc1_].thisObj);
               §§push(skillArr);
               §§push(_loc1_);
               §§push(1);
               if(false)
               {
                  return;
               }
               §§pop().splice(§§pop(),§§pop());
            }
         }
      }
   }
}

§§push(§§findproperty(skilldealer));
if(false)
{
   return false;
}

