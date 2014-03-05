#!/usr/bin/env ruby
# game.rb
# Ejecutar como: ./game.rb 2> output

require_relative "lib/game_queue"
require_relative "lib/person"
require_relative "lib/shot"

#Ya existe la utilidad Queue en ruby.
#No obstante se pide redefinirla
queue = GameQueue.new
mandy = Person.new
active_menu = true


menu = Thread.new do 
    begin
		system("clear")
	puts <<-OPTIONS 
   Options:

      1.- Shot
      2.- Jump
      3.- Exit

   Your option: 
OPTIONS
		case (option = gets.strip)
		when "1"
			queue.add(Shot.new)
		when "2"
			queue.add(mandy)
		end
	end while option != "3"
	active_menu = false 
end

game_loop = Thread.new do
   while active_menu or !queue.empty?
   	unless queue.empty?
   	   queue.process
   	else
   		sleep 2
   	end
   end
end

menu.join
game_loop.join
