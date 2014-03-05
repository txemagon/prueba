EXAMEN
======

linux C
-------

La semana pasada leía en los temas calientes de stack overflow que la impresión de la letra 'B' era mucho más lenta que la de el carácter '#' en java.

http://stackoverflow.com/questions/21947452/why-is-printing-b-dramatically-slower-than-printing

Como la comprobación de esto es inmediata, he pensado crear un programa en c que lance dos hilos, cada uno de los cuales imprimirá 10.000 veces uno de los dos caracteres y ver qué hilo termina primero. ¿Puedes hacer tú lo mismo?

Ruby
----

###Hilos

Si me invento el método Array#for_each que ejecuta un bloque (yield) para cada elemento del array.

```ruby
class Array

	def for_each
		each {|element| yield element}
	end

end

[1,2,3].for_each { |element| puts "#{ element * element }"}
#=> 1
#=> 4
#=> 9
```
Escribe el método Array#each_simultaneously que ejecuta un bloque para cada elemento del array simultaneamente (en un hilo distinto). El método no devuelve el control hasta que no han terminado todos los hilos.

###Semáforos

Si tenemos la clase Persona,

```ruby
class Persona

	def intialize(name)
		@name = name
	end

	def saluda
		puts "Hola. Soy #{@name}."
	end

end
```

Introduce un semáforo que sincronice las llamadas a Persona#saluda.