function blurMe(blurX, blurY)
{
   quality = 1;
   filter = new flash.filters.BlurFilter(blurX,blurY,quality);
   filterArray = new Array();
   filterArray.push(filter);
   this.filters = filterArray;
   if(blurX == 0)
   {
      if(blurY == 0)
      {
         this.filters = new Array();
      }
   }
}
function colorMe(redtarget, greentarget, bluetarget)
{
   var _loc3_ = new flash.geom.Transform(this);
   var _loc2_ = _loc3_.colorTransform;
   _loc2_.redMultiplier = redtarget;
   _loc2_.greenMultiplier = greentarget;
   _loc2_.blueMultiplier = bluetarget;
   _loc3_.colorTransform = _loc2_;
   if(redtarget == 1)
   {
      if(greentarget == 1)
      {
         if(bluetarget == 1)
         {
            _loc3_ = new flash.geom.Transform(this);
         }
      }
   }
}
function glowMe(glowColor, glowAlpha, glowBlur)
{
   var _loc2_ = new flash.filters.GlowFilter(glowColor,glowAlpha,glowBlur,glowBlur,2,1);
   _loc2_.quality = 3;
   this.filters = [_loc2_];
   if(glowAlpha == 0)
   {
      this.filters = new Array();
   }
}
stop();
gotoAndStop(random(10) + 1);
stop();
glowMe(16737535,0.75,10);
