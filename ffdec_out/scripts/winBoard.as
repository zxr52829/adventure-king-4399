package
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol170")]
   public dynamic class winBoard extends MovieClip
   {
      public function winBoard()
      {
         super();
         addFrameScript(79,frame80);
      }
      
      internal function frame80() : *
      {
         stop();
      }
   }
}

§§push(§§findproperty(winBoard));
§§push(§§newclass(winBoard,MovieClip));
if(false)
{
   throw true;
}

