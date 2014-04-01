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
local LINK_HANDLER  = LINK_HANDLER

function Rave:Initialize( control )
    self.Window:Initialize( control )
    self.Edit:Initialize( control:GetNamedChild( 'Edit' ) )

    self:RegisterEvent( EVENT_ADD_ON_LOADED,            function( ... ) self:HandleAddonLoaded( ... )       end )
    self:RegisterEvent( EVENT_CHAT_MESSAGE_CHANNEL,     function( ... ) self:HandleChatMessage( ... )       end )
    self:RegisterEvent( EVENT_CHAT_CHANNEL_JOIN,        function( ... ) self:HandleChatChannelJoin( ... )   end )
    self:RegisterEvent( EVENT_CHAT_CHANNEL_LEAVE,       function( ... ) self:HandleChatChannelLeave( ... )  end )
end

function Rave:HandleAddonLoaded( addon )
    if ( addon ~= kAddonName ) then
        return
    end

    self.db = ZO_SavedVars:NewAccountWide( 'RAVE_DB', kVersion, nil, nil )

    ZO_CreateStringId("SI_BINDING_NAME_RAVE_GUILD1", "Guild 1")
    ZO_CreateStringId("SI_BINDING_NAME_RAVE_GUILD2", "Guild 2")
    ZO_CreateStringId("SI_BINDING_NAME_RAVE_GUILD3", "Guild 3")
    ZO_CreateStringId("SI_BINDING_NAME_RAVE_GUILD4", "Guild 4")
    ZO_CreateStringId("SI_BINDING_NAME_RAVE_GUILD5", "Guild 5")

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

    print( 'Rave module registered %s', tostring( moduleId ) )
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
    self.Window:RegisterEvent( event, function( ... ) self:HandleEvent( ... ) end )
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

function Rave:RegisterKey( keyId, callback )
    if ( self.KeyRegistry[ keyId ] ) then
        print( 'This key is already registered, sorry.' )
        return
    end

    self.KeyRegistry[ keyId ] = callback
end

function Rave:UnregisterKey( keyId, callback )
    if ( not self.KeyRegistry[ keyId ] ) then
        return
    end

    self.KeyRegistry[ keyId ] = nil
end

function Rave:KeyUp( keyId )
    if ( not self.KeyRegistry[ keyId ] ) then
        return
    end

    self.KeyRegistry[ keyId ]()
end

function Rave:HandleChatMessage( messageType, from, text )

end

function Rave:HandleChatChannelJoin( ... )
    -- body
end

function Rave:HandleChatChannelLeave( ... )
    -- body
end

function Rave:StartChatInput( text, channel, target )
    -- body
end