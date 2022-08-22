//neural net struct
function Net(_isRecurrent = false, isMediumTerm = false, _layerSizes) constructor {
	
	isRecurrent = _isRecurrent; //"short term" memory
	isMediumTerm = _isRecurrent; //"short term" memory
	layerSizes = acopy(_layerSizes);
	weights = [[[]]];
	threshold = 0.0; //net-wide neutral threshold for now
	
	var numOutputs = layerSizes[array_length(layerSizes) - 1];	
	outputLayer = numOutputs - 1;
	
	if (isRecurrent){
		//Inputs receive outputs of previous activation
		layerSizes[0] += numOutputs;
		shortMemory = afill(array_create(numOutputs), 0);
	}
	//Medium-term Memory
	if (isMediumTerm){
		layerSizes[0] += numOutputs;
		mediumMemory =  afill(array_create(numOutputs), 0);
	}
	
	//TODO: Long-term memory will dynamic random access memory,
	//      implemented with n-dimensional arrays
	
	charges = array_create(array_length(layerSizes));
	for (var lay = 0; lay < array_length(layerSizes); lay++)
	{
		charges[lay] = array_create(layerSizes[lay]);
		for (var neuron = 0; neuron < layerSizes[lay]; neuron++)
			charges[lay][neuron] = 0;
	}
	
	//fully interconnected random weights 
	weights = array_create(array_length(layerSizes) - 1);
	for (var lay = 0; lay < array_length(weights); lay++)
	{
		//initialize all weights to random values
		weights[lay] = array_create(layerSizes[lay]);
		for (var neuron = 0; neuron < layerSizes[lay]; neuron++)
		{
			//connections to previous layer
			weights[lay][neuron] = array_create(layerSizes[lay + 1])
			for (var w = 0; w < layerSizes[lay + 1]; w++)
				weights[lay][neuron][w] = randZeroCentered();
		}
	}
	
	static activate = function (input = []) {
		resetCharges();
		charges[0] = input; //set first layer to incoming input array
		
		//each memory system fed into network here
		if (isRecurrent)
			aconcat(charges[0], shortMemory);
	//	if (isMediumMemory)
	//		aconcat(charges[0], mediumMemory);
		
		//charges propagate forward
		var nextLayer = 1;
		for (var lay = 0; lay < outputLayer; lay++) {
			//each neuron
			for (var neuron = 0; neuron < array_length(charges[lay]); neuron++) {
				//absolute value of charge checked against a standard threshold
				if (lay == 0 || abs(charges[lay][neuron]) > threshold) {
					//each weight
					for (var w = 0; w <  array_length(charges[nextLayer]); w++)
						charges[nextLayer][w] += charges[lay][neuron] * weights[lay][neuron][w];
				}
			}
			//activation function on next layer's neurons after they're all charged up
			for (var neuron = 0; neuron <  array_length(charges[nextLayer]); neuron++) 
				charges[nextLayer][neuron] = zeroCenteredCurve(charges[nextLayer][neuron]);
			nextLayer++;
		}
		
		//width of final output layer
		var numOutputs = array_length(charges[outputLayer]);

		//squish outputs with sigmoid
		for (var neuron = 0; neuron < numOutputs; neuron++)
			charges[outputLayer][neuron] = zeroCenteredCurve(charges[outputLayer][neuron]);

		//short-term recurrent memory saved here
		if (isRecurrent)
			shortMemory = acopy(charges[outputLayer]);
		
	}
	
	static resetCharges = function() {
		for (var lay = 1; lay < array_length(charges); lay++)
			for (var neuron = 0; neuron <  array_length(charges[lay]); neuron++)
				charges[lay][neuron] = 0;
	}
	
	static zeroCenteredCurve = function(x, base = 10) {
		return (2 / (1 + power(base, -x)) - 1);
	}
	
	static randZeroCentered = function(scale=1) {
		return ((random(1) * 2 - 1) * scale);
	}
}



