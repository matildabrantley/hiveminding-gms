//calculate average position and speed of colony
var totalX = 0;
var totalY = 0;
var totalHSpeed = 0;
var totalYSpeed = 0;

for (var i = 0; i < pop; i++){
	totalX += colony[i].x; 
	totalY += colony[i].y; 
	totalHSpeed = colony[i].hspeed;
    totalYSpeed = colony[i].vspeed;
}

x = totalX / pop;
y = totalY / pop;
hspeed = totalHSpeed / pop;
vspeed = totalYSpeed / pop;