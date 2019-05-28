import wollok.game.*
import hector.*

class Trigo{
	var property posicionX
	var property posicionY
	var property etapa = 0
	
	method image() = "wheat_" + etapa + ".png"
	method position() = game.at(posicionX,posicionY)
}
class Maiz{
	var property posicionX
	var property posicionY
	
	method image() = "corn_baby.png"
	method position() = game.at(posicionX,posicionY)
}

class Tomaco{
	var property posicionX
	var property posicionY
	
	method image() = "tomaco.png"
	method position() = game.at(posicionX,posicionY)
}