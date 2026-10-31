package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemexp extends item
   {
      public var thisNum:int;
      
      public function itemexp(param1:fightMain, param2:int, param3:int, param4:String)
      {
         super();
         thisFather = param1;
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         thisLoader.x = param2;
         thisLoader.y = param3;
         thisFather.itemLoader.addChild(thisLoader);
         initThisSpeed();
         §§push(§§findproperty(initThisByName));
         if(false)
         {
            return;
         }
         §§pop().initThisByName(param4);
         thisObj.addChild(actLoader);
         tarArray = thisFather.teamArr;
      }
      
      override public function doThisEffect(param1:mainrole) : *
      {
         param1.getExp(thisNum);
      }
      
      override public function initThisByName(param1:String) : *
      {
         switch(param1)
         {
            case "exps":
               actLoader = new exps_i();
               thisNum = 20;
               break;
            case "expm":
               actLoader = new expm_i();
               thisNum = 100;
               break;
            case "expb":
               actLoader = new expb_i();
               thisNum = 500;
         }
      }
   }
}

