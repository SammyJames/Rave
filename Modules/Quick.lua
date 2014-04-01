local ModulePrototype   = Rave.ModulePrototype
local Quick             = ModulePrototype:Subclass()
local Constants         = Rave.Constants
local CBM               = CALLBACK_MANAGER

function Quick:Initialize( ... )
    ModulePrototype.Initialize( self, ... )

   self:RegisterKey( Constants.Keys.Guild1, function() self:OnGuild( Constants.Keys.Guild1 ) end )
   self:RegisterKey( Constants.Keys.Guild2, function() self:OnGuild( Constants.Keys.Guild2 ) end )
   self:RegisterKey( Constants.Keys.Guild3, function() self:OnGuild( Constants.Keys.Guild3 ) end )
   self:RegisterKey( Constants.Keys.Guild4, function() self:OnGuild( Constants.Keys.Guild4 ) end )
   self:RegisterKey( Constants.Keys.Guild5, function() self:OnGuild( Constants.Keys.Guild5 ) end )
   self:RegisterKey( Constants.Keys.Reply, function() self:OnReply() end )
end

function Quick:OnGuild( keyId )
end

function Quick:OnReply()
end

CBM:RegisterCallback( Constants.Callbacks.Loaded, 
    function() 
        Rave:RegisterModule( Constants.Modules.Quick, Quick, 1.0 )
    end
)