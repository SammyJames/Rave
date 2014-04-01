local Rave = Rave
local Buffer = Rave.Buffer

function Buffer:Initialize( buffer )
    self.control = buffer

    self.control:SetHandler( 'OnLinkClicked', function( ... ) self:HandleLinkClicked( ... ) end )
end

function Buffer:HandleLinkClicked(  )
    -- body
end