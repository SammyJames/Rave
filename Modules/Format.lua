local ModulePrototype   = Rave.ModulePrototype
local Format            = ModulePrototype:Subclass()
local Constants         = Rave.Constants
local CBM               = CALLBACK_MANAGER

CBM:RegisterCallback( Constants.Callbacks.Loaded, 
    function() 
        Rave:RegisterModule( Constants.Modules.Format, Format, 1.0 )
    end
)