package org.mysanguosha

class SimulatorController {
	def simulatorService
    def index() { 
		def results=simulatorService.calculate()
		render(template: "results",bean:results)
	}
}
