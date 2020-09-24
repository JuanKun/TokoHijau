//
//  Filter.swift
//  TokoHijau
//
//  Created by Juansyah - on 17/09/20.
//  Copyright © 2020 Juansyah. All rights reserved.
//

import Foundation

struct Filter {
    let type: String
    let options: [String]
    
    init(type: String, options: [String]) {
        self.type = type
        self.options = options
    }
}

enum FilterType : String{
    case sorting
    case location
    case expedition
    case price
    case offering
    case storeType
    case condition
    case rating
    case color
    case others
    case category
}
