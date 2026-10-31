package
{
   import flash.display.*;
   import flash.events.*;
   import flash.geom.Matrix;
   import flash.net.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   
   public class FWAd_AS3 extends Sprite
   {
      public static var xx:int;
      
      public static var hei:int;
      
      public static var loadFrameworkFailed:Boolean;
      
      public static var _stage:*;
      
      public static var id:String;
      
      public static var xml:XML;
      
      public static var lc_connName:String;
      
      public static var onClickStartBtn:Function;
      
      public static var yy:int;
      
      public static var noShowLogo:Boolean;
      
      public static var loadFrameworkSuccess:Boolean;
      
      public static var frameworkLoader:Loader;
      
      public static var loadGameCompleted:Boolean;
      
      public static var noShowForbidden:Boolean;
      
      public static var hasLoadOnce:Boolean;
      
      public static var canNotShowAd:Boolean;
      
      public static var newsLoader:Loader;
      
      public static var frameworkInitFinished:Boolean;
      
      public static var _root:*;
      
      public static var wid:int;
      
      public static var news_lc:LocalConnection;
      
      public static var ifIsLoadingAdShowStartBtn:Boolean;
      
      public static var restLoadFrameworkTimes:int;
      
      public static var onLoadXML:Function;
      
      public static var lc:LocalConnection;
      
      public static var lc_sendName:String;
      
      public static const ifLoadFrameworkErrorCanPlayGame:Boolean = true;
      
      public static const loadFrameworkTimeoutTime:int = 8;
      
      public static const loadFrameworkTimes:int = 2;
      
      public static const ifAdFailCanPlayGame:Boolean = true;
      
      public static const ifAddCallBackErrorCanPlayGame:Boolean = false;
      
      public static const swfDomain:String = "";
      
      public static const swfFolder:String = "http://" + swfDomain + "/";
      
      public static const frameworkSWFPath:String = swfFolder + "Framework.swf";
      
      public static const newsSWFPath:String = swfFolder + "News.swf";
      
      public static var AD_TYPE_LOADING:String = "loading";
      
      public static var AD_TYPE_CONTAINER:String = "container";
      
      public static var adType:String = AD_TYPE_LOADING;
      
      §§push(§§findproperty(newsValues));
      §§push("x");
      §§push(0);
      §§push("y");
      §§push(0);
      if(false)
      {
         return;
      }
      
      public static var newsValues:Object = null;
      
      public static var checkNewsFirstInitIntervalId:int = -1;
      
      public var loadingBar_bar:Sprite;
      
      public var loadingBar:Sprite;
      
      private var timeoutId:int = -1;
      
      public var _FWAd:Object;
      
      public function FWAd_AS3(param1:Object)
      {
         super();
         xx = param1.x;
         yy = param1.y;
         wid = param1.wid;
         hei = param1.hei;
         id = param1.id;
         adType = param1.adType;
         §§push(§§findproperty(ifIsLoadingAdShowStartBtn));
         §§push(param1.ifIsLoadingAdShowStartBtn);
         if(false)
         {
            return;
         }
         §§pop().ifIsLoadingAdShowStartBtn = §§pop();
         noShowLogo = param1.noShowLogo;
         noShowForbidden = param1.noShowForbidden;
         if(param1.onClickCloseBtn)
         {
            onClickStartBtn = param1.onClickCloseBtn;
         }
         else
         {
            onClickStartBtn = param1.onClickStartBtn;
         }
         _FWAd = FWAd_AS3;
         this.addEventListener(Event.ADDED_TO_STAGE,added);
      }
      
      public static function showNews(param1:Object = null) : void
      {
         var _loc2_:String = null;
         var _loc3_:Sprite = null;
         clearInterval(checkNewsFirstInitIntervalId);
         newsValues.wid = wid;
         var _loc4_:int = 0;
         var _loc5_:* = param1;
         if(false)
         {
            return false;
         }
         for(_loc2_ in _loc5_)
         {
            newsValues[_loc2_] = param1[_loc2_];
         }
         §§push(newsValues);
         if(false)
         {
            return;
         }
         if(!§§pop().id)
         {
            newsValues.id = id + "_news";
         }
         _loc3_ = newsValues.container || _root;
         if(!_loc3_)
         {
            trace("未指定容器,请改成例如: FWAd_AS3.showNews({container:root}");
         }
         else
         {
            newsLoader = new Loader();
            _loc3_.addChild(newsLoader);
            newsLoader.x = newsValues.x;
            if(false)
            {
               return false;
            }
            newsLoader.y = newsValues.y;
            newsLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadNewsComplete);
            newsLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadNewsError);
            if(false)
            {
               return;
            }
            newsLoader.load(new URLRequest(newsSWFPath));
         }
         news_lc = new LocalConnection();
         news_lc.addEventListener(StatusEvent.STATUS,news_lc_status);
      }
      
      public static function checkNewsFirstInit() : void
      {
         var ran:int = 0;
         var movie:AVM1Movie = null;
         try
         {
            movie = newsLoader.content as AVM1Movie;
         }
         catch(e:Error)
         {
            return;
         }
         §§push(§§newactivation());
         §§push(int(Math.round(movie.getBounds(movie).x / 10)));
         if(false)
         {
            return;
         }
         §§pop().§§slot[1] = §§pop();
         if(ran < -1000)
         {
            clearInterval(checkNewsFirstInitIntervalId);
            news_lc.send("_News" + ran,"that2this","newsValues",newsValues);
         }
      }
      
      public static function showAd(param1:Object = null) : void
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         var _loc4_:Sprite = null;
         §§push("x");
         §§push(xx);
         §§push("y");
         §§push(yy);
         §§push("wid");
         §§push(wid);
         §§push("hei");
         §§push(hei);
         if(false)
         {
            return;
         }
         _loc2_ = null;
         var _loc5_:int = 0;
         var _loc6_:* = param1;
         while(§§hasnext(_loc6_,_loc5_))
         {
            §§push(_loc6_);
            §§push(_loc5_);
            if(false)
            {
               return;
            }
            _loc3_ = §§nextname(§§pop(),§§pop());
            _loc2_[_loc3_] = param1[_loc3_];
         }
         _loc4_ = _loc2_.container || _root;
         if(!_loc4_)
         {
            trace("未指定容器,请改成例如: FWAd_AS3.showAd({container:root}");
            return;
         }
         if(_loc2_.adType == AD_TYPE_LOADING)
         {
            if(hasLoadOnce)
            {
               trace("缓冲广告不允许重复初始化");
               return;
            }
            hasLoadOnce = true;
         }
         _loc4_.addChild(new FWAd_AS3(_loc2_));
      }
      
      public static function loadNewsError(param1:IOErrorEvent) : void
      {
      }
      
      public static function loadNewsComplete(param1:Event) : void
      {
         clearInterval(checkNewsFirstInitIntervalId);
         checkNewsFirstInitIntervalId = setInterval(checkNewsFirstInit,100);
      }
      
      public static function news_lc_status(... rest) : void
      {
      }
      
      public static function getParam(param1:String) : String
      {
         if(xml)
         {
            return String(xml.attribute(param1));
         }
         trace("xml未加载完毕, 或xml加载失败");
         return null;
      }
      
      private function added(param1:Event) : void
      {
         var g:Graphics;
         var loadingBar_bottom:Sprite;
         var event:Event;
         var loadingBar_line:Sprite;
         var loadingBar_hei:Number = NaN;
         var loadingBar_x:Number = NaN;
         var loadingBar_wid:Number = NaN;
         §§push(§§newactivation());
         if(false)
         {
            return;
         }
         §§pop().§§slot[5] = null;
         loadingBar_line = null;
         g = null;
         event = param1;
         §§push(this);
         §§push(Event.ADDED_TO_STAGE);
         §§push(added);
         if(false)
         {
            return;
         }
         §§pop().removeEventListener(§§pop(),§§pop());
         this.addEventListener(Event.REMOVED_FROM_STAGE,removed);
         Security.allowDomain(swfDomain);
         Security.allowInsecureDomain(swfDomain);
         try
         {
            fscommand("showMenu","false");
         }
         catch(e:Error)
         {
         }
         _root = stage.getChildAt(0);
         _stage = stage;
         _root.contextMenu = new ContextMenu();
         _root.contextMenu.hideBuiltInItems();
         try
         {
            fscommand("trapallkeys","true");
         }
         catch(e:Error)
         {
         }
         §§push(§§findproperty(loadGameCompleted));
         §§push(_root);
         if(false)
         {
            return;
         }
         §§pop().loadGameCompleted = §§pop().loaderInfo.bytesLoaded == _root.loaderInfo.bytesTotal;
         if(frameworkLoader)
         {
            frameworkInitFinished = true;
            checkLoadGameCompleteAndTryStart();
            if(frameworkInitFinished)
            {
               if(false)
               {
                  return;
               }
               lc.client = this;
               lc.send(lc_sendName,"that2this","reset");
            }
         }
         else
         {
            frameworkLoader = new Loader();
            frameworkLoader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadFrameworkComplete);
            frameworkLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadFrameworkError);
            restLoadFrameworkTimes = loadFrameworkTimes;
            loadFramework();
         }
         this.addChild(frameworkLoader);
         loadingBar_hei = 8;
         loadingBar_x = 10;
         loadingBar_wid = wid - 2 * loadingBar_x;
         loadingBar = new Sprite();
         loadingBar.x = loadingBar_x;
         loadingBar.y = hei - loadingBar_hei - 6;
         this.addChild(loadingBar);
         loadingBar_bottom = new Sprite();
         loadingBar.addChild(loadingBar_bottom);
         §§push(§§findproperty(loadingBar_bar));
         if(false)
         {
            throw true;
         }
         §§pop().loadingBar_bar = new Sprite();
         loadingBar.addChild(loadingBar_bar);
         loadingBar_line = new Sprite();
         loadingBar.addChild(loadingBar_line);
         g = loadingBar_bottom.graphics;
         g.clear();
         g.beginFill(3355443);
         g.drawRect(0,0,loadingBar_wid,loadingBar_hei);
         g.endFill();
         g = loadingBar_bar.graphics;
         g.clear();
         g.beginGradientFill("linear",[16777215,16750950],[1,1],[63,255],new Matrix(0.006,0,0,1,0,0));
         loadingBar_bar.rotation = 90;
         g.drawRect(0,-loadingBar_wid,loadingBar_hei,loadingBar_wid);
         g.endFill();
         g = loadingBar_line.graphics;
         g.clear();
         §§push(g);
         if(false)
         {
            return;
         }
         §§pop().lineStyle(1,6710886);
         g.drawRect(0,0,loadingBar_wid,loadingBar_hei);
         g.endFill();
         §§push(loadingBar_bar);
         §§push(1);
         if(false)
         {
            return;
         }
         §§pop().width = §§pop();
         loadingBar_bar.scaleX = 1;
         switch(adType)
         {
            case AD_TYPE_LOADING:
               break;
            default:
               loadingBar.visible = false;
         }
         if(loadGameCompleted)
         {
            loadingBar.visible = false;
         }
         else
         {
            _root.loaderInfo.addEventListener(ProgressEvent.PROGRESS,loadGameProgress);
            _root.loaderInfo.addEventListener(Event.COMPLETE,loadGameComplete);
         }
      }
      
      private function checkIsOurDomain() : Boolean
      {
         var _loc1_:String = null;
         if(_root.loaderInfo)
         {
            _loc1_ = _root.loaderInfo.url.toLowerCase();
            return _loc1_.indexOf(§\x05\x06\x05\x06§.§\x07\b\x07\b§(10)) > 0 || _loc1_.indexOf(§\x05\x06\x05\x06§.§\x07\b\x07\b§(0)) > 0 || _loc1_.indexOf(§\x05\x06\x05\x06§.§\x07\b\x07\b§(5)) > 0 || _loc1_.indexOf("file:///") == 0;
         }
         return true;
      }
      
      private function loadFrameworkComplete(param1:Event) : void
      {
         this.addEventListener(Event.ENTER_FRAME,checkFrameworkFirstInit);
      }
      
      private function checkLoadGameCompleteAndTryStart() : void
      {
         if(loadGameCompleted)
         {
            if(loadFrameworkFailed)
            {
               trace("加载 framework 失败");
               if(ifLoadFrameworkErrorCanPlayGame || checkIsOurDomain())
               {
                  if(false)
                  {
                     throw true;
                  }
                  trace("自动跳到游戏");
                  clickStartBtn();
               }
               else
               {
                  trace("不自动跳到游戏");
               }
            }
            else if(canNotShowAd)
            {
               if(checkIsOurDomain())
               {
                  §§push(§§findproperty(clickStartBtn));
                  if(false)
                  {
                     return;
                  }
                  §§pop().clickStartBtn();
               }
            }
         }
      }
      
      public function closeAd() : void
      {
         clickStartBtn();
      }
      
      private function loadFrameworkError(param1:IOErrorEvent) : void
      {
         var event:IOErrorEvent = param1;
         trace("剩余尝试加载次数:" + restLoadFrameworkTimes);
         §§push(§§findproperty(clearTimeout));
         §§push(timeoutId);
         if(false)
         {
            return false;
         }
         §§pop().clearTimeout(§§pop());
         if(--restLoadFrameworkTimes < 0)
         {
            loadFrameworkFailed = true;
            checkLoadGameCompleteAndTryStart();
         }
         else
         {
            try
            {
               frameworkLoader.close();
            }
            catch(e:Error)
            {
               §§push(e);
               if(false)
               {
                  return;
               }
               e = §§pop();
            }
            loadFramework();
         }
      }
      
      private function loadGameProgress(param1:ProgressEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:String = adType;
         §§push(AD_TYPE_LOADING);
         if(false)
         {
            return false;
         }
         switch(_loc3_)
         {
            case §§pop():
               _loc2_ = param1.bytesLoaded / param1.bytesTotal;
               loadingBar_bar.scaleX = 1;
               loadingBar_bar.scaleY = _loc2_;
               break;
            default:
               _root.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadGameProgress);
         }
      }
      
      private function clickStartBtn() : void
      {
         if(onClickStartBtn != null)
         {
            onClickStartBtn();
            onClickStartBtn = null;
         }
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
         this.visible = false;
         this.x = -10000;
      }
      
      private function removed(param1:Event) : void
      {
         this.removeEventListener(Event.REMOVED_FROM_STAGE,removed);
         _root.loaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadGameProgress);
         _root.loaderInfo.removeEventListener(Event.COMPLETE,loadGameComplete);
         onClickStartBtn = null;
         if(frameworkInitFinished)
         {
            lc.send(lc_sendName,"that2this","removed");
            §§push(lc);
            if(false)
            {
               return;
            }
            §§pop().client = new Object();
         }
      }
      
      private function loadGameComplete(param1:Event) : void
      {
         loadGameCompleted = true;
         loadingBar.visible = false;
         checkLoadGameCompleteAndTryStart();
         if(frameworkInitFinished)
         {
            lc.send(lc_sendName,"that2this","loadGameCompleted");
         }
      }
      
      private function loadFrameworkTimeout() : void
      {
         trace("loadFrameworkTimeout");
         loadFrameworkError(null);
      }
      
      private function lc_onStatus(param1:StatusEvent) : void
      {
         switch(param1.level)
         {
            case "error":
               trace("lc onStatus 出错 event=" + param1);
         }
      }
      
      public function that2this(... rest) : void
      {
         var result:* = undefined;
         var args:Array = rest;
         §§push(§§newactivation());
         if(false)
         {
            return;
         }
         switch(§§pop().§§slot[1][0])
         {
            case "initFinished":
               frameworkInitFinished = true;
               §§push(lc);
               if(false)
               {
                  return;
               }
               §§pop().send(lc_sendName,"that2this","confirmInitFinished",getFWAdValuesByNameArr(args.slice(1)));
               break;
            case "AsmMachine.run()":
               try
               {
                  result = Runner.runStr16(this,args[2]);
                  §§push(lc);
                  §§push(lc_sendName);
                  §§push("that2this");
                  §§push("AsmMachine.run()");
                  §§push(args[1]);
                  §§push("success");
                  §§push(§§newactivation());
                  if(false)
                  {
                     return false;
                  }
                  §§pop().send(§§pop(),§§pop(),§§pop(),§§pop(),§§pop(),§§pop().§§slot[2]);
               }
               catch(e:Error)
               {
                  §§push(lc);
                  if(false)
                  {
                     return;
                  }
                  §§pop().send(lc_sendName,"that2this","AsmMachine.run()",args[1],"error",e.toString());
               }
               break;
            case "clickStartBtn":
               clickStartBtn();
               break;
            case "canNotShowAd":
            case "noId":
               canNotShowAd = true;
               checkLoadGameCompleteAndTryStart();
               break;
            case "xml":
               try
               {
                  xml = new XML(args[1]);
               }
               catch(e:Error)
               {
                  trace("e=" + e);
               }
               if(onLoadXML != null)
               {
                  onLoadXML();
               }
         }
      }
      
      private function checkFrameworkFirstInit(param1:Event) : *
      {
         var ran:int = 0;
         var movie:AVM1Movie = null;
         var event:Event = param1;
         try
         {
            movie = frameworkLoader.content as AVM1Movie;
         }
         catch(e:Error)
         {
            return;
         }
         ran = Math.round(movie.getBounds(movie).x / 10);
         if(ran < -1000)
         {
            this.removeEventListener(Event.ENTER_FRAME,checkFrameworkFirstInit);
            lc_connName = "_FWAd" + ran;
            lc_sendName = "_Framework" + ran;
            lc = new LocalConnection();
            lc.allowDomain("*");
            lc.addEventListener(StatusEvent.STATUS,lc_onStatus);
            lc.connect(lc_connName);
            lc.client = this;
            loadFrameworkSuccess = true;
            clearTimeout(timeoutId);
            checkLoadGameCompleteAndTryStart();
         }
      }
      
      private function loadFramework() : void
      {
         frameworkLoader.load(new URLRequest(frameworkSWFPath));
         clearTimeout(timeoutId);
         timeoutId = setTimeout(loadFrameworkTimeout,loadFrameworkTimeoutTime * 1000);
      }
      
      private function getFWAdValuesByNameArr(param1:Array) : Object
      {
         var _loc2_:Object = null;
         var _loc3_:String = null;
         _loc2_ = new Object();
         for each(_loc3_ in param1)
         {
            _loc2_[_loc3_] = FWAd_AS3[_loc3_];
         }
         return _loc2_;
      }
   }
}

