package bg
{
   public class cell15 extends allMapCell
   {
      private var footY:int;
      
      public function cell15(param1:int, param2:int)
      {
         super();
         beforeCheck = true;
         thisX = param1;
         thisY = param2;
         thisObj = new bg15();
         addChild(thisObj);
      }
      
      private function getFlooy(param1:int) : int
      {
         return Math.floor(40 - (40 - param1 + thisX) / 40 * 20 - 20);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         if(param3 == "onfloor")
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
            param4 = thisY + footY;
         }
         return [param3,param4];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         if(param1 <= thisX)
         {
            countX = thisX - 1;
         }
         else
         {
            §§push(param1 >= thisX + 40);
            if(false)
            {
               return;
            }
            if(§§pop() && param2 > thisY + 20)
            {
               countX = thisX + 41;
            }
            else
            {
               §§push(param5 == "fly" && param4 <= thisY + getFlooy(param1));
               if(param5 == "fly" && param4 <= thisY + getFlooy(param1))
               {
                  §§pop();
                  §§push(param4);
                  §§push(thisY);
                  §§push(§§findproperty(getFlooy));
                  if(false)
                  {
                     return;
                  }
                  §§push(§§pop() >= §§pop() + §§pop().getFlooy(param3));
               }
               if(!§§pop())
               {
                  countX = param3;
               }
               else
               {
                  countX = param1;
               }
            }
         }
         return countX;
      }
      
      override public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         if(param2 >= thisY + 40)
         {
            countY = thisY + 41;
         }
         else
         {
            §§push(§§findproperty(footY));
            §§push(§§findproperty(getFlooy));
            if(false)
            {
               return;
            }
            §§pop().footY = §§pop().getFlooy(param3);
            §§push(param4 - thisY >= footY);
            if(param4 - thisY >= footY)
            {
               §§pop();
               §§push(param2 - thisY <= footY);
               if(false)
               {
                  return;
               }
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
         return countY;
      }
   }
}

§§push(§§findproperty(cell15));
§§push(MovieClip);
if(false)
{
   return;
}

