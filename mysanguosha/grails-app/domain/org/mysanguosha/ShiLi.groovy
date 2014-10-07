package org.mysanguosha

class ShiLi {
	String name
	String code
    static constraints = {
		name unique:true
		code unique:true
    }
}
