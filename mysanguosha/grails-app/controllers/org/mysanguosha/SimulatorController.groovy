package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class SimulatorController {
	def simulatorService
    def index() { 
		def results=simulatorService.calculate()
		render(template: "results",bean:results)
	}
}
