function clearListeners()
{
   trace("rrr");
   var _loc4_ = Number(this.var3);
   var _loc3_ = Number(this.var1);
   trace("!1! " + _loc4_ + " :: " + _loc3_);
   var _loc6_ = "http://highscores.adultswim.com/highscores/SubmitScoreServlet.do?";
   var _loc14_ = new Date();
   var _loc2_ = _loc14_.getTime();
   var _loc5_ = _loc2_.toString().substr(0,_loc2_.toString().length - 3) + "000";
   _loc2_ = parseInt(_loc5_);
   var _loc10_ = _loc5_.substr(-3,3);
   var _loc11_ = _loc5_.substr(-4,3);
   var _loc12_ = parseInt(_loc10_);
   var _loc13_ = parseInt(_loc11_);
   var _loc7_ = _loc12_ * _loc13_ * _loc3_ + _loc3_;
   trace("nAlgo " + _loc7_);
   var _loc9_ = _loc4_ + "," + _loc3_ + "," + _loc2_ + "," + _loc7_;
   trace("strToPass " + _loc9_);
   m.setText(_loc9_);
   var _loc8_ = m.getHash();
   trace(_loc6_ + "attr1=score=" + _loc3_ + "|gameId=" + _loc4_ + "|timestamp=" + _loc2_ + "|key=" + _loc8_);
   getURL(_loc6_ + "attr1=score=" + _loc3_ + "|gameId=" + _loc4_ + "|timestamp=" + _loc2_ + "|key=" + _loc8_,"_self");
}
_visible = false;
var m = new as2md5();
