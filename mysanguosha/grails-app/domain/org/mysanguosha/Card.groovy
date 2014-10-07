package org.mysanguosha

class Card {
	String huaSe
	short dianShu
	CardType cardType
	String memory

    static constraints = {
		dianShu min:(short)1,max:(short)13
		memory nullable:true
    }
}
