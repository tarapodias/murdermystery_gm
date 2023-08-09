function save_room() {
	
	//find the number of interactible objects we want to save
	var _talkingObjNum = instance_number(obj_interactiveparent);
	
	var _roomStruct = 
	{
		talkingObjNum : _talkingObjNum,
		talkingObjData : array_create(_talkingObjNum),
	
	}
	
	//get data from the objects we want to save
	
		//objects with dialogue
		for (var i = 0; i < _talkingObjNum; i++)
		{
			var _inst = instance_find(obj_interactiveparent, i);
			
			_roomStruct.talkingObjData[i] = 
			{
				x : _inst.x,
				y : _inst.y,
				objInd : _inst.object_index,
				updatetext : _inst.updatetext,
				
			}
		
		}
	
	//store the rooms specifc struct in global.levelData's variable for its corresponding room
	if (room == rm_pros1) {	global.levelData.pro_s1 = _roomStruct;};
	if (room == rm_pros2) {	global.levelData.pro_s2 = _roomStruct;};
	
}

function load_room() {
	
	var _roomStruct = 0;
	
	//get correct struct for the room you're in
	if (room == rm_pros1) {_roomStruct = global.levelData.pro_s1;};
	if (room == rm_pros2) {_roomStruct = global.levelData.pro_s2;};
	
	//EXIT if _roomStruct isn't a struct
	if !(is_struct(_roomStruct)) {exit;};
	
	//get rid of default objects and spawn new ones with the loaded variables from our save
	if instance_exists(obj_interactiveparent) {instance_destroy(obj_interactiveparent);};
	for (var i = 0; i < _roomStruct.talkingObjNum; i++)
	{
		with(instance_create_depth(_roomStruct.talkingObjData[i].x, _roomStruct.talkingObjData[i].y, -10, _roomStruct.talkingObjData[i].objInd))
		{
			updatetext = _roomStruct.talkingObjData[i].updatetext;
		
		
		}
	}
	
	
}