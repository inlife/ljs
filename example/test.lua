-- Compiled in LJS v0.1. 
-- https://github.com/Inlife/ljs 
class "Foo" {

    __init__ = function(self)
        self.data = "Foo";
    end,
}


class "Bar" (Foo ){
    
    __init__ = function(self, param1, param2) 
        self.data = "Bar";
    end,

    publicMethod = function(self)

    end,

    staticMethod = function()

    end,
}

local b = Bar();
b:publicMethod();