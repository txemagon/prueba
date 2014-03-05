# sprite.rb 

class Sprite

    @@id = 0
    	
	def initialize
		@lifetime = 0
		@@id += 1
		@id = @@id
	end

	def run
		@lifetime -= 1 if @lifetime > 0  
		$stderr.puts "#{self.class.name} #{@id} at #{@lifetime}"
	end

    def start
    	raise "Please override this method returning self."
    end

    # returns true when @lifetime equal 0
    # devuelve true cuando @lifetime vale 0
	def is_off?
		@lifetime == 0
	end
end