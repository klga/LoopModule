# LoopModule
Create client sided loops for roblox using `RunService.RenderStepped`



# Usage
`LoopObject = LoopModule.new(callback[,arguments])`

Returns a loop object connected to a callback function with optional arguments. Callback is run in a loop once it is binded. Supports multiple arguments.

`LoopObject:Bind(t)`

Binds the loop object to `RenderStepped`. 

Callback will loop in the interval `t` (seconds).

`LoopObject:Unbind()`

Unbinds the loop object from `RenderStepped`.

`LoopObject:OnIteration(callback)`

Sets the given callback to run after each iteration of the loop. Callback is given one argument `i` as `i = IterationCount`. IterationCount is updated on completion of each iteration.

`LoopObject:Destroy()`

Destroys and unbinds the loop object.
