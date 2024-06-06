function F_engineLoop()
{
   if(this.player.dead != 1)
   {
      this.movePlayer();
      this.checkDiamonds();
   }
   _root.pointArt.pointText = _root.HUDscore;
   if(_root.pointArt._xscale > 100)
   {
      _root.pointArt._xscale -= 1;
      _root.pointArt._yscale = _root.pointArt._xscale;
   }
   _root.setCamera();
}
function F_checkDot(dotName)
{
   tempDot = this["dot" + dotName];
   colliderx = tempDot._x;
   collidery = tempDot._y;
   var _loc3_ = {x:colliderx,y:collidery};
   this.localToGlobal(_loc3_);
   dotHit = 0;
   count = 1;
   while(count < 3)
   {
      if(_root.engine.world["building" + count].solid.hitTest(_loc3_.x,_loc3_.y,true))
      {
         dotHit = 1;
      }
      count++;
   }
   if(dotHit)
   {
      return 1;
   }
   return 0;
}
function F_checkDiamonds()
{
   if(this.world.building1.diamond._visible == true)
   {
      if(this.world.building1.diamond._currentframe == 1)
      {
         if(this.player.hitbox.hitTest(this.world.building1.diamond.hitbox))
         {
            if(this.player.animState == "charge" || this.player.chargeEndTime > 0)
            {
               this.world.building1.diamond.gotoAndStop(2);
               _root.cameraShake = 4;
               _root.enemyCombo += 1;
               _root.showPoints("Big",1);
               _root.HUDscore += starPoints * _root.enemyCombo;
               _root.pointArt._xscale += _root.enemyCombo * 4;
            }
            else
            {
               this.world.building1.diamond._x += 15;
               this.world.building1.diamond._rotation += 10;
               this.player.art.metalHit.gotoAndStop(2);
               _root.deathStyle = 3;
               this.player.deathTime(1);
            }
         }
         else if(this.world.building1.diamond.hitbox.hitTest(this.butterflybox))
         {
            _root.diamondCombo = 0;
            this.world.building1.diamond._visible = false;
         }
      }
   }
   if(this.world.building2.diamond._visible == true)
   {
      if(this.world.building2.diamond._currentframe == 1)
      {
         if(this.player.hitbox.hitTest(this.world.building2.diamond.hitbox))
         {
            if(this.player.animState == "charge" || this.player.chargeEndTime > 0)
            {
               this.world.building2.diamond.gotoAndStop(2);
               _root.cameraShake = 4;
               _root.HUDdiamonds += 1;
               _root.enemyCombo += 1;
               _root.showPoints("Big",2);
               _root.HUDscore += starPoints * _root.enemyCombo;
               _root.pointArt._xscale += _root.enemyCombo * 4;
            }
            else
            {
               this.world.building2.diamond._x += 15;
               this.world.building2.diamond._rotation += 10;
               this.player.art.metalHit.gotoAndStop(2);
               _root.deathStyle = 3;
               this.player.deathTime(1);
            }
         }
         else if(this.world.building2.diamond.hitbox.hitTest(this.butterflybox))
         {
            _root.diamondCombo = 0;
            this.world.building2.diamond._visible = false;
         }
      }
   }
   if(this.world.building1.butterfly._currentframe == 1)
   {
      if(this.world.building1.butterfly._visible)
      {
         this.world.building1.butterfly._x += 3;
         if(this.player.hitbox.hitTest(this.world.building1.butterfly.art.wings))
         {
            this.world.building1.butterfly.gotoAndStop(2);
            _root.butterflyCombo += 1;
            this.player.colorUp = 3;
            _root.HUDscore += butterPoints * _root.butterflyCombo;
            _root.pointArt._xscale += _root.butterflyCombo * 2;
            _root.showPoints("Small",1);
         }
         if(this.world.building1.butterfly.hitbox.hitTest(this.butterflybox))
         {
            if(this.world.building1.butterfly._currentframe == 1)
            {
               _root.butterflyCombo = 0;
            }
         }
      }
   }
   if(this.world.building2.butterfly._currentframe == 1)
   {
      if(this.world.building2.butterfly._visible)
      {
         this.world.building2.butterfly._x += 3;
         if(this.player.hitbox.hitTest(this.world.building2.butterfly.art.wings))
         {
            this.world.building2.butterfly.gotoAndStop(2);
            _root.butterflyCombo += 1;
            this.player.colorUp = 3;
            _root.HUDscore += butterPoints * _root.butterflyCombo;
            _root.pointArt._xscale += _root.butterflyCombo * 2;
            _root.showPoints("Small",2);
         }
         if(this.world.building2.butterfly.hitbox.hitTest(this.butterflybox))
         {
            if(this.world.building2.butterfly._currentframe == 1)
            {
               _root.butterflyCombo = 0;
            }
         }
      }
   }
   if(enemyCombo > bestStarCombo)
   {
      bestStarCombo = enemyCombo;
   }
   if(butterflyCombo > bestFairyCombo)
   {
      bestFairyCombo = butterflyCombo;
   }
}
function F_checkOddLanding(landDirection)
{
   if(checkDot("BottomRoot"))
   {
      count = 1;
      while(count < 10)
      {
         if(checkDot("BottomStick") == 0)
         {
            travely(1);
         }
         else
         {
            count = 10;
         }
         count++;
      }
   }
   else
   {
      count = 1;
      while(count < 10)
      {
         if(checkDot("BottomStick") == 0)
         {
            _X = _X + 1 * landDirection;
         }
         else
         {
            applyGravity = 0;
            touchGround = 1;
            count = 10;
         }
         count++;
      }
   }
}
function F_travelx(movex)
{
   this._x += movex;
}
function F_travely(movey)
{
   this._y += movey;
}
function F_moveWorldx(movex)
{
   count = 1;
   while(count < 3)
   {
      if(count == 1)
      {
         otherBuilding = this.world.building2;
      }
      else
      {
         otherBuilding = this.world.building1;
      }
      building = this.world["building" + count];
      building._x -= movex;
      _root.HUDscore += int(movex / 8);
      if(_root.HUDscore > 5000)
      {
         if(dolphinLevel == 1)
         {
            dolphinLevel = 2;
            dolphins.gotoAndStop(2);
         }
      }
      if(_root.HUDscore > 10000)
      {
         if(dolphinLevel == 2)
         {
            dolphinLevel = 3;
            dolphins.gotoAndStop(3);
         }
      }
      if(_root.HUDscore > 15000)
      {
         if(dolphinLevel == 3)
         {
            dolphinLevel = 4;
            dolphins.gotoAndStop(4);
         }
      }
      if(_root.HUDscore > 20000)
      {
         if(dolphinLevel == 4)
         {
            dolphinLevel = 5;
            dolphins.gotoAndStop(5);
         }
      }
      if(_root.HUDscore > 25000)
      {
         if(dolphinLevel == 5)
         {
            dolphinLevel = 6;
            dolphins.gotoAndStop(6);
         }
      }
      if(_root.HUDscore > 30000)
      {
         if(dolphinLevel == 6)
         {
            dolphinLevel = 7;
            dolphins.gotoAndStop(7);
         }
      }
      if(building.diamond._visible)
      {
         _root["diamondEdgeTime" + count] = int(engine._x - 640 + building._x + building.diamond._x) / 20;
         diamondTriggerTime = 25 + (movex - 14) / 1.5;
         if(_root["diamondSpawn" + count] != 1 && _root["diamondEdgeTime" + count] < diamondTriggerTime)
         {
            _root["diamondSpawn" + count] = 1;
            building.diamond.starSpawn.gotoAndPlay(2);
            _root.starTest.gotoAndPlay(2);
         }
      }
      if(building._x < -1500)
      {
         movexBuilding = int(movex / 1.5);
         if(movexBuiling > 20)
         {
            movexBuilding = 20;
         }
         building.gotoAndStop(random(movexBuilding) + 1);
         building.solid._visible = false;
         building.bloomArt.gotoAndStop(building._currentframe);
         building.bloomArt.blurMe(12,12);
         building._x = otherBuilding._x + otherBuilding._width / 2 + building._width / 2 + 400 + movex * 8 + random(100);
         building._y = 300 + random(100);
         _root["diamondSpawn" + count] = 0;
         if(random(movex - 10) > 2)
         {
            building.diamond._visible = true;
            if(building.diamond._currentframe == 1)
            {
               _root.enemyCombo = 0;
            }
            building.diamond.gotoAndStop(1);
            targetnum = random(2) + 2;
            targetdot = building["dot" + targetnum];
            building.diamond._x = targetdot._x;
            building.diamond._y = targetdot._y;
         }
         else
         {
            building.diamond._visible = false;
         }
         building.butterfly.gotoAndStop(1);
         targetdot = building.dot1;
         building.butterfly._x = targetdot._x - (400 + movex * 2);
         building.butterfly._y = targetdot._y - 150 + random(30);
      }
      building = this.world["backa" + count];
      building._x -= movex / 2;
      building._y = 500 - this._y / 2;
      if(building._x < -700)
      {
         building._x += 1400 + random(100);
         buidling.inside._y = -50 + random(100);
         if(random(2) == 0)
         {
            building._xscale *= -1;
         }
      }
      building = this.world["backb" + count];
      building._x -= movex / 8;
      building._y = 500 - this._y / 1.5;
      if(building._x < -700)
      {
         building._x += 1400 + random(100);
         buidling.inside._y = -25 + random(50);
         if(random(2) == 0)
         {
            building._xscale *= -1;
         }
      }
      count++;
   }
}
function setCamera()
{
   if(playerPointx <= 380)
   {
      if(playerPointx < 280)
      {
      }
   }
   if(engine.player.dead != 1)
   {
      engine._y -= (playerPointy - 200) / 10;
      if(engine._y < 0)
      {
         engine._y = 0;
      }
   }
   if(cameraShake > 0)
   {
      engine._y += random(cameraShake * 3) * cameraShakeDir;
      engine._x += random(cameraShake * 3) * cameraShakeDir;
      cameraShakeDir *= -1;
      cameraShake -= 0.1;
   }
   else
   {
      cameraShake = 0;
   }
   if(engine._x > 321)
   {
      engine._x -= 0.25;
   }
   else if(engine._x < 319)
   {
      engine._x += 0.25;
   }
}
function showPoints(psize, pnum)
{
   pointFX = _root["points" + psize];
   fxy = _root.engine._y + (_root.engine.player._y - 10);
   with(pointFX)
   {
      _visible = true;
      gotoAndPlay(2);
      _x = 100;
      _y = fxy;
   }
}
function dashWarning()
{
   if(dashWarn < 3)
   {
      dashWarn += 1;
      dashText.gotoAndPlay(2);
   }
}
function submitScore()
{
   var _loc2_ = _root.HUDfinalScore;
   cmpSetObj.var1 = _loc2_;
   cmpSetObj.clearListeners();
}
function F_movePlayer()
{
   with(engine.player)
   {
      if(dropTime > 0)
      {
         dropTime -= 1;
      }
      if(airChargeMeter < 100)
      {
         airChargeMeter += 1;
      }
      _root.rainbowBar._xscale = airChargeMeter - 30;
      if(_root.rainbowBar._xscale < 0)
      {
         _root.rainbowBar._xscale = 0;
      }
      prevAnimState = animState;
      rot4 = rot3;
      rot3 = rot2;
      rot2 = rot1;
      rot1 = rotationTarget;
      rotationTarget = 0;
      art._rotation = (rot1 + rot2 + rot3 + rot4) / 4;
      if(art._rotation > 20)
      {
         art._rotation = 20;
      }
      else if(art._rotation < -20)
      {
         art._rotation = -20;
      }
      if(Key.isDown(_root.p1r) || Key.isDown(_root.p1rCase))
      {
         if(chargeCoolDown > 20)
         {
            if(airChargeMeter > 40)
            {
               _y -= 8;
               airChargeMeter -= 70;
               chargeOffset = 15;
               airCharged = 1;
               airChargeCount += 1;
               chargeCoolDown = 0;
               applyGravity = 0;
               animState = "charge";
               art.blurMe(30,0);
               colorUp = 4;
               art.colorMe(colorUp,colorUp,colorUp);
            }
         }
      }
      if(chargeCoolDown < 21)
      {
         chargeCoolDown += 1;
      }
      if(chargeEndTime > 0)
      {
         chargeEndTime -= 1;
      }
      if(animState != "charge")
      {
         if(Key.isDown(_root.p1u) || Key.isDown(_root.p1uCase))
         {
            if(applyGravity == 0 || dropTime > 0 || jumpNum == 0)
            {
               if(!upPress)
               {
                  art.sparkleSound.gotoAndStop(2);
                  jumpNum = 1;
                  dropTime = 0;
                  touchGround = 0;
                  applyGravity = 1;
                  thrusty = jumpVel;
                  gravity = 0;
                  colorUp = 2;
                  airCharged = 0;
                  animState = "jump";
               }
            }
            else
            {
               if(!upPress && gravity > 6)
               {
                  if(jumpNum == 1)
                  {
                     art.jumpanim.rainbow.gotoAndStop(2);
                     jumpNum = 2;
                     applyGravity = 1;
                     thrusty = jumpVel;
                     gravity = 2;
                     animState = "jump";
                     colorUp = 3;
                     art.colorMe(colorUp,colorUp,colorUp);
                  }
               }
               gravity -= 0.75;
            }
            upPress = 1;
         }
         else
         {
            upPress = 0;
         }
      }
      speedx = maxspeedx;
      _root.engine.moveWorldx(speedx);
      if(maxspeedx < 50)
      {
         maxspeedx += 0.01;
      }
      _root.testVar6 = maxspeedx;
      _x = (speedx - 14) / 2 - 260 + offsetx;
      if(offsetx > 0)
      {
         offsetx -= 5;
      }
      else
      {
         offsetx = 0;
      }
      if(applyGravity && animState != "charge")
      {
         fallSpeed = thrusty - gravity;
         if(fallSpeed > 10)
         {
            fallSpeed = 10;
         }
         travely(- fallSpeed);
         gravity += 1.2;
      }
      touchCeiling = 0;
      if(checkDot("Top"))
      {
         touchCeiling = 1;
         count = 1;
         while(count < 20)
         {
            if(checkDot("Top"))
            {
               travely(1);
            }
            else
            {
               count = 21;
            }
            count++;
         }
      }
      if(checkDot("Bottom"))
      {
         touchGround = 1;
         count = 1;
         while(count < 20)
         {
            if(checkDot("Bottom"))
            {
               travely(-1);
               rotationTarget -= rotationStep + 1;
            }
            else
            {
               count = 21;
            }
            count++;
         }
      }
      if(checkDot("Right"))
      {
         _root.deathStyle = 2;
         deathTime(1);
         return 0;
      }
      if(applyGravity)
      {
         art._rotation = 0;
         rotationTarget = 0;
         if(checkDot("TopRight"))
         {
            touchCeiling = 1;
            while(checkDot("TopRight"))
            {
               travely(1);
            }
         }
         if(checkDot("BottomLeft"))
         {
            if(gravity > thrusty)
            {
               if(touchGround == 0)
               {
                  checkOddLanding(-1);
               }
            }
            if(touchGround == 0)
            {
               while(checkDot("BottomLeft"))
               {
                  travely(-1);
               }
            }
         }
         if(checkDot("BottomRight"))
         {
            if(gravity > thrusty)
            {
               if(touchGround == 0)
               {
                  checkOddLanding(1);
               }
            }
            if(touchGround == 0)
            {
               while(checkDot("BottomRight"))
               {
                  travely(-1);
               }
            }
         }
      }
      if(touchCeiling)
      {
         if(applyGravity)
         {
            thrusty /= 2;
         }
      }
      if(touchGround)
      {
         applyGravity = 0;
         gravity = 0;
         if(animState != "charge")
         {
            animState = "run";
            airCharged = 0;
            airChargeCount = 0;
         }
         if(applyGravity == 0 && animState != "charge")
         {
            if(checkDot("BottomRoot"))
            {
               count = 1;
               while(count < 10)
               {
                  if(checkDot("BottomStick") == 0)
                  {
                     travely(1);
                     rotationTarget += rotationStep;
                  }
                  else
                  {
                     count = 10;
                  }
                  count++;
               }
            }
         }
         if(animState != "charge")
         {
            if(checkDot("BottomStick") == 0)
            {
               if(checkDot("BottomRightStick") == 0)
               {
                  if(checkDot("BottomLeftStick") == 0)
                  {
                     touchGround = 0;
                     airCharged = 0;
                     dropTime = 10;
                     jumpNum = 1;
                     applyGravity = 1;
                     thrusty = jumpVel;
                     gravity = jumpVel;
                     animState = "jump";
                  }
               }
            }
         }
      }
      var playerPoint = {x:_x,y:_y};
      this.localToGlobal(playerPoint);
      _root.playerPointx = playerPoint.x + 300;
      _root.playerPointy = playerPoint.y;
      if(colorUp > 1.2)
      {
         colorUp -= 0.1;
         art.colorMe(colorUp,colorUp,colorUp);
      }
      if(_y < -600)
      {
         _y = -600;
      }
      if(this.dead != 1)
      {
         art.gotoAndStop(animState);
         if(animState == "run")
         {
            if(prevAnimState != "run")
            {
               airChargeMeter = 100;
               art.runanim.gotoAndStop(200);
            }
            jumpNum = 0;
            prevAnimFrame = animFrame;
            animFrame = art.runanim._currentframe;
            art.runanim.gotoAndStop(animFrame + int(speedx * 2));
            if(animFrame > 450)
            {
               art.runanim.gotoAndStop(animFrame - 450);
            }
            if(prevAnimFrame < 90 && animFrame > 90)
            {
               art.gallopSounds.gotoAndStop(2);
            }
            if(prevAnimFrame < 150 && animFrame > 150)
            {
               art.gallopSounds.gotoAndStop(3);
            }
            if(prevAnimFrame < 180 && animFrame > 180)
            {
               art.gallopSounds.gotoAndStop(4);
            }
         }
         else if(animState == "jump")
         {
            art.jumpanim.gotoAndStop(int(gravity * 8.75));
         }
         else if(animState == "charge")
         {
            _root.engine.moveWorldx(speedx / 2);
            offsetx += chargeOffset;
            chargeOffset -= 1;
            if(chargeOffset < 0)
            {
               chargeOffset = 0;
            }
         }
      }
      if(_y > 700)
      {
         _root.deathStyle = 1;
         deathTime(1);
      }
   }
}
function F_endCharge()
{
   with(engine.player)
   {
      touchGround = 0;
      if(jumpNum == 0)
      {
         dropTime = 10;
      }
      else
      {
         jumpNum = 1;
      }
      chargeEndTime = 10;
      applyGravity = 1;
      thrusty = jumpVel;
      gravity = jumpVel;
      animState = "jump";
      art.gotoAndStop("jump");
      art.jumpanim.gotoAndStop(int(gravity * 8.75));
   }
}
function F_deathTime(deathMethod)
{
   this.dead = 1;
   lives.nextFrame();
   if(deathMethod == 1)
   {
      this.art.gotoAndStop("deathExplode");
      _root.cameraShake = 6;
   }
   else if(deathMethod == 2)
   {
      this.art.gotoAndStop("deathFall");
   }
}
function initialize()
{
   _quality = "medium";
   _root.p1u = 90;
   _root.p1uCase = 122;
   _root.p1d = 83;
   _root.p1l = 65;
   _root.p1r = 88;
   _root.p1rCase = 120;
   _root.p1ps = 32;
   _root.score = 0;
   _root.HUDscore = 0;
   _root.HUDdiamonds = 0;
   _root.HUDbutterflies = 0;
   _root.HUDfinalScore = 0;
   _root.cameraShakeDir = 1;
   _root.cameraShake = 0;
   _root.butterflyCombo = 0;
   _root.enemyCombo = 1;
   _root.butterPoints = 10;
   _root.starPoints = 100;
   _root.dolphinLevel = 1;
   _root.dashWarn = 0;
   _root.deathStyle = 1;
   if(_root.scoreTurn == 0)
   {
      _root.score1 = 0;
      _root.score2 = 0;
      _root.score3 = 0;
      _root.bestFairyCombo = 0;
      _root.bestStarCombo = 0;
      _root.scoreTurn = 1;
   }
   _root.lives.gotoAndStop(scoreTurn);
   with(engine)
   {
      originx = 320;
      originy = 240;
      player.thrusty = 0;
      player.offsetx = 0;
      player.gravity = 0;
      player.applyGravity = 1;
      player.maxspeedx = 14;
      player.jumpVel = 14;
      player.speedx = player.maxspeedx;
      player.speedstep = 0.25;
      player.dead = 0;
      player.airCharged = 0;
      player.airChargeCount = 0;
      player.airChargeMeter = 100;
      player.chargeCoolDown = 100;
      player.chargeEndTime = 0;
      player.dropTime = 0;
      player.rotationStep = 2;
      player.rotationTarget = 0;
      player.rot1 = 0;
      player.rot2 = 0;
      player.rot3 = 0;
      player.animState = "run";
      player.colorUp = 4;
   }
   engine.player.checkDot = F_checkDot;
   engine.player.endCharge = F_endCharge;
   engine.player.deathTime = F_deathTime;
   engine.player.checkOddLanding = F_checkOddLanding;
   engine.player.travelx = F_travelx;
   engine.player.travely = F_travely;
   engine.engineLoop = F_engineLoop;
   engine.moveWorldx = F_moveWorldx;
   engine.movePlayer = F_movePlayer;
   engine.checkDiamonds = F_checkDiamonds;
   engine.world.building1.diamond._visible = false;
   engine.world.building2.diamond._visible = false;
}
function saveCookie()
{
   shareObj = SharedObject.getLocal("shareObj");
   _root.shareObj.data.scoreArray = highScores;
   _root.shareObj.data.nameArray = highScoreNames;
   _root.shareObj.data.flush();
}
function loadCookie()
{
   shareObj = SharedObject.getLocal("shareObj");
   highScores = shareObj.data.scoreArray;
   highScoreNames = shareObj.data.nameArray;
}
function deleteCookie()
{
   _root.shareObj.data.scoreArray = highScoresXX;
   _root.shareObj.data.nameArray = highScoresXX;
   _root.shareObj.data.flush();
}
function setHighScores()
{
   endOK = 1;
   count = 1;
   while(count <= 5)
   {
      if(HUDfinalScore > highScores[count])
      {
         scoreNum = count;
         count2 = 5;
         while(count2 > scoreNum)
         {
            highScores[count2] = highScores[count2 - 1];
            count2--;
         }
         highScores[count] = HUDfinalScore;
         finalbox["scorebox" + count].gotoAndPlay(2);
         count = 6;
      }
      count++;
   }
   count = 1;
   while(count <= 5)
   {
      finalbox["score" + count].scoreText = highScores[count];
      count++;
   }
   saveCookie();
}
function deleteScores()
{
   deleteCookie();
   count = 1;
   while(count <= 5)
   {
      this["highScore" + count] = 6000 - 1000 * count;
      count++;
   }
   highScores = new Array(0,highScore1,highScore2,highScore3,highScore4,highScore5);
   highScoreNames = new Array("com","com","com","com","com");
   highScoresXX = new Array(0,0,0,0,0);
   saveCookie();
}
var intDelay;
var strDom;
var var1 = 0;
var var3 = 2772;
cmpSetObj.var1 = var1;
cmpSetObj.var3 = var3;
mccm.onPress = function()
{
   trace("meep");
   cmpSetObj.clearListeners();
};
stop();
scoreTurn = 0;
count = 1;
while(count <= 5)
{
   this["highScore" + count] = 6000 - 1000 * count;
   count++;
}
loadCookie();
if(highScores[5] <= 1000)
{
   highScores = new Array(0,highScore1,highScore2,highScore3,highScore4,highScore5);
   highScoreNames = new Array("com","com","com","com","com");
   highScoresXX = new Array(0,0,0,0,0);
   saveCookie();
}
