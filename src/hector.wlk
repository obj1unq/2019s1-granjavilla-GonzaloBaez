import wollok.game.*
import plantas.*

object hector {
	var property posicionXHector = 0
	var property posicionYHector = 0
	
	method image() = "player.png"
	method position() = game.at(posicionXHector,posicionYHector)
	
	method moverEnX(direccion){
		posicionXHector += direccion
	}
		method moverEnY(direccion){
		posicionYHector += direccion
	}
	
	method plantarMaiz(){
		self.validarQueHayAlgoPlantado()
		game.addVisual(new Maiz(posicionX = posicionXHector,posicionY = posicionYHector))
		
	} 
	method plantarTrigo(){
		self.validarQueHayAlgoPlantado()
		game.addVisual(new Trigo(posicionX = posicionXHector,posicionY = posicionYHector))
	}
	
	method plantarTomaco(){
		self.validarQueHayAlgoPlantado()
		game.addVisual(new Tomaco(posicionX = posicionXHector,posicionY = posicionYHector))
	}
	method hayAlgoPlantado(){
		return not (game.getObjectsIn(game.at(posicionXHector,posicionYHector)) == [self])
	}
	method validarQueHayAlgoPlantado(){
		if (self.hayAlgoPlantado()){
			throw new UserException ("ya hay algo plantado")
		}
	}
}


class UserException inherits Exception { }