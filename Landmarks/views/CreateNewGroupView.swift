//
//  CreateNewGroupView.swift
//  Landmarks
//
//  Created by awave on 2019-10-13.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct CreateNewGroupView: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var userData: UserData
    @State var groupName: String = ""

    var body: some View {
        List {
            HStack {
                Text("Group Name").bold()
                Divider()
                TextField("Group Name", text: $groupName)
            }

            ForEach(userData.landmarks) { landmark in
                MultipleSelectionRow(landmark: landmark)
            }

            Button(action: { self.onCreateNewGroup() }) {
                HStack {
                    Spacer()
                    Text("Done")
                        .foregroundColor(.blue)
                        .bold()
                    Spacer()
                }
            }
        }.padding()
    }

    func onCreateNewGroup() {
        if !groupName.isEmpty && !self.userData.selectedLandmarks.isEmpty {
            let id = self.userData.groups.last != nil ? self.userData.groups.last!.id + 1 : 0
            self.userData.groups.append(
                Group(
                    id: id,
                    name: groupName,
                    landmarks: self.userData.selectedLandmarks
                )
            )

            self.userData.selectedLandmarks.removeAll()
            self.presentation.wrappedValue.dismiss()
        }
    }
}

struct CreateNewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNewGroupView()
    }
}
