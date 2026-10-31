package bg
{
   public class cell2 extends allMapCell
   {
      public function cell2(param1:int, param2:int)
      {
         super();
         thisX = param1;
         thisY = param2;
         thisObj = new bg2();
         addChild(thisObj);
      }
      
      private function checkLineX1(param1:int, param2:int) : *
      {
         if(param1 <= thisX)
         {
            countX = thisX - 1;
         }
      }
      
      private function checkLineY1(param1:int, param2:int) : *
      {
         if(param1 <= thisY)
         {
            countY = thisY;
         }
      }
      
      private function checkLineY2(param1:int, param2:int) : *
      {
         if(param1 >= thisY + 40)
         {
            countY = thisY + 41;
         }
      }
      
      private function checkLineX2(param1:int, param2:int) : *
      {
         if(param1 >= thisX + 40)
         {
            countX = thisX + 41;
         }
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         return [param1,param2,"fly"];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         checkLineX1(param1,param3);
         checkLineX2(param1,param3);
         return countX;
      }
      
      override public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         checkLineY1(param2,param4);
         checkLineY2(param2,param4);
         return countY;
      }
   }
}

§§push(§§findproperty(cell2));
if(false)
{
   return;
}