import flash.display.*;
import flash.events.*;
import flash.net.*;
import flash.system.*;
import flash.text.*;
import flash.utils.*;

class GetVariableCache
{
   public var varName:String;
   
   public function GetVariableCache(param1:String)
   {
      super();
      varName = param1;
   }
}

class Runner
{
   private static var offset:int;
   
   private static var codeData:ByteArray;
   
   private static var numData:ByteArray = new ByteArray();
   
   public function Runner()
   {
      super();
   }
   
   private static function readDoubleRev() : Number
   {
      numData[3] = codeData[offset++];
      numData[2] = codeData[offset++];
      numData[1] = codeData[offset++];
      var _loc1_:*;
      var _loc2_:* = (_loc1_ = §§findproperty(offset)).offset + 1;
      §§push(numData);
      §§push(0);
      §§push(codeData);
      §§push((_loc1_ = §§findproperty(offset)).offset);
      §§push(_loc1_);
      §§push(_loc2_);
      if(false)
      {
         return;
      }
      §§pop().offset = §§pop();
      §§pop()[§§pop()] = §§pop()[§§pop()];
      _loc2_ = (_loc1_ = §§findproperty(offset)).offset + 1;
      §§push(numData);
      §§push(7);
      §§push(codeData);
      §§push((_loc1_ = §§findproperty(offset)).offset);
      §§push(_loc1_);
      if(false)
      {
         return false;
      }
      §§pop().offset = _loc2_;
      §§pop()[§§pop()] = §§pop()[§§pop()];
      _loc2_ = (_loc1_ = §§findproperty(offset)).offset + 1;
      §§push(numData);
      §§push(6);
      §§push(codeData);
      §§push((_loc1_ = §§findproperty(offset)).offset);
      if(false)
      {
         return;
      }
      _loc1_.offset = _loc2_;
      §§pop()[§§pop()] = §§pop()[§§pop()];
      numData[5] = codeData[offset++];
      numData[4] = codeData[offset++];
      numData.position = 0;
      return numData.readDouble();
   }
   
