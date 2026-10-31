package roles.items
{
   import flash.display.MovieClip;
   import roles.mainrole;
   
   public class itemweapon2 extends item
   {
      public var thisNum:int;
      
      public function itemweapon2(param1:fightMain, param2:int, param3:int, param4:String)
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
            return;
         }
         initThisByName(param4);
         thisObj.addChild(actLoader);
         tarArray = thisFather.teamArr;
      }
      
      override public function doThisEffect(param1:mainrole) : *
      {
         param1.getNewEquip(thisNum,"weapon2");
      }
      
      override public function initThisByName(param1:String) : *
      {
         switch(param1)
         {
            case "wd2":
               actLoader = new wd2_i();
               thisNum = 2;
               break;
            case "wd3":
               actLoader = new wd3_i();
               thisNum = 3;
               break;
            case "wd4":
               actLoader = new wd4_i();
               thisNum = 4;
               break;
            case "wd5":
               actLoader = new wd5_i();
               §§push(§§findproperty(thisNum));
               §§push(5);
               if(false)
               {
                  return false;
               }
               §§pop().thisNum = §§pop();
               break;
            case "wd6":
               actLoader = new wd6_i();
               thisNum = 6;
               break;
            case "wd7":
               §§push(§§findproperty(actLoader));
               §§push(§§findproperty(wd7_i));
               if(false)
               {
                  return;
               }
               §§pop().actLoader = new §§pop().wd7_i();
               thisNum = 7;
               break;
            case "wd8":
               actLoader = new wd8_i();
               thisNum = 8;
               break;
            case "wd9":
               if(false)
               {
                  return false;
               }
               actLoader = new wd9_i();
               thisNum = 9;
               break;
            case "wd10":
               actLoader = new wd10_i();
               §§push(§§findproperty(thisNum));
               if(false)
               {
                  return false;
               }
               §§pop().thisNum = 10;
               break;
         }
      }
   }
}

