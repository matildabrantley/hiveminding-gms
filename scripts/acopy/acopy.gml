//array copy
function acopy(a2){
	a1 = [];
	array_copy(a1, 0, a2, 0, array_length(a2));
	return a1;
}