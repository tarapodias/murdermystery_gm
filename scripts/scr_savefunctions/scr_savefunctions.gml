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
		with(instance_create_layer(_roomStruct.talkingObjData[i].x, _roomStruct.talkingObjData[i].y, "Instances", _roomStruct.talkingObjData[i].objInd))
		{
			updatetext = _roomStruct.talkingObjData[i].updatetext;
	
		
		}
	}
	
	
}

//overall saving of the game
function save_game(_fileNum = 0) {
	//obj_ingamemenu.alarm[_fileNum] = 1;
	
	var _saveArray = array_create(0);
	
	//save the room youre in
	save_room();
	
	//set and save stat values
	global.statData.save_x = obj_player.x;
	global.statData.save_y = obj_player.y;
	global.statData.save_rm = room_get_name(room);
	global.statData.playtime = obj_playtime.time_;
	
	global.myplaytime[_fileNum] = global.statData.playtime;
	
	array_push(_saveArray, global.statData);
	
	//save all the room data
	array_push(_saveArray, global.levelData);
	
	//saving to file
	var _filename = "savedata" + string(_fileNum) + ".save";
	var _json = json_stringify(_saveArray);
	var _buffer = buffer_create(string_byte_length(_json) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _json);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	
}

function load_game(_fileNum = 0) {
	
	//loading our save data
	var _filename = "savedata" + string(_fileNum) + ".save";
	if !(file_exists(_filename))
	{
		exit;
	}
	
	//load the buffer, get the json file, then delete the buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//unstringify the data to get the array
	var _loadArray = json_parse(_json);
	
	//set the data in our game to match the loaded data
	global.statData = array_get(_loadArray, 0);
	global.levelData = array_get(_loadArray, 1);

	var thetime = global.statData.playtime;
	obj_playtime.time_ = 0;
	obj_playtime.time_ += thetime;
	//var myplaytime = global.statData.playtime;
	//myTime(myplaytime);
	
	
	//use the new data to recreate the conditions from the save file
		//go to the correct room
		var _loadRoom = asset_get_index(global.statData.save_rm);
		room_goto(_loadRoom);
		
			//make sure obj_saveload doesn't save the room we're exiting
			obj_saveload.skipRoomSave = true;
		
		//create the player in the correct location/with correct stats
		if instance_exists(obj_player) {instance_destroy(obj_player);};
		instance_create_layer(global.statData.save_x, global.statData.save_y, "Instances", obj_player);
	
		//manually load the room
		load_room();
}

function load_time(_fileNum = 0) {
	
	//loading our save data
	var _filename = "savedata" + string(_fileNum) + ".save";
	if !(file_exists(_filename))
	{
		exit;
	}
	
	//load the buffer, get the json file, then delete the buffer
	var _buffer = buffer_load(_filename);
	var _json = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	//unstringify the data to get the array
	var _loadArray = json_parse(_json);
	
	//set the data in our game to match the loaded data
	global.statData = array_get(_loadArray, 0);
	global.levelData = array_get(_loadArray, 1);

	global.myplaytime[_fileNum] = global.statData.playtime;
	
	//obj_titlemenu.savetime[_fileNum] = global.showpt;
	
}

function myTime(thistime) {
	
	
	var s = thistime/1000000;
	var m = s/60;
	var h = m/60;
	var ih = round(h);
	var rm = 0;

	if (m >= 60) && (h>0)	
	{
		rm = m % (ih*60);
	} else 
	{
		rm = m;
	}

	var currtime = string(ih) + ":" + string_format(rm, 1, 0) + string_format(s, 1, 0);
	return currtime;
	
}

