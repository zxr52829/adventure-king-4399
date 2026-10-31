package bg
{
   public class cell3 extends allMapCell
   {
      public function cell3(param1:int, param2:int)
      {
         super();
         thisX = param1;
         thisY = param2;
         thisObj = new bg3();
         addChild(thisObj);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         countSite = param3;
         if(param1 > 30 + thisX || param1 < 10 + thisX)
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
         return param4;
      }
      
      override public function checkClimb(param1:int, param2:int) : *
      {
         if(param1 >= thisX + 10 && param1 <= thisX + 30)
         {
            §§push(true);
            if(false)
            {
               return;
            }
            return §§pop();
         }
         return false;
      }
   }
}