   public static function run(param1:*, param2:ByteArray) : *
   {
      var _loc3_:Array = null;
      var _loc4_:int = 0;
      var _loc5_:Array = null;
      var _loc6_:Array = null;
      var _loc7_:Array = null;
      var _loc8_:int = 0;
      var _loc9_:int = 0;
      var _loc10_:String = null;
      var _loc11_:int = 0;
      var _loc12_:int = 0;
      var _loc13_:String = null;
      var _loc14_:* = undefined;
      var _loc15_:* = undefined;
      var _loc16_:* = undefined;
      var _loc17_:* = undefined;
      var _loc18_:int = 0;
      var _loc19_:String = null;
      var _loc20_:String = null;
      var _loc21_:int = 0;
      var _loc22_:Class = null;
      var _loc23_:* = undefined;
      var _loc24_:* = 0;
      var _loc25_:* = 0;
      §§push(0);
      if(false)
      {
         return;
      }
      var _loc26_:* = §§pop();
      var _loc27_:int = 0;
      codeData = param2;
      if(codeData.length > 0)
      {
         codeData.uncompress();
         _loc3_ = new Array();
         _loc4_ = int(codeData.readShort());
         _loc5_ = codeData.readObject();
         _loc6_ = codeData.readObject();
         if(_loc5_)
         {
            _loc9_ = int(_loc5_.length);
            loop0:
            while(true)
            {
               if(--_loc9_ >= 0)
               {
                  _loc10_ = _loc5_[_loc9_];
                  if(_loc10_ === null)
                  {
                     continue;
                  }
                  switch(_loc10_)
                  {
                     case "this":
                     case "\'this\'":
                        §§push(_loc5_);
                        if(false)
                        {
                           break loop0;
                        }
                        §§pop()[_loc9_] = param1;
                        break;
                     case "arguments":
                     case "\'arguments\'":
                        throw new Error("暂不支持 arguments");
                     case "super":
                     case "\'super\'":
                        throw new Error("暂不支持 super");
                     case "_root":
                        _loc5_[_loc9_] = param1.root;
                        break;
                     case "_parent":
                        _loc5_[_loc9_] = param1.parent;
                        break;
                     case "_global":
                        §§push(new Error("暂不支持 _global"));
                        if(false)
                        {
                           return false;
                        }
                        throw §§pop();
                        break;
                  }
               }
            }
            return;
         }
         _loc5_ = new Array();
         _loc7_ = new Array();
         offset = codeData.position;
         _loc8_ = int(codeData.length);
         loop1:
         while(offset < _loc8_)
         {
            §§push(codeData);
            var _loc28_:*;
            §§push(_loc28_ = §§findproperty(offset));
            if(false)
            {
               throw true;
            }
            var _loc29_:* = §§pop().offset + 1;
            _loc28_.offset = _loc29_;
            _loc26_ = int(§§pop()[§§pop().offset]);
            if(_loc26_ >= 128)
            {
               §§push(codeData[offset++]);
               §§push(codeData);
               §§push((_loc28_ = §§findproperty(offset)).offset);
               §§push((_loc28_ = §§findproperty(offset)).offset);
               if(false)
               {
                  return false;
               }
               _loc29_ = §§pop() + 1;
               _loc28_.offset = _loc29_;
               _loc25_ = §§pop() | §§pop()[§§pop()] << 8;
            }
            else
            {
               _loc25_ = 0;
            }
            _loc28_ = _loc26_;
            switch(if(0 === _loc28_)
            {
               §§push(0);
            }
            else if(4 === _loc28_)
            {
               §§push(1);
            }
            else if(5 === _loc28_)
            {
               §§push(2);
            }
            else if(6 === _loc28_)
            {
               §§push(3);
            }
            else if(7 === _loc28_)
            {
               §§push(4);
            }
            else if(11 !== _loc28_)
            {
               if(12 === _loc28_)
               {
                  §§push(6);
               }
               else if(13 === _loc28_)
               {
                  §§push(7);
               }
               else
               {
                  §§push(16);
                  §§push(_loc28_);
                  if(false)
                  {
                     throw true;
                  }
                  else if(§§pop() === §§pop())
                  {
                     §§push(8);
                  }
                  else if(17 === _loc28_)
                  {
                     §§push(9);
                  }
                  else if(18 === _loc28_)
                  {
                     §§push(10);
                  }
                  else if(19 === _loc28_)
                  {
                     §§push(11);
                  }
                  else if(23 === _loc28_)
                  {
                     §§push(12);
                  }
                  else if(24 === _loc28_)
                  {
                     §§push(13);
                  }
                  else if(28 === _loc28_)
                  {
                     §§push(14);
                     if(false)
                     {
                        return;
                     }
                  }
                  else if(29 === _loc28_)
                  {
                     §§push(15);
                  }
                  else if(38 === _loc28_)
                  {
                     §§push(16);
                  }
                  else if(48 === _loc28_)
                  {
                     §§push(17);
                  }
                  else if(50 !== _loc28_)
                  {
                     if(51 === _loc28_)
                     {
                        §§push(19);
                     }
                     else if(52 === _loc28_)
                     {
                        §§push(20);
                     }
                     else if(61 === _loc28_)
                     {
                        if(false)
                        {
                           throw true;
                        }
                        else
                        {
                           §§push(21);
                        }
                     }
                     else if(62 === _loc28_)
                     {
                        §§push(22);
                     }
                     else if(63 === _loc28_)
                     {
                        §§push(23);
                     }
                     else if(64 === _loc28_)
                     {
                        §§push(24);
                     }
                     else if(66 === _loc28_)
                     {
                        §§push(25);
                     }
                     else if(67 === _loc28_)
                     {
                        §§push(26);
                     }
                     else if(68 === _loc28_)
                     {
                        §§push(27);
                     }
                     else if(71 === _loc28_)
                     {
                        §§push(28);
                     }
                     else if(72 === _loc28_)
                     {
                        §§push(29);
                     }
                     else if(73 === _loc28_)
                     {
                        §§push(30);
                     }
                     else if(74 === _loc28_)
                     {
                        §§push(31);
                     }
                     else if(75 !== _loc28_)
                     {
                        if(76 === _loc28_)
                        {
                           §§push(33);
                        }
                        else if(77 === _loc28_)
                        {
                           §§push(34);
                        }
                        else if(78 === _loc28_)
                        {
                           §§push(35);
                        }
                        else if(79 === _loc28_)
                        {
                           §§push(36);
                        }
                        else if(80 === _loc28_)
                        {
                           §§push(37);
                        }
                        else if(81 === _loc28_)
                        {
                           §§push(38);
                        }
                        else if(82 === _loc28_)
                        {
                           §§push(39);
                        }
                        else if(83 === _loc28_)
                        {
                           §§push(40);
                        }
                        else if(84 === _loc28_)
                        {
                           §§push(41);
                        }
                        else if(85 === _loc28_)
                        {
                           §§push(42);
                        }
                        else if(96 === _loc28_)
                        {
                           §§push(43);
                        }
                        else if(97 !== _loc28_)
                        {
                           if(98 === _loc28_)
                           {
                              §§push(45);
                           }
                           else if(99 === _loc28_)
                           {
                              §§push(46);
                           }
                           else if(100 === _loc28_)
                           {
                              §§push(47);
                           }
                           else if(101 === _loc28_)
                           {
                              §§push(48);
                           }
                           else if(102 === _loc28_)
                           {
                              §§push(49);
                           }
                           else
                           {
                              §§push(103);
                              §§push(_loc28_);
                              if(false)
                              {
                                 return;
                              }
                              else
                              {
                                 §§push(§§pop() === §§pop() ? 50 : (129 === _loc28_ ? 51 : (131 === _loc28_ ? 52 : (135 === _loc28_ ? 53 : (150 === _loc28_ ? 54 : (153 === _loc28_ ? 55 : (157 === _loc28_ ? 56 : 57)))))));
                              }
                           }
                        }
                        else
                        {
                           §§push(44);
                        }
                     }
                     else
                     {
                        §§push(32);
                     }
                  }
                  else
                  {
                     §§push(18);
                  }
               }
            }
            else
            {
               §§push(5);
            })
            {
               case 0:
                  if(false)
                  {
                     return;
                  }
                  break;
               case 1:
                  if(param1 is MovieClip)
                  {
                     param1.nextFrame();
                  }
                  break;
               case 2:
                  if(param1 is MovieClip)
                  {
                     param1.prevFrame();
                  }
                  break;
               case 3:
                  if(param1 is MovieClip)
                  {
                     param1.play();
                  }
                  break;
               case 4:
                  if(param1 is MovieClip)
                  {
                     param1.stop();
                  }
                  break;
               case 5:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ - _loc17_;
                  if(false)
                  {
                     return;
                  }
                  _loc3_.push(_loc15_);
                  break;
               case 6:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ * _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 7:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ / _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 8:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  §§push(_loc16_);
                  if(_loc16_)
                  {
                     if(false)
                     {
                        throw true;
                     }
                     §§pop();
                     §§push(_loc17_);
                  }
                  _loc15_ = §§pop();
                  _loc3_.push(_loc15_);
                  break;
               case 9:
                  _loc17_ = _loc3_.pop();
                  §§push(_loc3_.pop());
                  if(false)
                  {
                     return;
                  }
                  _loc16_ = §§pop();
                  _loc15_ = (_loc16_) || _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 10:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = !_loc15_;
                  _loc3_.push(_loc15_);
                  break;
               case 11:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ == _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 12:
                  _loc3_.pop();
                  break;
               case 13:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = int(_loc15_);
                  _loc3_.push(_loc15_);
                  break;
               case 14:
                  cacheVariable(_loc3_);
                  break;
               case 15:
                  throw new Error("不支持 setVariable");
               case 16:
                  _loc15_ = _loc3_.pop();
                  trace(_loc15_);
                  break;
               case 17:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = int(_loc15_);
                  if(_loc15_ <= 0)
                  {
                     _loc15_ = 0;
                  }
                  else
                  {
                     §§push(int(Math.random() * _loc15_));
                     if(false)
                     {
                        return false;
                     }
                     _loc15_ = §§pop();
                  }
                  _loc3_.push(_loc15_);
                  break;
               case 18:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = _loc15_.charCodeAt(0);
                  _loc3_.push(_loc15_);
                  break;
               case 19:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = String.fromCharCode(_loc15_);
                  _loc3_.push(_loc15_);
                  break;
               case 20:
                  _loc15_ = getTimer();
                  _loc3_.push(_loc15_);
                  break;
               case 21:
                  _loc20_ = getFNameAndArgs(_loc3_,_loc7_);
                  _loc15_ = param1[_loc20_].apply(param1,_loc7_);
                  _loc3_.push(_loc15_);
                  break;
               case 22:
                  return _loc3_.pop();
               case 23:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ % _loc17_;
                  _loc3_.push(_loc15_);
                  if(false)
                  {
                     return;
                  }
                  break;
               case 24:
                  _loc20_ = getFNameAndArgs(_loc3_,_loc7_);
                  _loc15_ = newClass(_loc20_,_loc7_);
                  if(false)
                  {
                     return;
                  }
                  _loc3_.push(_loc15_);
                  break;
               case 25:
                  _loc21_ = int(_loc3_.pop());
                  _loc15_ = new Array();
                  while(--_loc21_ >= 0)
                  {
                     _loc15_.push(_loc3_.pop());
                  }
                  _loc3_.push(_loc15_);
                  if(false)
                  {
                     throw true;
                  }
                  break;
               case 26:
                  _loc21_ = int(_loc3_.pop());
                  _loc15_ = new Object();
                  while(true)
                  {
                     §§push(--_loc21_);
                     if(false)
                     {
                        break;
                     }
                     if(§§pop() < 0)
                     {
                        _loc3_.push(_loc15_);
                        continue loop1;
                     }
                     _loc17_ = _loc3_.pop();
                     _loc16_ = _loc3_.pop();
                     _loc15_[_loc16_] = _loc17_;
                  }
                  return false;
               case 27:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = typeof _loc15_;
                  _loc3_.push(_loc15_);
                  break;
               case 28:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ + _loc17_;
                  if(false)
                  {
                     return;
                  }
                  _loc3_.push(_loc15_);
                  break;
               case 29:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ < _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 30:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ == _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 31:
                  _loc15_ = _loc3_.pop();
                  §§push(Number(_loc15_));
                  if(false)
                  {
                     return;
                  }
                  _loc15_ = §§pop();
                  _loc3_.push(_loc15_);
                  break;
               case 32:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = String(_loc15_);
                  _loc3_.push(_loc15_);
                  break;
               case 33:
                  _loc15_ = _loc3_.pop();
                  _loc3_.push(_loc15_);
                  _loc3_.push(_loc15_);
                  break;
               case 34:
                  if(false)
                  {
                     return;
                  }
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc3_.push(_loc17_);
                  _loc3_.push(_loc16_);
                  break;
               case 35:
                  cacheMember(_loc3_);
                  break;
               case 36:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc3_.pop();
                  _loc15_[_loc16_] = _loc17_;
                  break;
               case 37:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = _loc15_ + 1;
                  _loc3_.push(_loc15_);
                  break;
               case 38:
                  _loc15_ = _loc3_.pop();
                  _loc15_ = _loc15_ - 1;
                  _loc3_.push(_loc15_);
                  break;
               case 39:
                  _loc20_ = _loc3_.pop();
                  _loc23_ = _loc3_.pop();
                  _loc21_ = int(_loc3_.pop());
                  §§push(new Array());
                  if(false)
                  {
                     return;
                  }
                  _loc15_ = §§pop();
                  while(--_loc21_ >= 0)
                  {
                     _loc15_.push(_loc3_.pop());
                  }
                  _loc15_ = _loc23_[_loc20_].apply(_loc23_,_loc15_);
                  _loc3_.push(_loc15_);
                  break;
               case 40:
                  _loc13_ = cacheMember(_loc3_);
                  _loc3_.pop();
                  _loc3_.push(_loc13_);
                  _loc20_ = getFNameAndArgs(_loc3_,_loc7_);
                  _loc15_ = newClass(_loc20_,_loc7_);
                  _loc3_.push(_loc15_);
                  break;
               case 41:
                  _loc17_ = _loc3_.pop();
                  §§push(_loc3_.pop());
                  §§push(_loc3_.pop());
                  if(false)
                  {
                     return;
                  }
                  _loc16_ = §§pop();
                  _loc15_ = §§pop() is _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 42:
                  _loc14_ = _loc3_.pop();
                  _loc3_.push(null);
                  for(_loc13_ in _loc14_)
                  {
                     _loc3_.push(_loc13_);
                  }
                  break;
               case 43:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ & _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 44:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ | _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 45:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ ^ _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 46:
                  §§push(_loc3_);
                  if(false)
                  {
                     return false;
                  }
                  _loc17_ = §§pop().pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ << _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 47:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ >> _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 48:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ >>> _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 49:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  §§push(_loc16_ === _loc17_);
                  if(false)
                  {
                     throw true;
                  }
                  _loc15_ = §§pop();
                  _loc3_.push(_loc15_);
                  break;
               case 50:
                  _loc17_ = _loc3_.pop();
                  _loc16_ = _loc3_.pop();
                  _loc15_ = _loc16_ > _loc17_;
                  _loc3_.push(_loc15_);
                  break;
               case 51:
                  if(param1 is MovieClip)
                  {
                     §§push(param1);
                     §§push(codeData);
                     §§push(_loc28_ = §§findproperty(offset));
                     if(false)
                     {
                        return;
                     }
                     _loc29_ = §§pop().offset + 1;
                     _loc28_.offset = _loc29_;
                     §§push(§§pop()[§§pop().offset]);
                     §§push(codeData);
                     §§push((_loc28_ = §§findproperty(offset)).offset);
                     if(false)
                     {
                        return false;
                     }
                     _loc29_ = §§pop() + 1;
                     _loc28_.offset = _loc29_;
                     §§pop().gotoAndStop((§§pop() | §§pop()[§§pop()] << 8) + 1);
                  }
                  else
                  {
                     offset += 2;
                  }
                  break;
               case 52:
                  _loc16_ = getStr();
                  _loc17_ = getStr();
                  if(_loc16_.indexOf("FSCommand:") == 0)
                  {
                     _loc16_ = _loc16_.substr(10);
                     fscommand(_loc16_,_loc17_);
                  }
                  else
                  {
                     §§push(_loc17_.indexOf("_level"));
                     if(false)
                     {
                        return;
                     }
                     if(§§pop() != 0)
                     {
                        navigateToURL(new URLRequest(_loc16_),_loc17_);
                     }
                  }
                  break;
               case 53:
                  _loc18_ = int(codeData[offset++]);
                  §§push(_loc3_);
                  if(false)
                  {
                     return false;
                  }
                  _loc15_ = §§pop()[_loc3_.length - 1];
                  _loc5_[_loc18_] = _loc15_;
                  break;
               case 54:
                  _loc27_ = offset + _loc25_;
                  while(offset < _loc27_)
                  {
                     switch(codeData[offset++])
                     {
                        case 0:
                           _loc3_.push(getStr());
                           break;
                        case 1:
                           _loc3_.push(readFloatRev());
                           break;
                        case 2:
                           _loc3_.push(null);
                           break;
                        case 3:
                           _loc3_.push(undefined);
                           break;
                        case 4:
                           _loc3_.push(_loc5_[codeData[offset++]]);
                           break;
                        case 5:
                           _loc3_.push(!!codeData[offset++] ? true : false);
                           break;
                        case 6:
                           _loc3_.push(readDoubleRev());
                           break;
                        case 7:
                           §§push(_loc3_);
                           §§push(codeData[offset++] | codeData[offset++] << 8);
                           §§push(codeData);
                           if(false)
                           {
                              return;
                           }
                           §§pop().push(§§pop() | §§pop()[offset++] << 16 | codeData[offset++] << 24);
                           break;
                        case 8:
                           _loc29_ = (_loc28_ = §§findproperty(offset)).offset + 1;
                           §§push(_loc3_);
                           §§push(_loc6_);
                           §§push(codeData);
                           §§push((_loc28_ = §§findproperty(offset)).offset);
                           §§push(_loc28_);
                           if(false)
                           {
                              return false;
                           }
                           §§pop().offset = _loc29_;
                           §§pop().push(§§pop()[§§pop()[§§pop()]]);
                           break;
                        case 9:
                           §§push(_loc3_);
                           §§push(_loc6_);
                           §§push(codeData);
                           §§push((_loc28_ = §§findproperty(offset)).offset);
                           §§push((_loc28_ = §§findproperty(offset)).offset);
                           if(false)
                           {
                              throw true;
                           }
                           _loc29_ = §§pop() + 1;
                           _loc28_.offset = _loc29_;
                           §§pop().push(§§pop()[§§pop()[§§pop()] | codeData[offset++] << 8]);
                           break;
                        default:
                           §§push(new Error("未处理的 push type"));
                           if(false)
                           {
                              return false;
                           }
                           throw §§pop();
                     }
                  }
                  break;
               case 55:
                  §§push(codeData);
                  §§push(§§findproperty(offset));
                  §§push(§§findproperty(offset));
                  if(false)
                  {
                     throw true;
                  }
                  _loc28_ = §§pop();
                  _loc29_ = §§pop().offset + 1;
                  _loc28_.offset = _loc29_;
                  _loc24_ = §§pop()[§§pop().offset] | codeData[offset++] << 8;
                  if(_loc24_ >>> 15)
                  {
                     _loc24_ |= 4294901760;
                  }
                  offset += _loc24_;
                  break;
               case 56:
                  _loc15_ = _loc3_.pop();
                  if(_loc15_)
                  {
                     _loc24_ = codeData[offset++] | codeData[offset++] << 8;
                     if(_loc24_ >>> 15)
                     {
                        _loc24_ |= 4294901760;
                     }
                     offset += _loc24_;
                  }
                  else
                  {
                     offset += 2;
                  }
                  break;
               default:
                  throw new Error("暂不支持的 op: " + _loc26_);
            }
         }
         return null;
      }
   }
   
