//neural net struct
Net = function(_isRecurrent = false, layerSizes)constructor {
	
	var numOutputs = layerSizes[array_length(layerSizes) - 1];	
	
	isRecurrent = _isRecurrent;
	layerSizes = [3, 3];
	weights = [[[]]];
	
	charges = [[]];
	for (var layer = 0; layer < array_length(layerSizes); layer++)
	{
		charges[layer] = new Array(layerSizes[layer]);
		for (var neuron = 0; neuron < layerSizes[layer]; neuron++)
			charges[layer][neuron] = 0;
	}
	
	activate = function (input = []) {}
}



