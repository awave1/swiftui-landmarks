//
//  MultipleSelectionRow.swift
//  Landmarks
//
//  Created by awave on 2019-10-13.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var landmark: Landmark
    @State var isSelected: Bool = false
    @EnvironmentObject var userData: UserData

    var body: some View {
            HStack {
                landmark.image
                    .resizable()
                    .frame(width: CGFloat(50), height: CGFloat(50))

                Text(self.landmark.name)
                Spacer()
                Image(systemName: self.isSelected ? "checkmark.circle.fill" : "circle")
            }.gesture(TapGesture().onEnded {_ in
                self.isSelected.toggle()

                if self.isSelected {
                    self.userData.selectedLandmarks.append(self.landmark)
                } else {
                    if let toRemove = self.userData.selectedLandmarks.firstIndex(where: { $0.id == self.landmark.id }) {
                        self.userData.selectedLandmarks.remove(at: toRemove)
                    }
                }
            })
    }
}

struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        List {
            MultipleSelectionRow(landmark: landmarkData[0])
        }
    }
}
