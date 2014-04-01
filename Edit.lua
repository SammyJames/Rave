local Rave = Rave
local Edit = Rave.Edit 

function Edit:Initialize( editbox )
    self.control = editbox

    self.control:SetHandler( 'OnEnter',         function( ... ) self:HandleEnter( ... )         end )
    self.control:SetHandler( 'OnMouseUp',       function( ... ) self:HandleMouseUp( ... )       end )
    self.control:SetHandler( 'OnMouseDown',     function( ... ) self:HandleMouseDown( ... )     end )
    self.control:SetHandler( 'OnFocusLost',     function( ... ) self:HandleFocusLost( ... )     end )
    self.control:SetHandler( 'OnEscape',        function( ... ) self:HandleEscape( ... )        end )
    self.control:SetHandler( 'OnUpArrow',       function( ... ) self:HandleUpArrow( ... )       end )
    self.control:SetHandler( 'OnDownArrow',     function( ... ) self:HandleDownArrow( ... )     end )
    self.control:SetHandler( 'OnBackspace',     function( ... ) self:HandleBackspace( ... )     end )
    self.control:SetHandler( 'OnTextChanged',   function( ... ) self:HandleTextChanged( ... )   end )
    self.control:SetHandler( 'OnTab',           function( ... ) self:HandleTab( ... )           end )
end

function Edit:HandleEvent()

end

function Edit:HandleMouseUp( ... )
    -- body
end

function Edit:HandleMouseDown( ... )
    -- body
end

function Edit:HandleFocusLost( ... )
    -- body
end

function Edit:HandleEscape( ... )
    -- body
end

function Edit:HandleUpArrow( ... )
    -- body
end

function Edit:HandleDownArrow( ... )
    -- body
end

function Edit:HandleBackspace( ... )
    -- body
end

function Edit:HandleTextChanged( ... )
    -- body
end

function Edit:HandleTab( ... )

end