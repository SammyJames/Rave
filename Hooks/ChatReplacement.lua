--[[ZO_ChatWindow:SetHidden( true )
ZO_ChatWindow = nil

if ( StartChatInput ) then
    StartChatInput = function() Rave:StartChatInput() end
end

CHAT_SYSTEM = nil
]]

local Rave = Rave

ChatReplyToLastWhisper = function()
    Rave:KeyUp( Rave.Constants.Keys.Reply )
end

StartChatInput = function( text, channel, target )
    Rave:StartChatInput( text, channel, target )
end