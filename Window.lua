local Rave = Rave
local Window = Rave.Window

function Window:Initialize( control )
    self.control = control 

    self.control:SetHandler( 'OnUpdate',        function( ... ) Rave:OnUpdate( ... )            end )
    self.control:SetHandler( 'OnResizeStart',   function( ... ) self:HandleResizeStart( ... )   end )
    self.control:SetHandler( 'OnResizeStop',    function( ... ) self:HandleResizeStop( ... )    end )
    self.control:SetHandler( 'OnMouseEnter',    function( ... ) self:HandleMouseEnter( ... )    end )
    self.control:SetHandler( 'OnMouseWheel',    function( ... ) self:HandleMouseWheel( ... )    end )
    self.control:SetHandler( 'OnMoveStart',     function( ... ) self:HandleMoveStart( ... )     end )
    self.control:SetHandler( 'OnMoveStop',      function( ... ) self:HandleMoveStop( ... )      end )
end

function Window:RegisterEvent( ... )
    self.control:RegisterForEvent( ... )
end

function Window:HandleResizeStart( ... )
    -- body
end

function Window:HandleResizeStop( ... )
    -- body
end

function Window:HandleMouseEnter( ... )
    -- body
end

function Window:HandleMouseWheel( ... )
    -- body
end

function Window:HandleMoveStart( ... )
    -- body
end

function Window:HandleMoveStop( ... )
    -- body
end