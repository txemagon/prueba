EXAMEN
======

linux C
-------

Crea un programa con un catálogo de utilidades y programas
que los arranque en un proceso distinto hasta que se elija
la opción salir.

Después de elegir el programa se preguntará por los
argumentos en linea de comandos.

Ruby
-----

Dentro del lazo de control de juego es obligatorio mover a
todos los personajes, así como mover las balas u otros objetos
arrojadizos, animar explosiones, etc.

Para ello vamos a crear un ejecutable _game.rb_ que corre 
un menu en un hilo y un lazo de contro en otro.

Existe una clase _GameQueue_ que deriva de _Array_
y otras dos _Shot_ y _Person_ que derivan de _Sprite_

Rellena, por favor, los métodos marcados con la palabra
RELLENA siguiendo las instrucciones que hay en la comentarios. 

```ruby
#!/usr/bin/env ruby
# game.rb

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

game_loop = ... #RELLENA
# Crea un hilo nuevo que llame a queue.process mientras
# el hilo del menu esté activo. Cuando no haya elementos
# el queue pon el hilo a dormir 2 segundos.















menu.join
game_loop.join

```

Un Sprite básicamente es un contador que se decrementa hasta
llegar a 0. No hay nada que rellenar en esta clase ni en sus derivadas.

```ruby
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
```

```ruby
#person.rb

require_relative "sprite"

class Person < Sprite

	def initialize
		super
	end

	# One jump consist in counting from 10000 down to 0
	# Un salto consiste en contar hasta 0
	def start
		@lifetime  = 10000 unless @lifetime > 0		
		self
    end
	
end

```

```ruby
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
	
end
```

```ruby
class GameQueue < Array

    def initialize
    	#Call to Array constructor
    	#LLamada al constructor de la superclase.
    	super
    	# Prevent add and/or process from being concurrently accessed.
        # Impide que los métodos add y/o process sean accedidos simultaneamente.
        # RELLENA




    end

	def add(sprite)
        # RELLENA
        # Arranca el Sprite y añadelo a la matriz
		# No permitas que haya dos saltos simultáneos.








	end

    # Execute the _run_ method for every element in the Array (use Array#each)
    # simultaneously.
	# Llama al método _run_ de cada elemento del array (usa Array#each) 
	# simultáneamente.
	# Extrae el Sprite si ha terminado la cuenta (usa delete e is_off?)
	def process
	   #RELLENA






















	end
	
end
```

###Notas
 _Array#include?_ devuelve verdadero si el objeto que se pasa
 como parámetro ya está incluido en el array.

 objeto.class == Person es una expresión válida porque en ruby
 todo es un objeto (includidas las clases).

 Array#delete(obj) extrae (borra) obj del array si se encuentra 
 presente.

 Array#empty? devuelve true cuando no hay elementos en el array

