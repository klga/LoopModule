loop = {}

loop.id = 0

loop.new = function(callback,...)
	local self = {}
	
	self.frequency = 1
	self.func = callback
	self.elapsed = 0
	self.args = {...}
	self.iterations = 0
	
	loop.id += 1
	
	self.id = string.format("LOOP_%d", loop.id)
	
	return setmetatable(self,{__index = loop})
end

function loop:Bind(frequency)
	if frequency and tonumber(frequency) then
		self.frequency = frequency
	end
	
	local function toBind(dt)
		if self.frequency < dt then
			warn(string.format("delta time exceeded loop frequency, using minimum: %.6f", dt))
		end
		
		self.elapsed += dt
		
		if self.elapsed >= self.frequency then
			self.elapsed = 0
			self.func(table.unpack(self.args))
			
			self.iterations += 1
			
			if self.completionCallback then
				self.completionCallback(self.iterations)
			end
		end
	end
	
	game:GetService("RunService"):BindToRenderStep(self.id,Enum.RenderPriority.First.Value,toBind)
end

function loop:Unbind()
	local success,err = pcall(function()
		game:GetService("RunService"):UnbindFromRenderStep(self.id)
	end)
	
	if not success then
		warn(string.format("Unable to unbind loop: %s", err))
	end
	
	self = nil
end

function loop:onIteration(callback)
	self.completionCallback = callback
end

return loop
