----------------------------------------------------------
-- Rave - a chat addon 
--
-- @author Pawkette ( pawkette.heals@gmail.com )
----------------------------------------------------------
Rave = 
{
    EventRegistry   = {},
    Modules         = {},
    db              = {},
    control         = nil
}

local kAddonName, kVersion = 'Rave', 1.0

local Rave          = Rave
local tinsert       = table.insert
local tremove       = table.remove
local ZO_SavedVars  = ZO_SavedVars

function Rave:Initialize( control )
    self.control = control

    self:RegisterForEvent( EVENT_ADD_ON_LOADED, function( ... ) self:HandleAddonLoaded( ... ) end )
end

function Rave:HandleAddonLoaded( addon )
    if ( addon ~= kAddonName ) then
        return
    end

    self.db = ZO_SavedVars:NewAccountWide( 'RAVE_DB', kVersion, nil, nil )
end

function Rave:RegisterForEvent( event, callback )
    if ( not self.EventRegistry[ event ] ) then
        self.EventRegistry[ event ] = {}
    end

    tinsert( self.EventRegistry[ event ], callback )
    self.control:RegisterForEvent( event, function( ... ) self:HandleEvent( ... ) end )
end

function Rave:UnregisterForEvent( event, callback )
    if ( not self.EventRegistry[ event ] ) then
        return
    end

    local listeners = self.EventRegistry[ event ]
    for i=#listeners,1,-1 do
        if ( listeners[ i ] == callback ) then
            tremove( listeners, i )
            break
        end
    end

    if ( #listeners == 0 ) then
        self.EventRegistry[ event ] = nil
    end
end

function Rave:HandleEvent( event, ... )
    if ( not self.EventRegistry[ event ] ) then
        return
    end

    local listeners = self.EventRegistry[ event ]
    for i=1,#listeners do
        listeners[ i ]( ... )
    end
end

function LetsRave( control )
    Rave:Initialize( control )
end