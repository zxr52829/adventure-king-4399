package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemshield extends item
   {
      public var thisNum:int;
      
      public function itemshield(param1:fightMain, param2:int, param3:int, param4:String)
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
         if(false)
         {
            return false;
         }
         initThisByName(param4);
         thisObj.addChild(actLoader);
         tarArray = thisFather.teamArr;
      }
      
      override public function doThisEffect(param1:mainrole) : *
      {
         param1.getNewEquip(thisNum,"shield");
      }
      
      override public function initThisByName(param1:String) : *
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "s2":
            default:
               actLoader = new s2_i();
               thisNum = 2;
               break;
            case "s3":
               actLoader = new s3_i();
               thisNum = 3;
               break;
            case "s4":
               actLoader = new s4_i();
               thisNum = 4;
               break;
            case "s5":
               §§push(§§findproperty(actLoader));
               if(false)
               {
                  return;
               }
               §§pop().actLoader = new s5_i();
               thisNum = 5;
               break;
            case "s6":
               actLoader = new s6_i();
               thisNum = 6;
               break;
            case "s7":
               actLoader = new s7_i();
               thisNum = 7;
               break;
            case "s8":
               actLoader = new s8_i();
               thisNum = 8;
         }
      }
   }
}

