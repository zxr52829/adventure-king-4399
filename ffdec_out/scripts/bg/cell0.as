package bg
{
   public class cell0 extends allMapCell
   {
      public function cell0(param1:int, param2:int)
      {
         super();
         thisX = param1;
         thisY = param2;
         thisObj = new bg0();
         addChild(thisObj);
      }
      
      override public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         return [param1,param2,"fly"];
      }
      
      override public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         return param3;
      }
      
      override public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         return param4;
      }
   }
}

§§push(§§findproperty(cell0));
if(false)
{
   return false;
}

