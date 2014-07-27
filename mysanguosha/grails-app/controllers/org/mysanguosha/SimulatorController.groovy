package org.mysanguosha

class SimulatorController {
	def simulatorService
    def index() { 
		render simulatorService.calculate()
	}
}
