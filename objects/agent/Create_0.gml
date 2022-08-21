//neural net struct
Net = function(_isRecurrent = false, layerSizes)constructor {
	
	var numOutputs = layerSizes[array_length(layerSizes) - 1];	
	
	isRecurrent = _isRecurrent;
	layerSizes = [3, 3];
	weights = [[[]]];
	
	charges = create_array(array_length(layerSizes));
	for (var layer = 0; layer < array_length(layerSizes); layer++)
	{
		charges[layer] = create_array(layerSizes[layer]);
		for (var neuron = 0; neuron < layerSizes[layer]; neuron++)
			charges[layer][neuron] = 0;
	}
	
	//fully interconnected random weights 
	weights = create_array(array_length(layerSizes) - 1);
	for (var layer = 0; layer < weights.length; layer++)
	{
		//initialize all weights to random values
		weights[layer] = create_array(layerSizes[layer]);
		for (var neuron = 0; neuron < layerSizes[layer]; neuron++)
		{
			//connections to previous layer
			weights[layer][neuron] = create_array(layerSizes[layer + 1])
			for (var w = 0; w < layerSizes[layer + 1]; w++)
				weights[layer][neuron][w] = 0; //TODO: random zero centered inital values;
		}
	}
	
	activate = function (input = []) {}
}



