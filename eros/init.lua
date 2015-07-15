io.stdout:setvbuf("no")

require 'eros.functions'
require "eros.class"
require 'eros.keys'

VERSION = "0.0.1"

game = {}
objects = {}

-- Game functions
function game.start() end
function game.step() end
function game.draw() end
-- Constants
cr_none = "cr_none"


print("[+] Eros v" .. VERSION)

function love.load()
    game.start()
    -- Create event of objects
    for i = 1, #objects do
      objects[i].create()
    end
end

function love.update( dt )
    mouse_x, mouse_y = love.mouse.getPosition( )
    game.step()
    if keyboard_check(vk_escape) then
        game_end()
    end
    --ACTIVATING TRANSITION
    perform_transition()
end

function love.draw()
  room_draw()
  if room.instances then
    for j = 1, #room.instances do
      room.instances[j]:draw()
    end
  end
  game.draw()
  draw_transition()
end
