package roles.enemys
{
   import flash.display.*;
   import flash.events.*;
   import flash.utils.*;
   import roles.*;
   import roles.items.*;
   import roles.pets.*;
   
   public class littlerole1 extends allrole
   {
      public var actLoader:MovieClip;
      
      public function littlerole1(param1:fightMain, param2:int, param3:int, param4:String)
      {
         super();
         thisFather = param1;
         thisLoader = new MovieClip();
         thisObj = new MovieClip();
         thisLoader.addChild(thisObj);
         thisLoader.x = param2;
         thisLoader.y = param3;
         thisFather.enemyRoleLoader.addChild(thisLoader);
         initThisByName(param4);
         thisObj.addChild(actLoader);
         initMySb();
         tarArray = thisFather.teamArr;
      }
      
      override public function initMySb() : *
      {
         thisStateBoard = new otherBoard();
         thisLoader.addChild(thisStateBoard);
         thisStateBoard.x = -20;
         thisStateBoard.y = -80;
         §§push(§§findproperty(changState));
         §§push(0);
         if(false)
         {
            return;
         }
         §§pop().changState(§§pop(),"hp");
         thisStateBoard.alpha = 0;
      }
      
      private function initThisByName(param1:String) : *
      {
         var n:String = param1;
         var _loc3_:* = n;
         switch(_loc3_)
         {
            case "l1":
         }
         actLoader = new l1mc();
         if(false)
         {
            return;
         }
         thisAllHp = 100;
         thisCurHp = 100;
         thisAtt = 20;
         thisDef = 0;
         thisSpeed = 2;
         jumpSpeed = 0;
         thisExp = 5;
         jumpTop = getJumpTop(jumpSpeed);
         thisItemArr = ["hps","exps"];
         with(beHitObject)
         {
            noHitTimer = 0;
            beHitLeft = -15;
            beHitRight = 15;
            beHitTop = -70;
            beHitBottom = -10;
            beHitFly = true;
         }
         defHitArea = beHitObject.beHitRight;
         defAttArea = defHitArea;
         defHitSpd = 10;
         with(searchObject)
         {
            searchX = 0;
            searchY = 0;
            escapeX = 600;
            escapeY = 400;
         }
      }
      
      override public function dealPic(param1:Array) : *
      {
         var _loc2_:int = 0;
         var _loc3_:* = param1[0];
         switch(_loc3_)
         {
            case "wait":
            default:
               _loc2_ = param1[1] % 16;
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(1);
                     break;
                  case 4:
                     actLoader.gotoAndStop(2);
                     break;
                  case 8:
                     actLoader.gotoAndStop(3);
                     break;
                  case 12:
                     §§push(actLoader);
                     §§push(4);
                     if(false)
                     {
                        return;
                     }
                     §§pop().gotoAndStop(§§pop());
                     break;
               }
               break;
            case "walk":
            case "run":
               _loc2_ = param1[1] % 8;
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(5);
                     break;
                  case 2:
                     actLoader.gotoAndStop(6);
                     break;
                  case 4:
                     actLoader.gotoAndStop(7);
                     break;
                  case 6:
                     actLoader.gotoAndStop(8);
               }
               break;
            case "jump":
               actLoader.gotoAndStop(6);
               break;
            case "attack":
               _loc2_ = int(param1[1]);
               switch(_loc2_)
               {
                  case 0:
                     actLoader.gotoAndStop(16);
                     break;
                  case defHitSpd:
                     actLoader.gotoAndStop(17);
                     if(skillObj != null)
                     {
                        thisFather.skillDealer.addSkill(skillObj.sName,skillObj.sKind,thisLoader.x + skillObj.sx,thisLoader.y + skillObj.sy,this);
                     }
                     else if(thisObj.scaleX != 1)
                     {
                        setHitObj(2,-defHitArea,0,beHitObject.beHitTop,beHitObject.beHitBotton,thisAtt,1,0,0,0);
                     }
                     else
                     {
                        setHitObj(2,0,defHitArea,beHitObject.beHitTop,beHitObject.beHitBotton,thisAtt,1,0,0,0);
                     }
                     break;
                  default:
                     if(false)
                     {
                        return;
                     }
                     break;
               }
         }
      }
      
      override public function dealCommond() : *
      {
         if(thisCurHp <= 0)
         {
            dead();
            return;
         }
         curTar = searchCurTar();
         if(curTar == null)
         {
            §§push(§§findproperty(freeMove));
            if(false)
            {
               return;
            }
            §§pop().freeMove();
            return;
         }
         if(curTar.thisCurHp <= 0)
         {
            curTar = null;
            return;
         }
         if(thisLoader.x >= curTar.thisLoader.x)
         {
            §§push(§§findproperty(dealScale));
            if(false)
            {
               throw true;
            }
            §§pop().dealScale(-1);
         }
         else
         {
            dealScale(1);
         }
         if(Math.abs(thisLoader.x - curTar.thisLoader.x) > searchObject.escapeX || Math.abs(thisLoader.y - curTar.thisLoader.y) > searchObject.escapeY)
         {
            curTar = null;
         }
         else
         {
            §§push(Math.abs(thisLoader.x - curTar.thisLoader.x));
            §§push(defAttArea);
            §§push(curTar.beHitObject.beHitRight);
            if(false)
            {
               return;
            }
            if(§§pop() > §§pop() + §§pop() || Math.abs(thisLoader.y - curTar.thisLoader.y) > 60)
            {
               §§push(§§findproperty(moveToTar));
               §§push(curTar);
               if(false)
               {
                  throw true;
               }
               §§pop().moveToTar(§§pop());
            }
            else
            {
               attack();
            }
         }
      }
   }
}

