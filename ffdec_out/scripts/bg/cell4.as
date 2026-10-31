package bg
{
   public class cell4 extends allMapCell
   {
      public function cell4(param1:int, param2:int)
      {
         super();
         thisX = param1;
         thisY = param2;
         thisObj = new bg4();
         addChild(thisObj);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         countSite = param3;
         if(param2 == thisY + 40)
         {
            countSite = "onfloor";
         }
         else if(param1 < thisX + 10 || param1 > thisX + 30)
         {
            countSite = "fly";
         }
         return [param1,param2,countSite];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         return param3;
      }
      
      override public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         §§push(param4 - thisY >= 40);
         if(param4 - thisY >= 40)
         {
            §§pop();
            §§push(param2 - thisY < 40);
            §§push(param2 - thisY < 40);
            if(false)
            {
               return;
            }
            if(§§pop())
            {
               §§pop();
               §§push(param5 == "fly");
            }
         }
         if(§§pop() || param2 - thisY == 40 && param5 == "onfloor")
         {
            countY = thisY + 40;
         }
         else
         {
            countY = param4;
         }
         return countY;
      }
      
      override public function checkClimb(param1:int, param2:int) : *
      {
         if(param1 >= thisX + 10 && param1 <= thisX + 30)
         {
            return true;
         }
         return false;
      }
   }
}

