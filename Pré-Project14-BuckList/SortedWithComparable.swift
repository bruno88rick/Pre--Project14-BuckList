//
//  SortedWithComparable.swift
//  Pré-Project14-BuckList
//
//  Created by Bruno Oliveira on 24/09/24.
//

import SwiftUI

struct SortedWithComparable: View {
    let users = [
        User(firstName: "Bruno", secondName: "Oliveira"),
        User(firstName: "Joao", secondName: "Silva"),
        User(firstName: "Maria", secondName: "Souza"),
    ]//.sorted() -> this don't work
    ///Swift doesn’t understand what sorted() means here, because it doesn’t know whether to sort by first name, last name, both, or something else.
    ///One way to do this is by providing a closure to sorted() to do the sorting ourselves. We'll be handed two objects from the array, $0 and $1 if you're using shorthand names, and we should return true if the first object should be sorted before the second, like this:
        //.sorted {
          //  $0.secondName < $1.firstName
        //}
        .sorted()
    /*That absolutely works, but it’s not an ideal solution for two reasons.
     
     First, this is model data, by which I mean that it’s affecting the way we work with the User struct. That struct and its properties are our data model, and in a well-developed application we don’t really want to tell the model how it should behave inside our SwiftUI code. SwiftUI represents our view, i.e. our layout, and if we put model code in there then things get confused.

     Second, what happens if we want to sort User arrays in multiple places? You might copy and paste the closure once or twice, before realizing you’re just creating a problem for yourself: if you end up changing your sorting logic so that you also use firstName if the last name is the same, then you need to search through all your code to make sure all the closures get updated.*/
    
    /*Swift has a better solution. Arrays of integers get a simple sorted() method with no parameters because Swift understands how to compare two integers. In coding terms, Int conforms to the Comparable protocol, which means it defines a function that takes two integers and returns true if the first should be sorted before the second.
     
     We can make our own types conform to Comparable, and when we do so we also get a sorted() method with no parameters. This takes two steps:

     Add the Comparable conformance to the definition of User.
     Add a method called < that takes two users and returns true if the first should be sorted before the second.*/
    
    var body: some View {
        List(users) { user in
            Text("\(user.secondName), \(user.firstName)")
        }
    }
}

struct User: Identifiable, Comparable {
    let id = UUID()
    var firstName: String
    var secondName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.secondName < rhs.secondName
    }
    /*First, yes the method is just called <, which is the “less than” operator. It’s the job of the method to decide whether one user is “less than” (in a sorting sense) another, so we’re adding functionality to an existing operator. This is called operator overloading, and it can be both a blessing and a curse.
     
     Second, lhs and rhs are coding conventions short for “left-hand side” and “right-hand side”, and they are used because the < operator has one operand on its left and one on its right.

     Third, this method must return a Boolean, which means we must decide whether one object should be sorted before another. There is no room for “they are the same” here – that’s handled by another protocol called Equatable.

     Fourth, the method must be marked as static, which means it’s called on the User struct directly rather than a single instance of the struct.

     Finally, our logic here is pretty simple: we’re just passing on the comparison to one of our properties, asking Swift to use < for the two last name strings. You can add as much logic as you want, comparing as many properties as needed, but ultimately you need to return true or false.

     Tip: One thing you can’t see in that code is that conforming to Comparable also gives us access to the > operator – greater than. This is the opposite of <, so Swift creates it for us by using < and flipping the Boolean between true and false.

     Now that our User struct conforms to Comparable, we automatically get access to the parameter-less version of sorted(), which means this kind of code works now:
     
     let users = [
         User(firstName: "Arnold", lastName: "Rimmer"),
         User(firstName: "Kristine", lastName: "Kochanski"),
         User(firstName: "David", lastName: "Lister"),
     ].sorted() <- Look on code
     
     */
}

#Preview {
    SortedWithComparable()
}
