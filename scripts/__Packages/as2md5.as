class as2md5
{
   var inText;
   var hashValue;
   var currentState;
   var processArray;
   static var MD5_INIT_STATE_0 = 1732584193;
   static var MD5_INIT_STATE_1 = 4023233417;
   static var MD5_INIT_STATE_2 = 2562383102;
   static var MD5_INIT_STATE_3 = 271733878;
   static var MD5_S11 = 7;
   static var MD5_S12 = 12;
   static var MD5_S13 = 17;
   static var MD5_S14 = 22;
   static var MD5_S21 = 5;
   static var MD5_S22 = 9;
   static var MD5_S23 = 14;
   static var MD5_S24 = 20;
   static var MD5_S31 = 4;
   static var MD5_S32 = 11;
   static var MD5_S33 = 16;
   static var MD5_S34 = 23;
   static var MD5_S41 = 6;
   static var MD5_S42 = 10;
   static var MD5_S43 = 15;
   static var MD5_S44 = 21;
   static var MD5_T01 = 3614090360;
   static var MD5_T02 = 3905402710;
   static var MD5_T03 = 606105819;
   static var MD5_T04 = 3250441966;
   static var MD5_T05 = 4118548399;
   static var MD5_T06 = 1200080426;
   static var MD5_T07 = 2821735955;
   static var MD5_T08 = 4249261313;
   static var MD5_T09 = 1770035416;
   static var MD5_T10 = 2336552879;
   static var MD5_T11 = 4294925233;
   static var MD5_T12 = 2304563134;
   static var MD5_T13 = 1804603682;
   static var MD5_T14 = 4254626195;
   static var MD5_T15 = 2792965006;
   static var MD5_T16 = 1236535329;
   static var MD5_T17 = 4129170786;
   static var MD5_T18 = 3225465664;
   static var MD5_T19 = 643717713;
   static var MD5_T20 = 3921069994;
   static var MD5_T21 = 3593408605;
   static var MD5_T22 = 38016083;
   static var MD5_T23 = 3634488961;
   static var MD5_T24 = 3889429448;
   static var MD5_T25 = 568446438;
   static var MD5_T26 = 3275163606;
   static var MD5_T27 = 4107603335;
   static var MD5_T28 = 1163531501;
   static var MD5_T29 = 2850285829;
   static var MD5_T30 = 4243563512;
   static var MD5_T31 = 1735328473;
   static var MD5_T32 = 2368359562;
   static var MD5_T33 = 4294588738;
   static var MD5_T34 = 2272392833;
   static var MD5_T35 = 1839030562;
   static var MD5_T36 = 4259657740;
   static var MD5_T37 = 2763975236;
   static var MD5_T38 = 1272893353;
   static var MD5_T39 = 4139469664;
   static var MD5_T40 = 3200236656;
   static var MD5_T41 = 681279174;
   static var MD5_T42 = 3936430074;
   static var MD5_T43 = 3572445317;
   static var MD5_T44 = 76029189;
   static var MD5_T45 = 3654602809;
   static var MD5_T46 = 3873151461;
   static var MD5_T47 = 530742520;
   static var MD5_T48 = 3299628645;
   static var MD5_T49 = 4096336452;
   static var MD5_T50 = 1126891415;
   static var MD5_T51 = 2878612391;
   static var MD5_T52 = 4237533241;
   static var MD5_T53 = 1700485571;
   static var MD5_T54 = 2399980690;
   static var MD5_T55 = 4293915773;
   static var MD5_T56 = 2240044497;
   static var MD5_T57 = 1873313359;
   static var MD5_T58 = 4264355552;
   static var MD5_T59 = 2734768916;
   static var MD5_T60 = 1309151649;
   static var MD5_T61 = 4149444226;
   static var MD5_T62 = 3174756917;
   static var MD5_T63 = 718787259;
   static var MD5_T64 = 3951481745;
   function as2md5()
   {
   }
   function getText()
   {
      return this.inText;
   }
   function setText(s)
   {
      this.initialize(s);
   }
   function getHash()
   {
      return this.hashValue;
   }
   function toString()
   {
      return this.getHash();
   }
   function valueOf()
   {
      return this.toString();
   }
   function MD5Hash(s)
   {
      this.initialize(s);
   }
   function initialize(s)
   {
      this.inText = s;
      if(this.currentState != undefined)
      {
         delete this.currentState;
      }
      this.currentState = new Array(as2md5.MD5_INIT_STATE_0,as2md5.MD5_INIT_STATE_1,as2md5.MD5_INIT_STATE_2,as2md5.MD5_INIT_STATE_3);
      this.hash();
   }
   function rotl(x, n)
   {
      return x << n | x >>> 32 - n;
   }
   function au(x, y)
   {
      var _loc3_ = x & 2147483648;
      var _loc2_ = y & 2147483648;
      var _loc5_ = x & 1073741824;
      var _loc4_ = y & 1073741824;
      var _loc1_ = (x & 1073741823) + (y & 1073741823);
      if(_loc5_ & _loc4_)
      {
         return _loc1_ ^ 2147483648 ^ _loc3_ ^ _loc2_;
      }
      if(_loc5_ | _loc4_)
      {
         if(_loc1_ & 1073741824)
         {
            return _loc1_ ^ 3221225472 ^ _loc3_ ^ _loc2_;
         }
         return _loc1_ ^ 1073741824 ^ _loc3_ ^ _loc2_;
      }
      var _loc6_ = _loc1_ ^ _loc3_ ^ _loc2_;
      return _loc6_;
   }
   function ff(a, b, c, d, x, s, t)
   {
      return this.au(this.rotl(this.au(a,this.au(this.au(b & c | (~b) & d,x),t)),s),b);
   }
   function gg(a, b, c, d, x, s, t)
   {
      return this.au(this.rotl(this.au(a,this.au(this.au(b & d | c & (~d),x),t)),s),b);
   }
   function hh(a, b, c, d, x, s, t)
   {
      return this.au(this.rotl(this.au(a,this.au(this.au(b ^ c ^ d,x),t)),s),b);
   }
   function ii(a, b, c, d, x, s, t)
   {
      return this.au(this.rotl(this.au(a,this.au(this.au(c ^ (b | ~d),x),t)),s),b);
   }
   function transform(X)
   {
      var _loc5_ = this.currentState[0];
      var _loc4_ = this.currentState[1];
      var _loc3_ = this.currentState[2];
      var _loc2_ = this.currentState[3];
      _loc5_ = this.ff(_loc5_,_loc4_,_loc3_,_loc2_,X[0],as2md5.MD5_S11,as2md5.MD5_T01);
      _loc2_ = this.ff(_loc2_,_loc5_,_loc4_,_loc3_,X[1],as2md5.MD5_S12,as2md5.MD5_T02);
      _loc3_ = this.ff(_loc3_,_loc2_,_loc5_,_loc4_,X[2],as2md5.MD5_S13,as2md5.MD5_T03);
      _loc4_ = this.ff(_loc4_,_loc3_,_loc2_,_loc5_,X[3],as2md5.MD5_S14,as2md5.MD5_T04);
      _loc5_ = this.ff(_loc5_,_loc4_,_loc3_,_loc2_,X[4],as2md5.MD5_S11,as2md5.MD5_T05);
      _loc2_ = this.ff(_loc2_,_loc5_,_loc4_,_loc3_,X[5],as2md5.MD5_S12,as2md5.MD5_T06);
      _loc3_ = this.ff(_loc3_,_loc2_,_loc5_,_loc4_,X[6],as2md5.MD5_S13,as2md5.MD5_T07);
      _loc4_ = this.ff(_loc4_,_loc3_,_loc2_,_loc5_,X[7],as2md5.MD5_S14,as2md5.MD5_T08);
      _loc5_ = this.ff(_loc5_,_loc4_,_loc3_,_loc2_,X[8],as2md5.MD5_S11,as2md5.MD5_T09);
      _loc2_ = this.ff(_loc2_,_loc5_,_loc4_,_loc3_,X[9],as2md5.MD5_S12,as2md5.MD5_T10);
      _loc3_ = this.ff(_loc3_,_loc2_,_loc5_,_loc4_,X[10],as2md5.MD5_S13,as2md5.MD5_T11);
      _loc4_ = this.ff(_loc4_,_loc3_,_loc2_,_loc5_,X[11],as2md5.MD5_S14,as2md5.MD5_T12);
      _loc5_ = this.ff(_loc5_,_loc4_,_loc3_,_loc2_,X[12],as2md5.MD5_S11,as2md5.MD5_T13);
      _loc2_ = this.ff(_loc2_,_loc5_,_loc4_,_loc3_,X[13],as2md5.MD5_S12,as2md5.MD5_T14);
      _loc3_ = this.ff(_loc3_,_loc2_,_loc5_,_loc4_,X[14],as2md5.MD5_S13,as2md5.MD5_T15);
      _loc4_ = this.ff(_loc4_,_loc3_,_loc2_,_loc5_,X[15],as2md5.MD5_S14,as2md5.MD5_T16);
      _loc5_ = this.gg(_loc5_,_loc4_,_loc3_,_loc2_,X[1],as2md5.MD5_S21,as2md5.MD5_T17);
      _loc2_ = this.gg(_loc2_,_loc5_,_loc4_,_loc3_,X[6],as2md5.MD5_S22,as2md5.MD5_T18);
      _loc3_ = this.gg(_loc3_,_loc2_,_loc5_,_loc4_,X[11],as2md5.MD5_S23,as2md5.MD5_T19);
      _loc4_ = this.gg(_loc4_,_loc3_,_loc2_,_loc5_,X[0],as2md5.MD5_S24,as2md5.MD5_T20);
      _loc5_ = this.gg(_loc5_,_loc4_,_loc3_,_loc2_,X[5],as2md5.MD5_S21,as2md5.MD5_T21);
      _loc2_ = this.gg(_loc2_,_loc5_,_loc4_,_loc3_,X[10],as2md5.MD5_S22,as2md5.MD5_T22);
      _loc3_ = this.gg(_loc3_,_loc2_,_loc5_,_loc4_,X[15],as2md5.MD5_S23,as2md5.MD5_T23);
      _loc4_ = this.gg(_loc4_,_loc3_,_loc2_,_loc5_,X[4],as2md5.MD5_S24,as2md5.MD5_T24);
      _loc5_ = this.gg(_loc5_,_loc4_,_loc3_,_loc2_,X[9],as2md5.MD5_S21,as2md5.MD5_T25);
      _loc2_ = this.gg(_loc2_,_loc5_,_loc4_,_loc3_,X[14],as2md5.MD5_S22,as2md5.MD5_T26);
      _loc3_ = this.gg(_loc3_,_loc2_,_loc5_,_loc4_,X[3],as2md5.MD5_S23,as2md5.MD5_T27);
      _loc4_ = this.gg(_loc4_,_loc3_,_loc2_,_loc5_,X[8],as2md5.MD5_S24,as2md5.MD5_T28);
      _loc5_ = this.gg(_loc5_,_loc4_,_loc3_,_loc2_,X[13],as2md5.MD5_S21,as2md5.MD5_T29);
      _loc2_ = this.gg(_loc2_,_loc5_,_loc4_,_loc3_,X[2],as2md5.MD5_S22,as2md5.MD5_T30);
      _loc3_ = this.gg(_loc3_,_loc2_,_loc5_,_loc4_,X[7],as2md5.MD5_S23,as2md5.MD5_T31);
      _loc4_ = this.gg(_loc4_,_loc3_,_loc2_,_loc5_,X[12],as2md5.MD5_S24,as2md5.MD5_T32);
      _loc5_ = this.hh(_loc5_,_loc4_,_loc3_,_loc2_,X[5],as2md5.MD5_S31,as2md5.MD5_T33);
      _loc2_ = this.hh(_loc2_,_loc5_,_loc4_,_loc3_,X[8],as2md5.MD5_S32,as2md5.MD5_T34);
      _loc3_ = this.hh(_loc3_,_loc2_,_loc5_,_loc4_,X[11],as2md5.MD5_S33,as2md5.MD5_T35);
      _loc4_ = this.hh(_loc4_,_loc3_,_loc2_,_loc5_,X[14],as2md5.MD5_S34,as2md5.MD5_T36);
      _loc5_ = this.hh(_loc5_,_loc4_,_loc3_,_loc2_,X[1],as2md5.MD5_S31,as2md5.MD5_T37);
      _loc2_ = this.hh(_loc2_,_loc5_,_loc4_,_loc3_,X[4],as2md5.MD5_S32,as2md5.MD5_T38);
      _loc3_ = this.hh(_loc3_,_loc2_,_loc5_,_loc4_,X[7],as2md5.MD5_S33,as2md5.MD5_T39);
      _loc4_ = this.hh(_loc4_,_loc3_,_loc2_,_loc5_,X[10],as2md5.MD5_S34,as2md5.MD5_T40);
      _loc5_ = this.hh(_loc5_,_loc4_,_loc3_,_loc2_,X[13],as2md5.MD5_S31,as2md5.MD5_T41);
      _loc2_ = this.hh(_loc2_,_loc5_,_loc4_,_loc3_,X[0],as2md5.MD5_S32,as2md5.MD5_T42);
      _loc3_ = this.hh(_loc3_,_loc2_,_loc5_,_loc4_,X[3],as2md5.MD5_S33,as2md5.MD5_T43);
      _loc4_ = this.hh(_loc4_,_loc3_,_loc2_,_loc5_,X[6],as2md5.MD5_S34,as2md5.MD5_T44);
      _loc5_ = this.hh(_loc5_,_loc4_,_loc3_,_loc2_,X[9],as2md5.MD5_S31,as2md5.MD5_T45);
      _loc2_ = this.hh(_loc2_,_loc5_,_loc4_,_loc3_,X[12],as2md5.MD5_S32,as2md5.MD5_T46);
      _loc3_ = this.hh(_loc3_,_loc2_,_loc5_,_loc4_,X[15],as2md5.MD5_S33,as2md5.MD5_T47);
      _loc4_ = this.hh(_loc4_,_loc3_,_loc2_,_loc5_,X[2],as2md5.MD5_S34,as2md5.MD5_T48);
      _loc5_ = this.ii(_loc5_,_loc4_,_loc3_,_loc2_,X[0],as2md5.MD5_S41,as2md5.MD5_T49);
      _loc2_ = this.ii(_loc2_,_loc5_,_loc4_,_loc3_,X[7],as2md5.MD5_S42,as2md5.MD5_T50);
      _loc3_ = this.ii(_loc3_,_loc2_,_loc5_,_loc4_,X[14],as2md5.MD5_S43,as2md5.MD5_T51);
      _loc4_ = this.ii(_loc4_,_loc3_,_loc2_,_loc5_,X[5],as2md5.MD5_S44,as2md5.MD5_T52);
      _loc5_ = this.ii(_loc5_,_loc4_,_loc3_,_loc2_,X[12],as2md5.MD5_S41,as2md5.MD5_T53);
      _loc2_ = this.ii(_loc2_,_loc5_,_loc4_,_loc3_,X[3],as2md5.MD5_S42,as2md5.MD5_T54);
      _loc3_ = this.ii(_loc3_,_loc2_,_loc5_,_loc4_,X[10],as2md5.MD5_S43,as2md5.MD5_T55);
      _loc4_ = this.ii(_loc4_,_loc3_,_loc2_,_loc5_,X[1],as2md5.MD5_S44,as2md5.MD5_T56);
      _loc5_ = this.ii(_loc5_,_loc4_,_loc3_,_loc2_,X[8],as2md5.MD5_S41,as2md5.MD5_T57);
      _loc2_ = this.ii(_loc2_,_loc5_,_loc4_,_loc3_,X[15],as2md5.MD5_S42,as2md5.MD5_T58);
      _loc3_ = this.ii(_loc3_,_loc2_,_loc5_,_loc4_,X[6],as2md5.MD5_S43,as2md5.MD5_T59);
      _loc4_ = this.ii(_loc4_,_loc3_,_loc2_,_loc5_,X[13],as2md5.MD5_S44,as2md5.MD5_T60);
      _loc5_ = this.ii(_loc5_,_loc4_,_loc3_,_loc2_,X[4],as2md5.MD5_S41,as2md5.MD5_T61);
      _loc2_ = this.ii(_loc2_,_loc5_,_loc4_,_loc3_,X[11],as2md5.MD5_S42,as2md5.MD5_T62);
      _loc3_ = this.ii(_loc3_,_loc2_,_loc5_,_loc4_,X[2],as2md5.MD5_S43,as2md5.MD5_T63);
      _loc4_ = this.ii(_loc4_,_loc3_,_loc2_,_loc5_,X[9],as2md5.MD5_S44,as2md5.MD5_T64);
      this.currentState[0] = this.au(_loc5_,this.currentState[0]);
      this.currentState[1] = this.au(_loc4_,this.currentState[1]);
      this.currentState[2] = this.au(_loc3_,this.currentState[2]);
      this.currentState[3] = this.au(_loc2_,this.currentState[3]);
   }
   function ConvertToWordArray()
   {
      var _loc4_ = undefined;
      var _loc5_ = this.inText.length;
      var _loc7_ = _loc5_ + 8;
      var _loc8_ = (_loc7_ - _loc7_ % 64) / 64;
      var _loc6_ = (_loc8_ + 1) * 16;
      if(this.processArray != undefined)
      {
         delete this.processArray;
      }
      this.processArray = new Array(_loc6_);
      var _loc3_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < _loc5_)
      {
         _loc4_ = (_loc2_ - _loc2_ % 4) / 4;
         _loc3_ = _loc2_ % 4 * 8;
         this.processArray[_loc4_] |= this.inText.charCodeAt(_loc2_) << _loc3_;
         _loc2_ = _loc2_ + 1;
      }
      _loc4_ = (_loc2_ - _loc2_ % 4) / 4;
      _loc3_ = _loc2_ % 4 * 8;
      this.processArray[_loc4_] |= 128 << _loc3_;
      this.processArray[_loc6_ - 2] = _loc5_ << 3;
      this.processArray[_loc6_ - 1] = _loc5_ >>> 29;
   }
   function hash()
   {
      this.ConvertToWordArray();
      var _loc3_ = new Array(16);
      var _loc2_ = 0;
      while(_loc2_ < this.processArray.length)
      {
         _loc3_ = this.processArray.slice(_loc2_,_loc2_ + 16);
         this.transform(_loc3_);
         _loc2_ += 16;
      }
      this.hashValue = "";
      _loc2_ = 0;
      while(_loc2_ < 4)
      {
         this.hashValue = this.hashValue.concat(this.int2hex(this.currentState[_loc2_]));
         _loc2_ = _loc2_ + 1;
      }
   }
   function int2hex(n, c)
   {
      var _loc4_ = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f");
      var _loc3_ = "";
      if(c <= 0 or c > 8)
      {
         c = 8;
      }
      if(c % 2 == 1)
      {
         c = c + 1;
      }
      var _loc1_ = 0;
      while(_loc1_ < c)
      {
         var _loc2_ = n >>> (_loc1_ << 2) & 255;
         _loc3_ = _loc3_.concat(_loc4_[(_loc2_ & 240) >>> 4 & 15],_loc4_[_loc2_ & 15]);
         _loc1_ += 2;
      }
      return _loc3_;
   }
}
