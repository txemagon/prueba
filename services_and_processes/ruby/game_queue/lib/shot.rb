# shot.rb

require_relative "sprite"

class Shot < Sprite

    def initialize
    	super
    end


    def start
		@lifetime = 50000 unless @lifetime > 0
		self
	end

	#One jump consist in counting from 500000 down to 0
	#Decrease counter one step in each call
	#When counter reaches 0 reset it to 500000 on next run.
	#Un salto consiste en contar de 0 hasta 0
	#Si el contador @lifetime esta a 0 póngase a 500000
	#Decrementar el contador en 1 en cada llamada

	
end