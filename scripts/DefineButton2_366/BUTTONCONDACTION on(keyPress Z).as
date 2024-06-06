on(keyPress "Z"){
   if(endOK)
   {
      _root.HUDscore = 0;
      if(scoreTurn != 0)
      {
         gotoAndStop(3);
      }
      else
      {
         gotoAndStop(2);
      }
   }
}
