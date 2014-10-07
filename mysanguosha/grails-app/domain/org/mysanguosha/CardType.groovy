package org.mysanguosha

class CardType {
	String name
	String description

    static constraints = {
		name unique:true
		description nullable:true
    }
}
