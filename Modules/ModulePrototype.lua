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
    -- body
end

function ModulePrototype:Disable()
    -- body
end

function ModulePrototype:SetValue( key, value )
    self.db[ key ] = value
end

function ModulePrototype:GetValue( key )
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

Rave.ModulePrototype = ModulePrototype