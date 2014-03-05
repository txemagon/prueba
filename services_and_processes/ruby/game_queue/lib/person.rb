#person.rb

require_relative "sprite"

class Person < Sprite


	def initialize
		super
	end

	#One jump consist in counting from 100000 down to 0
	#Decrease counter one step in each call
	#When counter reaches 0 reset it to 100000 on next run.
	#Un salto consiste en contar de 0 hasta 0
	#Si el contador @lifetime esta a 0 póngase a 100000
	#Decrementar el contador en 1 en cada llamada
	def start
		@lifetime  = 10000 unless @lifetime > 0		
		self
    end
	
end