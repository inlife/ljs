#define class ? extends ? #def_as class $1 ($2) #end_def
#define class ? #def_as class "$1" #end_def

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

#compress false