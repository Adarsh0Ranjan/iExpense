//
//  ContentView.swift
//  project-7
//
//  Created by Roro Solutions on 25/07/22.
//

import SwiftUI

//struct User: Codable {
//    let firstName: String
//    let lastName: String
//}
//
//struct ContentView: View {
//    @State private var user = User(firstName: "Taylor", lastName: "Swift")
//
//    var body: some View {
//        Button("Save User") {
//            let encoder = JSONEncoder()
//
//            if let data = try? encoder.encode(user) {
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
//    }
//}
//lecturee 6 -- archiving dta cia button
/*
 import SwiftUI

 struct User: Codable {
     let firstName: String
     let lastName: String
 }

 struct ContentView: View {
     @State private var user = User(firstName: "Taylor", lastName: "Swift")

     var body: some View {
         Button("Save User") {
             let encoder = JSONEncoder()

             if let data = try? encoder.encode(user) {
                 UserDefaults.standard.set(data, forKey: "UserData")
             }
         }
     }
 }
 */
//lecture - 5
//struct ContentView: View {
//
////@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap") //Speaking of reading the data back, rather than start with tapCount set to 0 we should instead make it read the value back from UserDefaults like this:
////
////    var body: some View {
////        Button("Tap count: \(tapCount)") {
////            tapCount += 1
////            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
////        }
////    }//f you tap the button then quickly relaunch the app from Xcode, you’ll find your most recent tap count wasn’t saved. There used to be a way of forcing updates to be written immediately, but at this point it’s worthless – even if the user immediately started the process of terminating your app after making a choice, your defaults data would be written immediately so nothing will be lost.
//
//
////}
//    // I mentioned that SwiftUI provides an @AppStorage property wrapper around UserDefaults, and in simple situations like this one it’s really helpful. What it does is let us effectively ignore UserDefaults entirely, and just use @AppStorage rather than @State, like this:
//    @AppStorage("tapCount") private var tapCount = 0
//
//    var body: some View {
//        Button("Tap count: \(tapCount)") {
//            tapCount += 1
//        }
//    }
//}
 

// lecturee -4
//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationView{
//            VStack {
//                List {
//                    ForEach(numbers, id: \.self) { // you can also use form here for iterating through array but on that case "ondelete" will not work thts why we are using for each loop
//                        Text("Row \($0)")
//                    }
//                    .onDelete(perform: removeRows)
//                }
//
//                Button("Add Number") {
//                    numbers.append(currentNumber)
//                    currentNumber += 1
//                }
//            }
//            .toolbar {
//                EditButton()
//            }
//        }
//
//
//    }
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}
 

//lecturee-3 showing and hidnng another view suing sheet

// struct SecondView: View{
// //    var body: some View{
// //        Text("second view");
// //    }
//     @Environment(\.dismiss) var dismiss
//     let name: String
//     var body: some View {
//         Text("Hello, \(name)!")
//         Button("Dismiss") {
//             dismiss()
//         }
//     }
//
// }
// struct ContentView: View {
//
//     @State private var showingSheet = false
//     var body: some View {
//         Button("Show Sheet") {
//                     // show the sheet
//             showingSheet.toggle()
//                 }
// //        .sheet(isPresented: $showingSheet){
// //            SecondView()
// //        }
//         .sheet(isPresented: $showingSheet) {
//             SecondView(name: "@twostraws")
//         }
//     }
// }
 

/*
//Lecture-2
// by making class ObservableObject, class propeerty @Publisehed and making object @StateObject insteed of @Statte itt will work
class User : ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @StateObject private var user = User()

    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")

            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}
 */

//lecture-1

/* value of @State private var user also changing with change in tteext fieeld via ui bcz user is made from "User()" which is a struct. In case of struct whenever we aree changing any propeeerties which has @sttatte behind it resets eeverything inisidee struct veery fast but wheeb user is made from "User()" class the valuee of @private var user will not changee via UI. you can see below after commeneting struct

//struct User {
//    var firstName = "Bilbo"
//    var lastName = "Baggins"
//}

class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}



struct ContentView: View {
    @State private var user = User()

        var body: some View {
            VStack {
                Text("Your name is \(user.firstName) \(user.lastName).")

                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
        }
}
 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
