----------------------------------------------------------
-- Rave - a chat addon 
--
-- @author Pawkette ( pawkette.heals@gmail.com )
----------------------------------------------------------
local kAddonName, kVersion = 'Rave', 1.0

local Rave          = Rave
local Constants     = Rave.Constants

local tinsert       = table.insert
local tremove       = table.remove
local ZO_SavedVars  = ZO_SavedVars
local CBM           = CALLBACK_MANAGER

function Rave:Initialize( control )
    self.control = control
    self.control:SetHandler( 'OnUpdate', function( ... ) self:OnUpdate( ... ) end )

    self:RegisterEvent( EVENT_ADD_ON_LOADED, function( ... ) self:HandleAddonLoaded( ... ) end )
end

function Rave:HandleAddonLoaded( addon )
    if ( addon ~= kAddonName ) then
        return
    end

    self.db = ZO_SavedVars:NewAccountWide( 'RAVE_DB', kVersion, nil, nil )

    CBM:FireCallbacks( Constants.Callbacks.Loaded )
end

function Rave:OnUpdate( frameTime )
    if ( not #self.Modules ) then
        return
    end

    local modules = self.Modules
    for i=1,#modules do
        modules[ i ]:OnUpdate( frameTime )
    end
end

function Rave:RegisterModule( moduleId, module, version )
    if ( self.Modules[ moduleId ] and self.Modules[ moduleId ].__version > version ) then
        return
    end

    self.Modules[ moduleId ] = module:New( moduleId, version )
end

function Rave:GetModule( moduleId )
    if ( not self.Modules[ moduleId ] ) then
        return nil
    end

    return self.Modules[ moduleId ]
end

function Rave:RegisterEvent( event, callback )
    if ( not self.EventRegistry[ event ] ) then
        self.EventRegistry[ event ] = {}
    end

    tinsert( self.EventRegistry[ event ], callback )
    self.control:RegisterForEvent( event, function( ... ) self:HandleEvent( ... ) end )
end

function Rave:UnregisterEvent( event, callback )
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

function Rave:GetModuleSettings( moduleId )
    if ( not self.db[ moduleId ] ) then
        self.db[ moduleId ] = {}
    end

    return self.db[ moduleId ]
end

function Rave:SetModuleSettings( moduleId, settings )
    self.db[ moduleId ] = settings
end

function LetsRave( control )
    Rave:Initialize( control )
end