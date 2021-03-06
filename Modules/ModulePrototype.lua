local ZO_Object         = ZO_Object
local Rave              = Rave
local ModulePrototype   = ZO_Object:Subclass()

function ModulePrototype:New( identity, version )
    local result = ZO_Object.New( self )
    result:Initialize( identity, version )
    return result
end

function ModulePrototype:Initialize( identity, version )
    self.__identity = identity
    self.__version  = version
    self.db         = Rave:GetModuleSettings( identity )
end

function ModulePrototype:Enable()
end

function ModulePrototype:Disable()
end

function ModulePrototype:SetSetting( key, value )
    self.db[ key ] = value
end

function ModulePrototype:GetSetting( key )
    return self.db[ key ]
end

function ModulePrototype:RegisterEvent( event, callback )
    Rave:RegisterEvent( event, callback )
end

function ModulePrototype:UnregisterEvent( event, callback )
    Rave:UnregisterEvent( event, callback )
end

function ModulePrototype:OnUpdate( frameTime )

end

function ModulePrototype:RegisterKey( keyId, callback )
    Rave:RegisterKey( keyId, callback )
end

function ModulePrototype:UnregisterKey( keyId, callback )
    Rave:UnregisterKey( keyId, callback )
end

Rave.ModulePrototype = ModulePrototype