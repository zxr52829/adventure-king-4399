package bg
{
   public class cell12 extends allMapCell
   {
      private var footY:int;
      
      public function cell12(param1:int, param2:int)
      {
         super();
         beforeCheck = true;
         thisX = param1;
         thisY = param2;
         thisObj = new bg12();
         addChild(thisObj);
      }
      
      private function getFlooy(param1:int) : int
      {
         return Math.floor(40 - (param1 - thisX) / 40 * 20 - 20);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         if(param3 == "onfloor" && param2 != thisY + 40)
         {
            footY = getFlooy(param1);
            param2 = thisY + footY;
         }
         if(param2 == thisY + footY)
         {
            countSite = "onfloor";
         }
         else
         {
            countSite = "fly";
         }
         return [param1,param2,countSite];
      }
      
      override public function checkNew(param1:int, param2:int, param3:int, param4:int, param5:String) : Array
      {
         if(param5 == "onfloor")
         {
            footY = getFlooy(param3);
            §§push(thisY + footY);
            if(false)
            {
               throw true;
            }
            param4 = §§pop();
         }
         return [param3,param4];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         §§push(param5 == "fly" && param4 <= thisY + getFlooy(param1));
         if(param5 == "fly" && param4 <= thisY + getFlooy(param1))
         {
            §§pop();
            if(false)
            {
               return false;
            }
            §§push(param4 >= thisY + getFlooy(param3));
         }
         if(§§pop())
         {
            return param1;
         }
         return param3;
      }
      
      override public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         footY = getFlooy(param3);
         if(param4 - thisY >= footY && param2 - thisY < footY)
         {
            countY = thisY + footY;
         }
         else
         {
            countY = param4;
         }
         return countY;
      }
   }
}

§§push(§§findproperty(cell12));
§§push(Sprite);
if(false)
{
   return;
}

