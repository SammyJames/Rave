local ZO_Object         = ZO_Object
local ModulePrototype   = ZO_Object:Subclass()
local CBM               = CALLBACK_MANAGER

function ModulePrototype:New()
    local result = ZO_Object.New( self )
    result:Initialize()
    return result
end

function ModulePrototype:Initialize()
    self.db = {}
end

function ModulePrototype:Enable( ... )
    -- body
end

function ModulePrototype:Disable( ... )
    -- body
end

function ModulePrototype:SetValue( key, value )
    self.db[ key ] = value
end

function ModulePrototype:GetValue( key )
    return self.db[ key ]
end