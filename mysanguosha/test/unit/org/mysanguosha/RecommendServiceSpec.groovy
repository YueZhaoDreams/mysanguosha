package org.mysanguosha

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(RecommendService)
class RecommendServiceSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "winningPercentage is less than 1"() {
		when:
		def results= service.calculate()
		
		then:
		results.winningPercentage<=1d
    }
}
