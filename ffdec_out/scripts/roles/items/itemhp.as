package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemhp extends item
   {
      public var thisNum:int;
      
      public function itemhp(param1:fightMain, param2:int, param3:int, param4:String)
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
         param1.changState(thisNum,"hp");
      }
      
      override public function initThisByName(param1:String) : *
      {
         var _loc2_:* = param1;
         if(false)
         {
            return;
         }
         switch(_loc2_)
         {
            case "hps":
               actLoader = new hps_i();
               thisNum = 50;
               break;
            case "hpm":
               actLoader = new hpm_i();
               thisNum = 200;
               break;
            case "hpb":
               actLoader = new hpb_i();
               thisNum = 500;
         }
      }
   }
}

§§push(§§findproperty(itemhp));
if(false)
{
   return;
}