   private static function varName2Obj(param1:String) : *
   {
      var varName:String = param1;
      try
      {
         return getDefinitionByName(varName);
      }
      catch(e:Error)
      {
      }
      try
      {
         return getDefinitionByName("flash.display." + varName);
      }
      catch(e:Error)
      {
         if(false)
         {
            return;
         }
      }
      try
      {
         return getDefinitionByName("flash.text." + varName);
      }
      catch(e:Error)
      {
         §§push(e);
         §§push(e);
         §§push(e);
         if(false)
         {
            return;
         }
         §§pop().§§slot[1] = §§pop();
         return new GetVariableCache(varName);
      }
   }
   
   public static function runStr16(param1:*, param2:String) : *
   {
      var _loc3_:Array = null;
      var _loc4_:* = null;
      var _loc5_:int = 0;
      _loc3_ = param2.split(" ");
      §§push(new ByteArray());
      if(false)
      {
         return;
      }
      _loc4_ = §§pop();
      _loc5_ = 0;
      for each(param2 in _loc3_)
      {
         var _loc8_:*;
         _loc4_[_loc8_ = _loc5_++] = int("0x" + param2);
      }
      §§push(§§findproperty(run));
      if(false)
      {
         return;
      }
      return §§pop().run(param1,_loc4_);
   }
   
