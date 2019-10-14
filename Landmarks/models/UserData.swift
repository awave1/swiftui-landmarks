//
//  UserData.swift
//  Landmarks
//
//  Created by awave on 2019-10-12.
//  Copyright © 2019 awave. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var groups = groupData
    @Published var selectedLandmarks: [Landmark] = []
}
