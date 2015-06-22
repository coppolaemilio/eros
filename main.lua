require 'eros'

-- Sprites
spr_phantom = create_sprite("sprites/spr_phantom_walk_12_55_88.png", 12, 55, 88)
spr_vs = create_sprite("sprites/spr_vsmedio.png", 2, 50, 50)

-- Fonts
font = create_font("fonts/font.ttf", 100)

-- Objects
phantom = create_object()
phantom.sprite_index = spr_phantom
phantom.image_speed = 0.1
phantom.speed = 3

obj_test = create_object()
obj_test.sprite_index = spr_vs
obj_test.image_speed = 0.1

-- Rooms
room_a = {
  background_color = {100, 100, 100},
  instances = {
    instance_create(100, 20, phantom),
    instance_create(120, 20, obj_test),
    instance_create(150, 20, obj_test)
  }
}
room_b = {
  background_color = {200, 100, 100},
  instances = {
    instance_create(60, 60, phantom),
    instance_create(120, 120, obj_test)
  }
}

room = room_b

function game.step()
  speed = 2
  if keyboard_check_pressed("r") then
    if room == room_a then
      room = room_b
    else
      room = room_a
    end
  end
  if keyboard_check("f") then
    window_set_fullscreen(true)
  end
end

function game.draw()
  draw_set_font(font)
  draw_text(100, 200, "エミリオ")
end
