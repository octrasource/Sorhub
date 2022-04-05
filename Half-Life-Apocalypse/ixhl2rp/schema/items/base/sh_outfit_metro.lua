ITEM.base = "base_outfitfull"
ITEM.name = "Armored Clothes"
ITEM.description = "A suitcase full of clothes."
ITEM.model = Model("models/props_c17/suitcase_passenger_physics.mdl")
ITEM.category = "Armored Clothing"
ITEM.width = 2
ITEM.height = 2
ITEM.maxArmor = 0
ITEM.unitName = "unitName"

local faction = 1 -- citizen faction
local prefix = ITEM.unitName

if (CLIENT) then
	function ITEM:PopulateTooltip(tooltip)
		local panel = tooltip:AddRowAfter("name", "armor")
		panel:SetBackgroundColor(derma.GetColor("Warning", tooltip))
		panel:SetText("Armor: " .. (self:GetData("equip") and LocalPlayer():Armor() or self:GetData("armor", self.maxArmor)))
		panel:SizeToContents()
	end
end

function ITEM:OnEquipped()
	--self:SetData("oldname", self.player:GetCharacter():GetName())
	--self.player:GetCharacter():SetName("MPF."..prefix.."."..self.player:GetData("id", "00000")) -- set their new name

	self.player:SetArmor(self:GetData("armor", self.maxArmor))
end

function ITEM:OnUnequipped()
	self:SetData("armor", math.Clamp(self.player:Armor(), 0, self.maxArmor))
	self.player:SetArmor(0)

	--self.player:GetCharacter():SetName(self.GetData("oldname", "noname")) -- set their old name
end

function ITEM:Repair(amount)
	self:SetData("armor", math.Clamp(self:GetData("armor") + amount, 0, self.maxArmor))
end

function ITEM:OnLoadout()
	if (self:GetData("equip")) then
		self.player:SetArmor(self:GetData("armor", self.maxArmor))
	end
end

function ITEM:OnSave()
	if (self:GetData("equip")) then
		self:SetData("armor", math.Clamp(self.player:Armor(), 0, self.maxArmor))
	end
end