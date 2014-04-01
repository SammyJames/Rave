local ModulePrototype   = Rave.ModulePrototype
local Spam              = ModulePrototype:Subclass()
local Constants         = Rave.Constants
local CBM               = CALLBACK_MANAGER

CBM:RegisterCallback( Constants.Callbacks.Loaded, 
    function() 
        Rave:RegisterModule( Constants.Modules.Spam, Spam, 1.0 )
    end
)