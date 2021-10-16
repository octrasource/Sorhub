ITEM.name = "Burger"
ITEM.description = "A burger, eaten a lot as fast-food."
ITEM.model = "models/foodnhouseholditems/burgergtasa.mdl"
ITEM.category = "Food"
ITEM.functions.Eat = {
	icon = "icon16/cake.png",
	sound = "player/footsteps/gravel1.wav",
	OnRun = function(item)
		item.player:addHunger(20000)
		item.player:addThirst(5000)
	end
}