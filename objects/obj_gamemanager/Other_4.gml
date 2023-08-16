layer_set_visible("Collision", false);
global.col_layer = layer_get_id("Collision");
global.collisionMap = layer_tilemap_get_id(global.col_layer);
global.gamePaused = false;