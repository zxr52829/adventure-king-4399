package
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   public class tipshow extends MovieClip
   {
      public var theMc:MovieClip;
      
      public function tipshow()
      {
         super();
      }
      
      public function delMc() : *
      {
         if(theMc != null)
         {
            removeChild(theMc);
            theMc = null;
         }
      }
      
      public function showTip(param1:String) : *
      {
         var _loc2_:Class = null;
         var _loc3_:MovieClip = null;
         delMc();
         _loc2_ = getDefinitionByName(param1) as Class;
         _loc3_ = new _loc2_();
         theMc = _loc3_;
         theMc.gotoAndStop(1);
         addChild(theMc);
      }
      
      public function runThis() : *
      {
         if(theMc != null)
         {
            if(theMc.currentFrame == theMc.totalFrames)
            {
               delMc();
            }
            else
            {
               theMc.nextFrame();
            }
         }
      }
   }
}

§§push(§§findproperty(tipshow));
if(false)
{
   return;
}

