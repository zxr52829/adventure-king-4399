package
{
   public class MethodUtil
   {
      public function MethodUtil()
      {
         super();
      }
      
      public static function create(param1:Function, ... rest) : Function
      {
         var f:Function = param1;
         var arg:Array = rest;
         return function(... rest):void
         {
            f.apply(null,rest.concat(arg));
         };
      }
   }
}

