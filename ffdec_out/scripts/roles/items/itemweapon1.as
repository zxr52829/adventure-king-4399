package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemweapon1 extends item
   {
      public var thisNum:int;
      
      public function itemweapon1(param1:fightMain, param2:int, param3:int, param4:String)
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
         §§push(thisObj);
         if(false)
         {
            return;
         }
         §§pop().addChild(actLoader);
         tarArray = thisFather.teamArr;
      }
      
      override public function doThisEffect(param1:mainrole) : *
      {
         param1.getNewEquip(thisNum,"weapon1");
      }
      
      override public function initThisByName(param1:String) : *
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "ws2":
            default:
               actLoader = new ws2_i();
               thisNum = 2;
               break;
            case "ws3":
               actLoader = new ws3_i();
               if(false)
               {
                  return false;
               }
               thisNum = 3;
               break;
            case §§push("ws4"), §§pop():
               actLoader = new ws4_i();
               thisNum = 4;
               break;
            case "ws5":
               actLoader = new ws5_i();
               thisNum = 5;
               break;
            case "ws6":
               actLoader = new ws6_i();
               thisNum = 6;
               break;
            case §§push("ws7"), §§pop():
               actLoader = new ws7_i();
               thisNum = 7;
               break;
            case "ws8":
               actLoader = new ws8_i();
               thisNum = 8;
               break;
            case "ws9":
               actLoader = new ws9_i();
               thisNum = 9;
         }
      }
   }
}

