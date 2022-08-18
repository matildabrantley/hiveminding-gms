/// @description Insert description here
// You can write your code in this editor
var pop = 10;
colony = [];
for (var i = 0; i < pop; i++){
	colony[i] = instance_create_layer(200 + random(50), 200, "Instances_1", Agent);
	colony[i].image_xscale = 0.1;
	colony[i].image_yscale = 0.1;
}




