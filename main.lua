require 'eros'

-- Sprites
spr_phantom = create_sprite("sprites/spr_phantom_walk_12_55_88.png", 12, 55, 88)
spr_vs = create_sprite("sprites/spr_vsmedio.png", 2, 50, 50)

-- Tile sets
tile_test = create_sprite("sprites/tileset-test.png", 7)

-- Fonts
font = create_font("fonts/font.ttf", 100)

-- Objects
phantom = create_object()
phantom.sprite_index = spr_phantom
phantom.image_speed = 0.1
phantom.speed = 3


-- Rooms
room_a = {
  background_color = {0, 0, 0},
  instances = {
  }
}
room_b = {
  background_color = {200, 100, 100},
  instances = {
    instance_create(60, 60, phantom),
    instance_create(120, 120, obj_test)
  }
}

room = room_a

tile_n = { 0, 0}
function game.step()
  if keyboard_check("r") then
    tile_n[1] = random(6)
    tile_n[2] = random(20)
  end
  if keyboard_check("f") then
    window_set_fullscreen(true)
  end
end

tile_n[1] = random(6)
tile_n[2] = random(20)
function game.draw()
  draw_tile(tile_test,tile_n[1],tile_n[2],0,0,2)
  -- draw_set_font(font)
  -- draw_text(100, 200, "エミリオ")
end
