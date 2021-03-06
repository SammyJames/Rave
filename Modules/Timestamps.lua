local ModulePrototype   = Rave.ModulePrototype
local Timestamps        = ModulePrototype:Subclass()
local Constants         = Rave.Constants
local CBM               = CALLBACK_MANAGER

CBM:RegisterCallback( Constants.Callbacks.Loaded, 
    function() 
        Rave:RegisterModule( Constants.Modules.Timestamps, Timestamps, 1.0 )
    end
)