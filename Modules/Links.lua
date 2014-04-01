local ModulePrototype   = Rave.ModulePrototype
local Links             = ModulePrototype:Subclass()
local Constants         = Rave.Constants
local CBM               = CALLBACK_MANAGER
local LM                = LINK_HANDLER

local CHARACTER_LINK_TYPE       = CHARACTER_LINK_TYPE
local DISPLAY_NAME_LINK_TYPE    = DISPLAY_NAME_LINK_TYPE
local CHANNEL_LINK_TYPE         = CHANNEL_LINK_TYPE
local URL_LINK_TYPE             = 'url'
local ZO_LinkHandler_CreateLink = ZO_LinkHandler_CreateLink
local url_color                 = ZO_ColorDef:New( 236, 251, 105, 1 )

function Links:Initialize( ... )
    ModulePrototype.Initialize( self, ... )

    LM:RegisterCallback( LM.INSERT_LINK_EVENT,  Links.HandleInsertLink,      self )
    LM:RegisterCallback( LM.LINK_CLICKED_EVENT, Links.HandleLinkClicked,     self )
end

function Links:HandleInsertLink( link )
    -- body
end

function Links:HandleLinkClicked( link, button, text, color, linkType, ... )
    -- body
end

function Links:CreateUrlLink( address )
    return ZO_LinkHandler_CreateLink( address, url_color, URL_LINK_TYPE )
end

CBM:RegisterCallback( Constants.Callbacks.Loaded, 
    function() 
        Rave:RegisterModule( Constants.Modules.Links, Links, 1.0 )
    end
)