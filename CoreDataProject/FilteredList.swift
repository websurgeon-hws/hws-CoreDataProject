//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct FilteredList: View {
    var fetchRequest: FetchRequest<Singer>

    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }

    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(
            entity: Singer.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "lastName BEGINSWITH %@",
                                   filter))
    }
    
    var body: some View {
        List(singers, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList(filter: "A")
    }
}
