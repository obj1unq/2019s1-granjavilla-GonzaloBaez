import wollok.game.*
import hector.*

class Trigo{
	var property posicionX
	var property posicionY
	var property etapa = 0
	
	method image() = "wheat_" + etapa + ".png"
	method position() = game.at(posicionX,posicionY)
	method regar(){
		self.avanzarEtapa()
	}
	method avanzarEtapa(){
		if (etapa < 3){
			etapa += 1
		} else {
			etapa = 0
		}
	}
}
class Maiz{
	var property posicionX
	var property posicionY
	var property imagen = "corn_baby.png"
	
	method image() = imagen
	method position() = game.at(posicionX,posicionY)
	method regar(){
		if (self.esBebe()){
			self.volverseAdulta()
		}
	}
	method esBebe(){
		return self.image() == "corn_baby.png"
	}
	
	method volverseAdulta(){
		self.imagen("corn_adult.png")
	}
}

class Tomaco{
	var property posicionX
	var property posicionY
	
	method image() = "tomaco.png"
	method position() = game.at(posicionX,posicionY)
	method regar(){
		if ( self.noEstaEnElBorde() && self.noHayPlantaArriba()){
			game.removeVisual(self)
			self.posicionY(posicionY + 1)
			game.addVisual(self)
		}
	}
	method noHayPlantaArriba(){
		return  (game.getObjectsIn(game.at(self.posicionX(),self.posicionY()+1)).isEmpty())
	}
	method noEstaEnElBorde(){
		return posicionY < (game.height()-1)
	}
}