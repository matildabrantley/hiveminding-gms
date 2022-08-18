/// @description Insert description here
// You can write your code in this editor
pop = 10;
colony = [];
//used to calculate average center of colony
var colTotX = 0;
var colTotY = 0;
for (var i = 0; i < pop; i++){
	colony[i] = instance_create_layer(200 + random(50), 200, "Instances_1", Agent);
	colony[i].image_xscale = 0.1;
	colony[i].image_yscale = 0.1;
	colTotX += colony[i].x; 
	colTotY += colony[i].y; 
}

x = colTotX / pop;
y = colTotY / pop;


