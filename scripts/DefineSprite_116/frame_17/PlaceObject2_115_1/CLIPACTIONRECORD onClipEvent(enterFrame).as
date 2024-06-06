onClipEvent(enterFrame){
   gotoAndStop(_currentframe + 22);
   if(_currentframe > 450)
   {
      gotoAndStop(_currentframe - 450);
   }
}
