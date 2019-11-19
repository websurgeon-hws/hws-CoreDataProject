//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    // added as a safe way to use optional property
    public var wrappedTitle: String {
        return title ?? "Unknown Title"
    }
}

