//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    let students = [
        Student(name: "Harry Potter"),
        Student(name: "Hermione Granger")
    ]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
