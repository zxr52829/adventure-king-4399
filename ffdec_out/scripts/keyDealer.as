package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class keyDealer extends MovieClip
   {
      public var keyBit:BitmapData;
      
      public var tempKeyArray:Array;
      
      public var defKeyArray:Array = [65,68,87,83,74,75,76,49,50,51,52,67,80];
      
      public var thisFather:Main;
      
      public var keyArray:Array = [65,68,87,83,74,75,76,49,50,51,52,67,80];
      
      public var isChange:Boolean = false;
      
      public var theMc:MovieClip;
      
      private var curKey:int = 100;
      
      public function keyDealer(param1:MovieClip, param2:Main)
      {
         if(false)
         {
            return;
         }
         §§push(§§findproperty(tempKeyArray));
         §§push([65,68,87,83,74,75,76,49,50,51,52,67,80]);
         if(false)
         {
            return false;
         }
         §§pop().tempKeyArray = §§pop();
         curKey = 100;
         isChange = false;
         super();
         theMc = param1;
         theMc.visible = false;
         thisFather = param2;
         this.addEventListener(KeyboardEvent.KEY_DOWN,keyDownmethod);
      }
      
      public function initShow(param1:MovieClip, param2:int) : *
      {
         var _loc3_:* = param2;
         switch(if(48 === _loc3_)
         {
            §§push(0);
         }
         else if(96 === _loc3_)
         {
            §§push(1);
         }
         else if(49 === _loc3_)
         {
            §§push(2);
         }
         else if(97 === _loc3_)
         {
            §§push(3);
         }
         else if(50 === _loc3_)
         {
            §§push(4);
         }
         else if(98 === _loc3_)
         {
            §§push(5);
         }
         else if(51 === _loc3_)
         {
            §§push(6);
         }
         else if(99 === _loc3_)
         {
            §§push(7);
         }
         else
         {
            §§push(52);
            if(false)
            {
               return;
            }
            else if(§§pop() !== _loc3_)
            {
               if(100 === _loc3_)
               {
                  §§push(9);
               }
               else if(53 === _loc3_)
               {
                  §§push(10);
               }
               else if(101 === _loc3_)
               {
                  §§push(11);
               }
               else if(54 === _loc3_)
               {
                  §§push(12);
               }
               else if(102 === _loc3_)
               {
                  §§push(13);
               }
               else
               {
                  §§push(55);
                  §§push(_loc3_);
                  if(false)
                  {
                     return false;
                  }
                  else if(§§pop() === §§pop())
                  {
                     §§push(14);
                  }
                  else if(103 === _loc3_)
                  {
                     §§push(15);
                  }
                  else if(56 === _loc3_)
                  {
                     §§push(16);
                  }
                  else if(104 === _loc3_)
                  {
                     §§push(17);
                  }
                  else if(57 === _loc3_)
                  {
                     §§push(18);
                  }
                  else if(105 === _loc3_)
                  {
                     §§push(19);
                  }
                  else if(38 === _loc3_)
                  {
                     §§push(20);
                  }
                  else if(40 !== _loc3_)
                  {
                     if(37 === _loc3_)
                     {
                        §§push(22);
                     }
                     else if(39 === _loc3_)
                     {
                        §§push(23);
                     }
                     else if(65 === _loc3_)
                     {
                        §§push(24);
                     }
                     else if(66 === _loc3_)
                     {
                        §§push(25);
                     }
                     else if(67 === _loc3_)
                     {
                        §§push(26);
                     }
                     else if(68 === _loc3_)
                     {
                        §§push(27);
                     }
                     else if(69 === _loc3_)
                     {
                        §§push(28);
                     }
                     else if(70 === _loc3_)
                     {
                        §§push(29);
                     }
                     else if(71 === _loc3_)
                     {
                        §§push(30);
                     }
                     else if(72 === _loc3_)
                     {
                        §§push(31);
                     }
                     else if(73 === _loc3_)
                     {
                        §§push(32);
                     }
                     else
                     {
                        §§push(74);
                        §§push(_loc3_);
                        if(false)
                        {
                           return;
                        }
                        else if(§§pop() !== §§pop())
                        {
                           if(75 === _loc3_)
                           {
                              §§push(34);
                           }
                           else if(76 === _loc3_)
                           {
                              §§push(35);
                           }
                           else if(77 === _loc3_)
                           {
                              §§push(36);
                           }
                           else if(78 === _loc3_)
                           {
                              §§push(37);
                           }
                           else if(79 === _loc3_)
                           {
                              §§push(38);
                           }
                           else if(80 === _loc3_)
                           {
                              §§push(39);
                           }
                           else if(81 === _loc3_)
                           {
                              §§push(40);
                           }
                           else if(82 === _loc3_)
                           {
                              §§push(41);
                           }
                           else if(83 === _loc3_)
                           {
                              §§push(42);
                           }
                           else if(84 === _loc3_)
                           {
                              §§push(43);
                           }
                           else if(85 === _loc3_)
                           {
                              §§push(44);
                           }
                           else if(86 === _loc3_)
                           {
                              §§push(45);
                           }
                           else if(87 !== _loc3_)
                           {
                              if(88 === _loc3_)
                              {
                                 §§push(47);
                              }
                              else if(89 === _loc3_)
                              {
                                 §§push(48);
                              }
                              else if(90 === _loc3_)
                              {
                                 §§push(49);
                              }
                              else if(186 === _loc3_)
                              {
                                 §§push(50);
                              }
                              else if(187 === _loc3_)
                              {
                                 §§push(51);
                              }
                              else if(188 === _loc3_)
                              {
                                 §§push(52);
                              }
                              else if(189 === _loc3_)
                              {
                                 §§push(53);
                              }
                              else if(190 === _loc3_)
                              {
                                 §§push(54);
                              }
                              else if(191 === _loc3_)
                              {
                                 §§push(55);
                              }
                              else if(192 === _loc3_)
                              {
                                 §§push(56);
                              }
                              else if(219 === _loc3_)
                              {
                                 §§push(57);
                              }
                              else if(220 === _loc3_)
                              {
                                 §§push(58);
                                 if(false)
                                 {
                                    return;
                                 }
                              }
                              else
                              {
                                 §§push(221 !== _loc3_ ? (222 === _loc3_ ? 60 : (32 === _loc3_ ? 61 : 62)) : 59);
                              }
                           }
                           else
                           {
                              §§push(46);
                           }
                        }
                        else
                        {
                           §§push(33);
                        }
                     }
                  }
                  else
                  {
                     §§push(21);
                  }
               }
            }
            else
            {
               §§push(8);
            }
         })
         {
            case 0:
            case 1:
               param1.keyShowMc.gotoAndStop(1);
               break;
            case 2:
            case 3:
               param1.keyShowMc.gotoAndStop(2);
               break;
            case 4:
            case 5:
               param1.keyShowMc.gotoAndStop(3);
               break;
            case 6:
            case 7:
               param1.keyShowMc.gotoAndStop(4);
               break;
            case 8:
            case 9:
               param1.keyShowMc.gotoAndStop(5);
               break;
            case 10:
            case 11:
               param1.keyShowMc.gotoAndStop(6);
               break;
            case 12:
            case 13:
               param1.keyShowMc.gotoAndStop(7);
               break;
            case 14:
            case 15:
               param1.keyShowMc.gotoAndStop(8);
               break;
            case 16:
            case 17:
               param1.keyShowMc.gotoAndStop(9);
               break;
            case 18:
            case 19:
               param1.keyShowMc.gotoAndStop(10);
               break;
            case 20:
               param1.keyShowMc.gotoAndStop(11);
               break;
            case 21:
               param1.keyShowMc.gotoAndStop(12);
               break;
            case 22:
               param1.keyShowMc.gotoAndStop(13);
               break;
            case 23:
               param1.keyShowMc.gotoAndStop(14);
               break;
            case 24:
               param1.keyShowMc.gotoAndStop(15);
               break;
            case 25:
               param1.keyShowMc.gotoAndStop(16);
               break;
            case 26:
               param1.keyShowMc.gotoAndStop(17);
               break;
            case 27:
               param1.keyShowMc.gotoAndStop(18);
               break;
            case 28:
               §§push(param1.keyShowMc);
               if(false)
               {
                  return;
               }
               §§pop().gotoAndStop(19);
               break;
            case 29:
               param1.keyShowMc.gotoAndStop(20);
               break;
            case 30:
               param1.keyShowMc.gotoAndStop(21);
               break;
            case 31:
               param1.keyShowMc.gotoAndStop(22);
               break;
            case 32:
               param1.keyShowMc.gotoAndStop(23);
               break;
            case 33:
               param1.keyShowMc.gotoAndStop(24);
               break;
            case 34:
               param1.keyShowMc.gotoAndStop(25);
               break;
            case 35:
               param1.keyShowMc.gotoAndStop(26);
               break;
            case 36:
               if(false)
               {
                  return;
               }
               param1.keyShowMc.gotoAndStop(27);
               break;
            case 37:
               param1.keyShowMc.gotoAndStop(28);
               break;
            case 38:
               param1.keyShowMc.gotoAndStop(29);
               break;
            case 39:
               param1.keyShowMc.gotoAndStop(30);
               break;
            case 40:
               param1.keyShowMc.gotoAndStop(31);
               break;
            case 41:
               param1.keyShowMc.gotoAndStop(32);
               break;
            case 42:
               param1.keyShowMc.gotoAndStop(33);
               break;
            case 43:
               param1.keyShowMc.gotoAndStop(34);
               break;
            case 44:
               param1.keyShowMc.gotoAndStop(35);
               break;
            case 45:
               param1.keyShowMc.gotoAndStop(36);
               break;
            case 46:
               param1.keyShowMc.gotoAndStop(37);
               break;
            case 47:
               param1.keyShowMc.gotoAndStop(38);
               break;
            case 48:
               param1.keyShowMc.gotoAndStop(39);
               break;
            case 49:
               param1.keyShowMc.gotoAndStop(40);
               break;
            case 50:
               param1.keyShowMc.gotoAndStop(41);
               break;
            case 51:
               param1.keyShowMc.gotoAndStop(42);
               break;
            case 52:
               param1.keyShowMc.gotoAndStop(43);
               break;
            case 53:
               param1.keyShowMc.gotoAndStop(44);
               break;
            case 54:
               param1.keyShowMc.gotoAndStop(45);
               break;
            case 55:
               param1.keyShowMc.gotoAndStop(46);
               break;
            case 56:
               param1.keyShowMc.gotoAndStop(47);
               break;
            case 57:
               param1.keyShowMc.gotoAndStop(48);
               break;
            case 58:
               param1.keyShowMc.gotoAndStop(49);
               break;
            case 59:
               param1.keyShowMc.gotoAndStop(50);
               break;
            case 60:
               param1.keyShowMc.gotoAndStop(51);
               break;
            case 61:
               param1.keyShowMc.gotoAndStop(52);
               break;
            default:
               param1.keyShowMc.gotoAndStop(53);
         }
      }
      
      private function selectcake(param1:MouseEvent, param2:int) : void
      {
         var _loc3_:* = undefined;
         Main.soundDealer.tryAddSound("moveIn");
         _loc3_ = 0;
         while(_loc3_ < 13)
         {
            §§push(theMc["btn" + _loc3_]);
            if(false)
            {
               return;
            }
            §§pop().gotoAndStop(1);
            _loc3_++;
         }
         theMc["btn" + param2].gotoAndStop(2);
         curKey = param2;
      }
      
      private function selYes(param1:MouseEvent) : *
      {
         isChange = true;
         keyArray = tempKeyArray;
         theMc.visible = false;
         thisFather.setKeyOver();
      }
      
      public function showThis() : *
      {
         theMc.visible = true;
         initTheMc();
      }
      
      private function selDef(param1:MouseEvent) : *
      {
         var _loc2_:* = undefined;
         tempKeyArray = ObjectUtil.baseClone(defKeyArray);
         _loc2_ = 0;
         while(_loc2_ < 13)
         {
            theMc["btn" + _loc2_].gotoAndStop(1);
            initShow(theMc["btn" + _loc2_],keyArray[_loc2_]);
            theMc["btn" + _loc2_].addEventListener(MouseEvent.MOUSE_DOWN,MethodUtil.create(selectcake,_loc2_));
            _loc2_++;
         }
      }
      
      private function initTheMc() : *
      {
         var _loc1_:* = undefined;
         _loc1_ = 0;
         while(_loc1_ < 13)
         {
            theMc["btn" + _loc1_].gotoAndStop(1);
            initShow(theMc["btn" + _loc1_],keyArray[_loc1_]);
            §§push(theMc["btn" + _loc1_]);
            if(false)
            {
               return;
            }
            §§pop().addEventListener(MouseEvent.MOUSE_DOWN,MethodUtil.create(selectcake,_loc1_));
            _loc1_++;
         }
         theMc.btnYes.addEventListener(MouseEvent.MOUSE_UP,selYes);
         theMc.btnNo.addEventListener(MouseEvent.MOUSE_UP,selNo);
         theMc.btnDefault.addEventListener(MouseEvent.MOUSE_UP,selDef);
         theMc.btnYes.addEventListener(MouseEvent.MOUSE_OVER,thisFather.moveSonud);
         theMc.btnNo.addEventListener(MouseEvent.MOUSE_OVER,thisFather.moveSonud);
         theMc.btnDefault.addEventListener(MouseEvent.MOUSE_OVER,thisFather.moveSonud);
      }
      
      private function selNo(param1:MouseEvent) : *
      {
         theMc.visible = false;
         thisFather.setKeyOver();
      }
      
      private function keyDownmethod(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = undefined;
         _loc2_ = int(param1.keyCode);
         if(curKey < 0 || curKey > 12)
         {
            return;
         }
         if(_loc2_ == tempKeyArray[curKey])
         {
            return;
         }
         initShow(theMc["btn" + curKey],_loc2_);
         _loc3_ = 0;
         while(_loc3_ < 13)
         {
            if(tempKeyArray[_loc3_] == _loc2_)
            {
               §§push(tempKeyArray);
               §§push(_loc3_);
               §§push(-1);
               if(false)
               {
                  return;
               }
               §§pop()[§§pop()] = §§pop();
               initShow(theMc["btn" + _loc3_],-1);
            }
            _loc3_++;
         }
         tempKeyArray[curKey] = _loc2_;
      }
   }
}

