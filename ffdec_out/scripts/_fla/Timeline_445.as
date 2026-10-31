package _fla
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol2744")]
   public dynamic class Timeline_445 extends MovieClip
   {
      public var closeBtn:SimpleButton;
      
      public function Timeline_445()
      {
         super();
         addFrameScript(0,frame1,52,frame53);
      }
      
      internal function frame1() : *
      {
         stop();
         closeBtn.visible = false;
      }
      
      internal function frame53() : *
      {
         stop();
         closeBtn.visible = true;
      }
   }
}

