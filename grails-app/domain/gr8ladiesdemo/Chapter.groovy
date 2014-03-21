package gr8ladiesdemo

class Chapter {

    String name

    static hasMany = [members: User]

    static constraints = {
    }
}
