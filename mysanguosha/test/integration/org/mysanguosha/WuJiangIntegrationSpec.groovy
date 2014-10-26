package org.mysanguosha



import spock.lang.*

/**
 *
 */
class WuJiangIntegrationSpec extends Specification {
    def "save a wu jiang to database"() {
		given:"a new wu jiang"
		def wuJiang=new WuJiang(name:"Test")
		when:"the wuJiang is saved"
		wuJiang.save()
		then:"it saved successfully and can be found in the database"
		wuJiang.errors.errorCount == 0
		wuJiang.id!=null
		WuJiang.get(wuJiang.id).name==wuJiang.name
    }
}
