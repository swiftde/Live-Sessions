import UIKit

class Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 18)
    }
    
    convenience init() {
        self.init(name: "Max Mustermann")
    }
}

class Student: Person {
    var studentID = 0
}

let student = Student(name: "Thomas", age: 20)
student.age
student.name
let person = student as Person
person.name
person.age