   private static function newClass(param1:String, param2:Array) : *
   {
      var _loc3_:Class = null;
      _loc3_ = varName2Obj(param1) as Class;
      var _loc4_:* = param2.length;
      switch(_loc4_)
      {
         case 0:
         default:
            return new _loc3_();
         case §§push(1), §§pop():
            return new _loc3_(param2[0]);
         case 2:
            return new _loc3_(param2[0],param2[1]);
         case 3:
            return new _loc3_(param2[0],param2[1],param2[2]);
         case 4:
            return new _loc3_(param2[0],param2[1],param2[2],param2[3]);
         case 5:
            return new _loc3_(param2[0],param2[1],param2[2],param2[3],param2[4]);
         case 6:
            return new _loc3_(param2[0],param2[1],param2[2],param2[3],param2[4],param2[5]);
      }
   }
   
   private static function getFNameAndArgs(param1:Array, param2:Array, param3:Boolean = true) : String
   {
      var _loc4_:String = null;
      var _loc5_:int = 0;
      param2.splice(0,param2.length);
      if(param3)
      {
         _loc4_ = param1.pop();
      }
      §§push(param1);
      if(false)
      {
         return;
      }
      _loc5_ = int(§§pop().pop());
      while(--_loc5_ >= 0)
      {
         param2.push(param1.pop());
      }
      return _loc4_;
   }
   
