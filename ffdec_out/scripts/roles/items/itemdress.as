package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemdress extends item
   {
      public var thisNum:int;
      
      public function itemdress(param1:fightMain, param2:int, param3:int, param4:String)
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
            return false;
         }
         §§pop().initThisByName(param4);
         thisObj.addChild(actLoader);
         tarArray = thisFather.teamArr;
      }
      
      override public function doThisEffect(param1:mainrole) : *
      {
         param1.getNewEquip(thisNum,"dress");
      }
      
      override public function initThisByName(param1:String) : *
      {
         switch(param1)
         {
            case "d2":
               actLoader = new d2_i();
               thisNum = 2;
               break;
            case "d3":
               actLoader = new d3_i();
               thisNum = 3;
               break;
            case "d4":
               actLoader = new d4_i();
               thisNum = 4;
               break;
            case "d5":
               actLoader = new d5_i();
               thisNum = 5;
               break;
            case "d6":
               actLoader = new d6_i();
               thisNum = 6;
               break;
            case "d7":
               actLoader = new d7_i();
               thisNum = 7;
               break;
            case "d8":
               actLoader = new d8_i();
               §§push(§§findproperty(thisNum));
               §§push(8);
               if(false)
               {
                  return;
               }
               §§pop().thisNum = §§pop();
               break;
            case "d9":
               actLoader = new d9_i();
               thisNum = 9;
               break;
            case "d10":
               actLoader = new d10_i();
               thisNum = 10;
         }
      }
   }
}

§§push(§§findproperty(itemdress));
§§push(allrole);
if(false)
{
   return false;
}

