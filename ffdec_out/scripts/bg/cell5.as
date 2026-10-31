package bg
{
   public class cell5 extends allMapCell
   {
      private var footY:int;
      
      public function cell5(param1:int, param2:int)
      {
         super();
         beforeCheck = true;
         thisX = param1;
         thisY = param2;
         thisObj = new bg5();
         addChild(thisObj);
      }
      
      private function checkLineY1(param1:int, param2:int, param3:int, param4:int, param5:String) : *
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
      }
      
      private function checkLineY2(param1:int, param2:int, param3:int, param4:int, param5:String) : *
      {
         if(param4 - thisY >= 40 && (param2 - thisY < 40 && param5 == "fly" || param2 - thisY <= 40 && param4 - thisY > footY && param5 == "onfloor"))
         {
            countY = thisY + 40;
         }
         else
         {
            countY = param4;
         }
      }
      
      private function getFlooy(param1:int) : int
      {
         return Math.floor(40 - (40 - param1 + thisX) / 40 * 20);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         if(param3 == "onfloor" && param2 != thisY + 40)
         {
            footY = getFlooy(param1);
            param2 = thisY + footY;
         }
         if(param2 == thisY + 40 || param2 == thisY + footY)
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
         if(param5 == "onfloor" && param2 != thisY + 40)
         {
            footY = getFlooy(param3);
            param4 = thisY + footY;
         }
         return [param3,param4];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         §§push(param5 == "fly" && param4 <= thisY + getFlooy(param1));
         if(param5 == "fly" && param4 <= thisY + getFlooy(param1))
         {
            if(false)
            {
               return;
            }
            §§pop();
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
         checkLineY1(param1,param2,param3,param4,param5);
         if(countY == param4)
         {
            §§push(§§findproperty(checkLineY2));
            §§push(param1);
            §§push(param2);
            if(false)
            {
               return;
            }
            §§pop().checkLineY2(§§pop(),§§pop(),param3,param4,param5);
         }
         return countY;
      }
      
      override public function checkChangeLine(param1:int, param2:int) : *
      {
         if(param1 >= thisX + 30 && param2 > thisY + 35)
         {
            §§push(true);
            if(false)
            {
               return false;
            }
            return §§pop();
         }
         return false;
      }
   }
}

§§push(§§findproperty(cell5));
if(false)
{
   throw true;
}

