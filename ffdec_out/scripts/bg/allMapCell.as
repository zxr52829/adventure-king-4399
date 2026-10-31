package bg
{
   import flash.display.MovieClip;
   
   public class allMapCell extends MovieClip
   {
      public var countSite:String;
      
      public var countX:int;
      
      public var countY:int;
      
      public var thisY:int;
      
      public var thisObj:MovieClip;
      
      public var thisX:int;
      
      public var beforeX:int;
      
      public var beforeY:int;
      
      public var beforeCheck:Boolean = false;
      
      public var endX:int;
      
      public var endY:int;
      
      public function allMapCell()
      {
         super();
      }
      
      public function checkChangeLine(param1:int, param2:int) : *
      {
         return false;
      }
      
      public function checkSite(param1:int, param2:int, param3:String) : Array
      {
         return [param1,param2,param3];
      }
      
      public function checkMoveX(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         return param3;
      }
      
      public function checkMoveY(param1:int, param2:int, param3:int, param4:int, param5:String) : int
      {
         return param4;
      }
      
      public function checkNew(param1:int, param2:int, param3:int, param4:int, param5:String) : Array
      {
         return [param3,param4];
      }
      
      public function allMagCell() : void
      {
      }
      
      public function checkClimb(param1:int, param2:int) : *
      {
         return false;
      }
   }
}

