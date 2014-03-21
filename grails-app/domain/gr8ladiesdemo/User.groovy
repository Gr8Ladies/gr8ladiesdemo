package gr8ladiesdemo

class User {

    String firstName
    String lastName
    String gender

    static belongsTo = [chapter: Chapter]

    static constraints = {
        firstName(minSize: 2,
                 nullable: true)
    }
}
