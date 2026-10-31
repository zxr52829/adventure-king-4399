package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemmp extends item
   {
      public var thisNum:int;
      
      public function itemmp(param1:fightMain, param2:int, param3:int, param4:String)
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
         initThisByName(param4);
         thisObj.addChild(actLoader);
         tarArray = thisFather.teamArr;
      }
      
      override public function doThisEffect(param1:mainrole) : *
      {
         param1.changState(thisNum,"mp");
      }
      
      override public function initThisByName(param1:String) : *
      {
         switch(param1)
         {
            case "mps":
               actLoader = new mps_i();
               thisNum = 20;
               break;
            case "mpm":
               actLoader = new mpm_i();
               if(false)
               {
                  throw true;
               }
               thisNum = 50;
               break;
            case "mpb":
               actLoader = new mpb_i();
               thisNum = 100;
         }
      }
   }
}

if(false)
{
   return false;
}

