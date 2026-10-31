package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class ObjectUtil
   {
      public function ObjectUtil()
      {
         super();
      }
      
      public static function getLinkageObj(param1:String) : Object
      {
         var _loc2_:Class = null;
         _loc2_ = getDefinitionByName(param1) as Class;
         if(_loc2_ == null)
         {
            _loc2_ = getClassByAlias(param1);
         }
         if(_loc2_ == null)
         {
            return null;
         }
         return new _loc2_();
      }
      
      public static function baseClone(param1:*) : *
      {
         var _loc2_:ByteArray = null;
         registerClass(param1);
         _loc2_ = new ByteArray();
         _loc2_.writeObject(param1);
         _loc2_.position = 0;
         return _loc2_.readObject();
      }
      
      private static function registerClass(param1:*) : void
      {
         var _loc2_:String = null;
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc7_:String = null;
         _loc2_ = getQualifiedClassName(param1);
         regtype(_loc2_);
         if(_loc2_ == "Array" || _loc2_ == "flash.utils::Dictionary")
         {
            for(_loc7_ in param1)
            {
               registerClass(param1[_loc7_]);
            }
         }
         _loc3_ = describeType(param1);
         for each(_loc4_ in _loc3_.accessor)
         {
            registerClass(param1[_loc4_.@name]);
         }
         var _loc8_:int = 0;
         var _loc9_:* = _loc3_.variable;
         for each(_loc8_ in _loc9_)
         {
            §§push(_loc8_);
            if(false)
            {
               return false;
            }
            _loc5_ = §§pop();
            registerClass(param1[_loc5_.@name]);
         }
         for each(_loc6_ in _loc3_.implementsInterface)
         {
            regtype(_loc6_.@type);
         }
         regtype(_loc3_.extendsClass.@type);
      }
      
      private static function regtype(param1:String) : void
      {
         var type:Class = null;
         var tn:String = param1;
         §§push(tn == null);
         if(!(tn == null))
         {
            if(false)
            {
               return false;
            }
            §§pop();
            §§push(tn == "null");
         }
         §§push(§§pop() || tn == "int");
         if(!(§§pop() || tn == "int"))
         {
            §§pop();
            if(false)
            {
               return;
            }
            §§push(tn == "string");
         }
         §§push(§§pop() || tn == "Number" || tn == "String" || tn == "Boolean");
         if(!(§§pop() || tn == "Number" || tn == "String" || tn == "Boolean"))
         {
            §§pop();
            §§push(tn == "Object");
            if(false)
            {
               return false;
            }
         }
         if(§§pop())
         {
            return;
         }
         try
         {
            type = getClassByAlias(tn);
         }
         catch(err:Error)
         {
         }
         if(type != null)
         {
            return;
         }
         try
         {
            type = Class(getDefinitionByName(tn));
         }
         catch(err:Error)
         {
            return;
         }
         if(type != null)
         {
            registerClassAlias(tn,type);
            return;
         }
      }
   }
}

