package bg
{
   public class cell13 extends allMapCell
   {
      private var footY:int;
      
      public function cell13(param1:int, param2:int)
      {
         super();
         beforeCheck = true;
         thisX = param1;
         thisY = param2;
         thisObj = new bg13();
         addChild(thisObj);
      }
      
      private function getFlooy(param1:int) : int
      {
         return Math.floor(40 - (40 - param1 + thisX) / 40 * 20);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         if(param3 == "onfloor")
         {
            footY = getFlooy(param1);
            param2 = thisY + footY;
         }
         if(param2 >= thisY + footY)
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
            param4 = thisY + footY;
         }
         return [param3,param4];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         if(param4 >= thisY + 20 && param1 <= thisX)
         {
            countX = thisX - 1;
         }
         else
         {
            §§push(param5 == "fly");
            if(param5 == "fly")
            {
               §§pop();
               §§push(param4 <= thisY + getFlooy(param1));
               if(false)
               {
                  return false;
               }
            }
            if(§§pop() && param4 >= thisY + getFlooy(param3))
            {
               countX = param1;
            }
            else
            {
               countX = param3;
            }
         }
         return countX;
      }
      
      override public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         if(param2 > thisY + 40)
         {
            countY = thisY + 41;
         }
         else
         {
            footY = getFlooy(param3);
            if(param4 - thisY >= footY && param2 - thisY <= footY)
            {
               if(false)
               {
                  return;
               }
               countY = thisY + footY;
            }
            else
            {
               countY = param4;
            }
         }
         return countY;
      }
   }
}

§§push(§§findproperty(cell13));
§§push(allMapCell);
if(false)
{
   return false;
}

