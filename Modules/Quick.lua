local ModulePrototype   = Rave.ModulePrototype
local Quick             = ModulePrototype:Subclass()
local Constants         = Rave.Constants
local CBM               = CALLBACK_MANAGER

CBM:RegisterCallback( Constants.Callbacks.Loaded, 
    function() 
        Rave:RegisterModule( Constants.Modules.Quick, Quick, 1.0 )
    end
)