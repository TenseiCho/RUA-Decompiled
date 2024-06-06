function setScoreScreen()
{
   scoreArt1._visible = true;
   scoreArt1.scoreText = score1;
   if(scoreTurn > 1)
   {
      scoreArt2._visible = true;
      scoreArt2.scoreText = score2;
   }
   if(scoreTurn > 2)
   {
      scoreArt3._visible = true;
      scoreArt3.scoreText = score3;
   }
   if(scoreTurn == 1)
   {
      scorebox1.gotoAndPlay(2);
   }
   else if(scoreTurn == 2)
   {
      scorebox2.gotoAndPlay(2);
   }
   if(scoreTurn == 3)
   {
      scorebox3.gotoAndPlay(2);
   }
   else
   {
      endOK = 1;
      scoreTurn += 1;
   }
}
function showFinalScore()
{
   scoreArtFinal._visible = true;
   finalbox._visible = true;
   finalbox.gotoAndPlay(2);
   HUDfinalScore = score1 + score2 + score3;
   scoreArtFinal.scoreText = HUDfinalScore;
   scoreTurn = 0;
}
function scoreScreenCounter()
{
   if(scoreTurn != 0)
   {
      screenTime -= 1;
      pressztext.timeText = int(screenTime / 30);
      presszreflection.timeText = int(screenTime / 30);
      if(screenTime <= 0)
      {
         _root.HUDscore = 0;
         gotoAndStop(3);
      }
   }
}
endOK = 0;
_root["score" + scoreTurn] = HUDscore;
scoreArtFairy.scoreText = _root.bestFairyCombo;
scoreArtStar.scoreText = _root.bestStarCombo;
if(scoreTurn == 1)
{
   scoreArt1._visible = false;
   scoreArt2._visible = false;
   scoreArt3._visible = false;
   scoreStars1.gotoAndPlay(2);
}
if(scoreTurn == 2)
{
   scoreArt1.scoreText = score1;
   scoreArt2._visible = false;
   scoreArt3._visible = false;
   scoreStars2.gotoAndPlay(2);
}
if(scoreTurn == 3)
{
   timerSound.gotoAndStop(2);
   scoreArt3._visible = false;
   scoreArt1.scoreText = score1;
   scoreArt2.scoreText = score1;
   scoreStars3.gotoAndPlay(2);
   pressztext.gotoAndStop(2);
   presszreflection.gotoAndStop(2);
}
scoreArtFinal._visible = false;
finalbox._visible = false;
screenTime = 270;
