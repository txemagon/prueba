#game_cube.rb

class GameQueue < Array
# Prevent add and/or process from being concurrently accessed.
# Impide que los métodos add y/o process sean accedidos simultaneamente.

    def initialize
    	#Call to Array constructor
    	#LLamada al constructor de la superclase.
    	super
    	@un_poquito_de_por_favor = Mutex.new
    end

	def add(sprite)
		@un_poquito_de_por_favor.synchronize do
		# No more than one Person executing at th same time.
		self << sprite.start
		end
	end

    # Execute the _run_ method for every element in the Array (use Array#each)
    # simultaneously.
	# Llama al método _run_ de cada elemento del array (usa Array#each) 
	# simultáneamente.
	def process
		@un_poquito_de_por_favor.synchronize do
			threads = []
	        each do |x| 
	        	threads << Thread.new { 
	        		x.run 
	        		delete(x) if x.is_off?
	        	} 
	        end
	        # wait until every single thread has already finished
	        # espera a que todos los hilos hayan terminado para devolver el control
	        threads.each { |t| t.join }
        end
	end
	
end