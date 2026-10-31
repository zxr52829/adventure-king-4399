package bg
{
   public class cell6 extends allMapCell
   {
      private var footY:int;
      
      public function cell6(param1:int, param2:int)
      {
         super();
         beforeCheck = true;
         thisX = param1;
         thisY = param2;
         thisObj = new bg6();
         §§push(§§findproperty(addChild));
         if(false)
         {
            return;
         }
         §§pop().addChild(thisObj);
      }
      
      private function checkLineY1(param1:int, param2:int, param3:int, param4:int, param5:String) : *
      {
         footY = getFlooy(param3);
         §§push(param4 - thisY >= footY);
         if(param4 - thisY >= footY)
         {
            §§pop();
            §§push(param2);
            if(false)
            {
               throw true;
            }
            §§push(§§pop() - thisY < footY);
         }
         if(§§pop())
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
         return Math.floor(40 - (param1 - thisX) / 40 * 20);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         if(param3 == "onfloor" && param2 != thisY + 40)
         {
            footY = getFlooy(param1);
            param2 = thisY + footY;
         }
         §§push(param2 == thisY + 40);
         §§push(param2 == thisY + 40);
         if(false)
         {
            return false;
         }
         if(!§§pop())
         {
            §§pop();
            §§push(param2 == thisY + footY);
         }
         if(§§pop())
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
         if(param5 == "fly" && param4 <= thisY + getFlooy(param1) && param4 >= thisY + getFlooy(param3))
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
            checkLineY2(param1,param2,param3,param4,param5);
         }
         return countY;
      }
      
      override public function checkChangeLine(param1:int, param2:int) : *
      {
         if(param1 <= thisX + 10 && param2 > thisY + 35)
         {
            return true;
         }
         return false;
      }
   }
}

§§push(§§findproperty(cell6));
if(false)
{
   return;
}

