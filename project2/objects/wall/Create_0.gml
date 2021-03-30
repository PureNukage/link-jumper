surface = surface_create(sprite_get_width(sprite_index)*image_xscale, sprite_get_height(sprite_index)*image_yscale)
surface_set_target(surface)
draw_clear_alpha(c_black, 0)

surface_reset_target()

var tempSurface = surface_create(room_width, room_height)
surface_set_target(tempSurface)
draw_clear_alpha(c_black, 0)

var tilemapID = layer_tilemap_get_id("Tiles_2")
draw_tilemap(tilemapID, 0,0)

surface_reset_target()

surface_copy_part(surface,0,0, tempSurface,x,y,sprite_get_width(sprite_index)*image_xscale,sprite_get_height(sprite_index)*image_yscale)

sprite = sprite_create_from_surface(surface,0,0,sprite_get_width(sprite_index)*image_xscale,sprite_get_height(sprite_index)*image_yscale,false,false,0,0)

surface_free(tempSurface)
surface_free(surface)