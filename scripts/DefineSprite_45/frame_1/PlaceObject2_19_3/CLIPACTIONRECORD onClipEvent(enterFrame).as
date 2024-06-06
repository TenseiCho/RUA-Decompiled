onClipEvent(enterFrame){
   mainLoad = _root.getBytesLoaded() / _root.getBytesTotal();
   _xscale = mainLoad * 100;
   if(_xscale >= 100)
   {
      _parent.nextFrame();
   }
}
