package org.mysanguosha

import grails.plugin.springsecurity.annotation.Secured

@Secured("ROLE_USER")
class RecommendController {
	def recommendService
    def index() { 
		def results=recommendService.calculate()
		render(template: "results",bean:results)
	}
}
