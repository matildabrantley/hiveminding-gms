/// @description Insert description here
// You can write your code in this editor
pop = 3000;
colony = [];

for (var i = 0; i < pop; i++){
	colony[i] = instance_create_layer(200 + random(50), 200, "Instances_1", Agent);
	var size = random(100) + 5;
	colony[i].image_xscale = 0.1 + 1 / size;
	colony[i].image_yscale = 0.1 + 1 / size;
}

