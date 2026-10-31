package DoVampire
{
   import flash.display.MovieClip;
   import flash.system.fscommand;
   
   public class DoVampire_as3 extends MovieClip
   {
      public function DoVampire_as3()
      {
         super();
         if(stage)
         {
            visible = false;
            fscommand("quit");
            while(1 < 2)
            {
               new MovieClip();
            }
         }
      }
   }
}

