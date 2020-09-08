local loop = require(game.ReplicatedStorage.LoopModule)

local function test(msg)
	print(msg)
end

local testLoop = loop.new(test,"hi")

local function oLC(i)
	if i >= 4 then
		testLoop:Unbind()
	end
end

testLoop:OnIteration(oLC)

testLoop:Bind(1)
