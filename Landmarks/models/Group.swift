//
//  Category.swift
//  Landmarks
//
//  Created by awave on 2019-10-13.
//  Copyright © 2019 awave. All rights reserved.
//

import Foundation
import SwiftUI

struct Group: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var landmarks: [Landmark]
}
