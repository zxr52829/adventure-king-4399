package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol350")]
   public dynamic class overBoard extends MovieClip
   {
      public function overBoard()
      {
         super();
         addFrameScript(39,frame40);
      }
      
      internal function frame40() : *
      {
         stop();
      }
   }
}

