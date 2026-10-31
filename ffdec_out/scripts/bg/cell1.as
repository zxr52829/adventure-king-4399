package bg
{
   public class cell1 extends allMapCell
   {
      public function cell1(param1:int, param2:int)
      {
         super();
         thisX = param1;
         thisY = param2;
         thisObj = new bg1();
         addChild(thisObj);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         if(param2 == thisY + 40)
         {
            countSite = "onfloor";
         }
         else
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
            §§push(param2 - thisY);
            §§push(40);
            if(false)
            {
               throw true;
            }
            §§push(§§pop() < §§pop() && param5 == "fly" || param2 - thisY <= 40 && param5 == "onfloor");
         }
         if(§§pop())
         {
            countY = thisY + 40;
         }
         else
         {
            countY = param4;
         }
         return countY;
      }
   }
}

