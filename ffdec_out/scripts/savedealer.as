package
{
   import flash.net.*;
   
   public class savedealer
   {
      public var tempDate:Object;
      
      public var curDate:Object;
      
      public var defDate:Object;
      
      public var haveSd:Boolean = false;
      
      public function savedealer()
      {
         §§push(§§findproperty(defDate));
         §§push("roleName");
         §§push("");
         §§push("roleLevel");
         §§push(1);
         §§push("roleExp");
         §§push(0);
         §§push("roleWeapon1");
         §§push(1);
         §§push("roleWeapon2");
         §§push(1);
         §§push("roleShield");
         §§push(1);
         §§push("roleDress");
         §§push(1);
         §§push("rolePet");
         §§push([]);
         §§push("curPet");
         §§push(0);
         §§push("mapArray");
         §§push(["1"]);
         §§push("curWeapon");
         §§push(1);
         §§push("keyArray");
         §§push(65);
         §§push(68);
         §§push(87);
         §§push(83);
         §§push(74);
         §§push(75);
         §§push(76);
         if(false)
         {
            return;
         }
         §§push(null);
         §§push("scoreArray");
         §§push(0);
         §§push(0);
         §§push(0);
         §§push(0);
         §§push(0);
         §§push(0);
         §§push(0);
         if(false)
         {
            return;
         }
         §§pop().defDate = null;
         curDate = new Object();
         tempDate = new Object();
         §§push(§§findproperty(haveSd));
         §§push(false);
         if(false)
         {
            return;
         }
         §§pop().haveSd = §§pop();
         super();
      }
      
      public function saveDate() : *
      {
         var _loc1_:SharedObject = null;
         _loc1_ = SharedObject.getLocal("SavedData");
         _loc1_.data.dateObj = ObjectUtil.baseClone(curDate);
      }
      
      public function loadDate() : *
      {
         var _loc1_:SharedObject = null;
         _loc1_ = SharedObject.getLocal("SavedData");
         curDate = ObjectUtil.baseClone(_loc1_.data.dateObj);
      }
      
      public function checkDate() : Boolean
      {
         var _loc1_:SharedObject = null;
         _loc1_ = SharedObject.getLocal("SavedData");
         if(_loc1_.data.dateObj != null)
         {
            haveSd = true;
            if(false)
            {
               return;
            }
            if(_loc1_.data.dateObj.curWeapon == undefined)
            {
               _loc1_.data.dateObj.curWeapon = 1;
            }
            §§push(_loc1_.data.dateObj.keyArray);
            §§push(undefined);
            if(false)
            {
               return;
            }
            if(§§pop() == §§pop())
            {
               _loc1_.data.dateObj.keyArray = [65,68,87,83,74,75,76,49,50,51,52,67,80];
            }
            if(_loc1_.data.dateObj.scoreArray == undefined)
            {
               _loc1_.data.dateObj.scoreArray = [0,0,0,0,0,0,0,0,0,0];
            }
         }
         return haveSd;
      }
   }
}

