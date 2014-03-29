----------------------------------------------------------
-- Rave - a chat addon 
--
-- @author Pawkette ( pawkette.heals@gmail.com )
----------------------------------------------------------
local ZO_Object = ZO_Object
local Rave      = ZO_Object:Subclass()

function Rave:New( control )
    local result = ZO_Object.New( self )
    result:Initialize( control )
    return result
end

function Rave:Initialize( control )
    self.control = control
end

local function LetsRave( control )
    RAVE = Rave:New( control )
end