LJS
=====
Lua JavaScript-like pseudo syntax translator. It is written on php 5.3.
Working via regex, translating by rules, described in __pattern__ file.

##Usage
`$ php ljs input [pattern [output]]`

`$ php ljs path/to/file.ljs` - default output is filename: __path/to/file__.lua<br>
`$ php ljs path/to/file.ljs pattern.ljsp`<br>
`$ php ljs path/to/file.ljs pattern.ljsp other/path/to/file.lua` 

##Example
This __ljs__ code:
```js
class Foo {
    public function constructor()
        self.data = "foo";
    end,
}

class Bar extends Foo {
    
    public function constructor(param1, param2) 
        self.data = "bar";
    end,

    public function publicMethod()
        print( self.data );
    end,

    static function staticMethod()
        print( "Static" );
    end,
}

var b = new Bar();
b->publicMethod();
```
<br>
Using this pattern:
```
#define class ? extends ?? #def_as class $1 ($2) #end_def
#define class ? #def_as class "$1" #end_def
#define function constructor #def_as function __init__ #end_def

#define 
    public function ?() 
#def_as 
    $1 = function(self) 
#end_def

#define public function ?(??) #def_as $1 = function(self, $2) #end_def

#define static function ?() #def_as $1 = function() #end_def
#define static function ?(??) #def_as $1 = function($2) #end_def

#define -> #def_as : #end_def
#define var ? #def_as local $1 #end_def
#define new ?( #def_as $1( #end_def
```

<br>
Will be translated to this __lua__ code:
```lua
class "Foo" {
    __init__ = function(self)
        self.data = "Foo";
    end,
}


class "Bar" (Foo) {
    
    __init__ = function(self, param1, param2) 
        self.data = "Bar";
    end,

    publicMethod = function(self)
        print( self.data );
    end,

    staticMethod = function()
        print( "Static" );
    end,
}

local b = Bar();
b:publicMethod();
```