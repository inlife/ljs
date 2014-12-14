-- Compiled in LuaMac v0.1. 
-- github 







class "Asd" {

    __init__ = function(self)
        self.data = "asd";
    end,
}


class "Example" (Asd) {
    
    __init__ = function(self, data, gasd) 
        self.data = "Example";
    end,

    method = function()

    end,
}

local b = Example();
b:getAllShit();