   private static function getStr() : String
   {
      var _loc1_:int = 0;
      if(codeData[offset])
      {
         _loc1_ = 1;
         while(codeData[offset + _loc1_++])
         {
         }
         codeData.position = offset;
         offset += _loc1_;
         return codeData.readUTFBytes(_loc1_);
      }
      ++offset;
      return "";
   }
   
   private static function cacheMember(param1:Array) : String
   {
      var value:*;
      var stack:Array;
      var varName:String = null;
      var obj:Object = null;
      §§push(§§newactivation());
      if(false)
      {
         throw true;
      }
      §§pop().§§slot[4] = undefined;
      stack = param1;
      varName = stack.pop();
      obj = stack.pop();
      if(obj is GetVariableCache)
      {
         varName = (obj as GetVariableCache).varName + "." + varName;
         try
         {
            value = getDefinitionByName(varName);
         }
         catch(e:Error)
         {
            §§push(e);
            if(false)
            {
               throw true;
            }
            e = §§pop();
            value = new GetVariableCache(varName);
         }
      }
      else
      {
         value = obj[varName];
      }
      stack.push(value);
      return varName;
   }
   
   private static function readFloatRev() : Number
   {
      var _loc1_:*;
      var _loc2_:* = (_loc1_ = §§findproperty(offset)).offset + 1;
      §§push(numData);
      §§push(3);
      §§push(codeData);
      §§push((_loc1_ = §§findproperty(offset)).offset);
      §§push(_loc1_);
      §§push(_loc2_);
      if(false)
      {
         return false;
      }
      §§pop().offset = §§pop();
      §§pop()[§§pop()] = §§pop()[§§pop()];
      §§push(numData);
      §§push(2);
      §§push(codeData);
      §§push((_loc1_ = §§findproperty(offset)).offset);
      §§push((_loc1_ = §§findproperty(offset)).offset + 1);
      if(false)
      {
         return false;
      }
      _loc2_ = §§pop();
      _loc1_.offset = _loc2_;
      §§pop()[§§pop()] = §§pop()[§§pop()];
      numData[1] = codeData[offset++];
      §§push(numData);
      §§push(0);
      §§push(codeData);
      §§push(§§findproperty(offset));
      if(false)
      {
         return;
      }
      §§pop()[§§pop()] = §§pop()[§§pop().offset++];
      numData.position = 0;
      return numData.readFloat();
   }
   
   private static function cacheVariable(param1:Array) : String
   {
      var _loc2_:String = null;
      var _loc3_:* = undefined;
      _loc2_ = param1.pop();
      _loc3_ = varName2Obj(_loc2_);
      param1.push(_loc3_);
      return _loc2_;
   }
}
