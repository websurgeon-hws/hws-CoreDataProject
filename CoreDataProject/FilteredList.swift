//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    enum FilterPredicate: String {
        case beginsWith = "BEGINSWITH"
    }
    
    var fetchRequest: FetchRequest<T>
    let content: (T) -> Content
    var results: FetchedResults<T> { fetchRequest.wrappedValue }
    
    var body: some View {
        List(results, id: \.self) {
            self.content($0)
        }
    }
    
    init(filterKey: String,
         filterValue: String,
         predicate: FilterPredicate,
         sortDescriptors: [NSSortDescriptor],
         @ViewBuilder content: @escaping (T) -> Content) {
           fetchRequest = FetchRequest<T>(
               entity: T.entity(),
               sortDescriptors: sortDescriptors,
               predicate: NSPredicate(format:  "%K \(predicate.rawValue) %@",
                                      filterKey,
                                      filterValue))
        self.content = content
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filterKey: "lastName",
                     filterValue: "A",
                     predicate: .beginsWith,
                     sortDescriptors: []) { (singer: Singer) in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}
