time = getTimer() / 1000;
thistime = time - oldtime;
if(thistime >= 1)
{
   fps = frames;
   frames = 0;
   oldtime++;
}
else
{
   frames++;
}
