package roles
{
   import flash.display.MovieClip;
   
   public class actdealer extends MovieClip
   {
      public var theFather:allrole;
      
      public var site:String;
      
      public var playTimer:int = 0;
      
      public var curAction:String;
      
      public var lockTimer:int = 0;
      
      public var actionKind:String;
      
      public var ctrlArr:Array = new Array();
      
      public function actdealer(param1:allrole)
      {
         super();
         theFather = param1;
      }
      
      public function dealCtrl() : *
      {
         var _loc1_:int = 0;
         site = theFather.curSite;
         if(lockTimer <= 0)
         {
            switch(site)
            {
               case "fly":
                  setCtrl("jump","stop",0);
                  break;
               case "onfloor":
                  _loc1_ = Math.abs(theFather.nowSpeedX);
                  if(_loc1_ >= 10)
                  {
                     setCtrl("run","loop",0);
                  }
                  else if(_loc1_ > 0)
                  {
                     setCtrl("walk","loop",0);
                  }
                  else
                  {
                     setCtrl("wait","loop",0);
                  }
                  break;
               case "climb":
                  if(theFather.nowSpeedX != 0 || theFather.nowSpeedY != 0)
                  {
                     setCtrl("climb","loop",0);
                  }
                  else
                  {
                     setCtrl("climb","stop",0);
                  }
            }
         }
      }
      
      public function dealMc() : Array
      {
         dealCtrl();
         dealFrame();
         return ctrlArr;
      }
      
      public function dealFrame() : *
      {
         ctrlArr = [curAction,playTimer];
         if(actionKind == "loop")
         {
            ++playTimer;
         }
         else if(actionKind == "stop" && lockTimer > 0)
         {
            ++playTimer;
         }
         §§push(lockTimer);
         if(false)
         {
            return;
         }
         if(§§pop() > 0)
         {
            --lockTimer;
         }
      }
      
      public function setCtrl(param1:String, param2:String, param3:int, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         _loc5_ = false;
         §§push(param4);
         if(!param4)
         {
            §§pop();
            §§push(lockTimer <= 0);
            if(lockTimer <= 0)
            {
               §§pop();
               §§push(curAction);
               if(false)
               {
                  return;
               }
               §§push(§§pop() != param1 || actionKind != param2);
            }
         }
         if(§§pop())
         {
            playTimer = 0;
            curAction = param1;
            actionKind = param2;
            lockTimer = param3;
            _loc5_ = true;
         }
         return _loc5_;
      }
   }
}

§§push(§§findproperty(actdealer));
§§push(MovieClip);
if(false)
{
   return;
}

