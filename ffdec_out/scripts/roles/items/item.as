package roles.items
{
   import flash.display.MovieClip;
   import roles.allrole;
   import roles.mainrole;
   
   public class item extends allrole
   {
      public var actLoader:MovieClip;
      
      public var isGet:Boolean = false;
      
      public function item()
      {
         super();
      }
      
      public function beGet(param1:mainrole) : *
      {
         §§push(Math.abs(param1.thisLoader.x - thisLoader.x) <= 30 && Math.abs(param1.thisLoader.y - thisLoader.y) <= 30 && !thisOver);
         if(Math.abs(param1.thisLoader.x - thisLoader.x) <= 30 && Math.abs(param1.thisLoader.y - thisLoader.y) <= 30 && !thisOver)
         {
            §§pop();
            §§push(!isGet);
            if(false)
            {
               return;
            }
         }
         if(§§pop())
         {
            isGet = true;
            addSound("get1");
            doThisEffect(param1);
         }
      }
      
      public function dealAfterGet() : *
      {
         if(isGet)
         {
            curSite = "fly";
            nowSpeedY = -10;
            thisObj.alpha -= 0.1;
            if(thisObj.alpha <= 0.2)
            {
               thisOver = true;
               thisFather.delItem(this);
            }
         }
      }
      
      public function changSpdX() : *
      {
         if(hitStick)
         {
            nowSpeedX = thisSpeed * -1;
         }
      }
      
      public function doThisEffect(param1:mainrole) : *
      {
      }
      
      public function initThisByName(param1:String) : *
      {
      }
      
      public function initThisSpeed() : *
      {
         thisSpeed = Math.floor(Math.random() * 10);
         §§push(§§findproperty(jumpSpeed));
         §§push(-Math.floor(Math.random() * 10 + 25));
         if(false)
         {
            return;
         }
         §§pop().jumpSpeed = §§pop();
         if(Math.random() < 0.5)
         {
            nowSpeedX = thisSpeed;
         }
         else
         {
            nowSpeedX = -thisSpeed;
         }
         nowSpeedY = jumpSpeed;
      }
      
      override public function runMe() : *
      {
         dealCommond();
         dealMove();
         dealAfterGet();
      }
      
      override public function dealCommond() : *
      {
         changSpdX();
         if(curSite == "onfloor")
         {
            nowSpeedX = 0;
         }
      }
   }
}

