var swarmX = random(0.4) - 0.2;
var swarmY = random(1) - 0.5;
for (var i = 0; i < pop; i++){
	colony[i].hspeed += swarmX + random(0.2) - 0.1;
	colony[i].vspeed += swarmY + random(0.2) - 0.1;
	
	colony[i].hspeed += (hspeed - colony[i].hspeed) / (random(200) + 1);
	colony[i].vspeed += (vspeed - colony[i].vspeed) / (random(200) + 1);
}




