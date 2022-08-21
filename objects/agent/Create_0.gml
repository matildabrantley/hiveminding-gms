//neural net struct
Net = function(_isRecurrent = false, _layerSizes)constructor {
	
	isRecurrent = _isRecurrent; //"short term" memory
	layerSizes = array_copy(_layerSizes);
	weights = [[[]]];
	threshold = 0.0; //net-wide neutral threshold for now
	
	var outputLayer = numOutputs - 1;
	var numOutputs = layerSizes[array_length(layerSizes) - 1];	
	
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
				weights[layer][neuron][w] = randZeroCentered();
		}
	}
	
	static activate = function (input = []) {
		resetCharges();
		charges[0] = input; //set first layer to incoming input array
		
		//TODO: memory systems can be added to input layer here
		
		//charges propagate forward
		var nextLayer = 1;
		for (var layer = 0; layer < outputLayer; layer++) {
			//each neuron
			for (var neuron = 0; neuron < array_length(charges[layer]); neuron++) {
				//absolute value of charge checked against a standard threshold
				if (layer == 0 || abs(charges[layer][neuron]) > threshold) {
					//each weight
					for (var w = 0; w <  array_length(charges[nextLayer]); w++)
						charges[nextLayer][w] += charges[layer][neuron] * weights[layer][neuron][w];
				}
			}
			//activation function on next layer's neurons after they're all charged up
			for (var neuron = 0; neuron <  array_length(charges[nextLayer]); neuron++) 
				charges[nextLayer][neuron] = zeroCenteredCurve(charges[nextLayer][neuron]);
			nextLayer++;
		}
		
		
	}
	
	static resetCharges = function() {
		for (var layer = 1; layer < array_length(charges); layer++)
			for (var neuron = 0; neuron <  array_length(charges[layer]); neuron++)
				charges[layer][neuron] = 0;
	}
	
	static zeroCenteredCurve = function(x, base = 10) {
		return (2 / (1 + power(base, -x)) - 1);
	}
	
	static randZeroCentered = function(scale=1) {
		return ((random(1) * 2 - 1) * scale);
	}
}



