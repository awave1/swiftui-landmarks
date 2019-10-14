//
//  GroupsPage.swift
//  Landmarks
//
//  Created by awave on 2019-10-12.
//  Copyright © 2019 awave. All rights reserved.
//

import SwiftUI

struct GroupsPage: View {
    @EnvironmentObject var userData: UserData
    @State var showingActionSheet: Bool = false

    var body: some View {
        NavigationView {
            List {
                Button(action: { self.showingActionSheet.toggle() }) {
                    HStack {
                        Text("Create New Group")
                            .bold()
                        Spacer()
                        Image(systemName: "plus")
                    }
                }.foregroundColor(.blue)
                ForEach(userData.groups) { group in
                    NavigationLink(destination: GroupList(group: group)) {
                        GroupRow(group: group)
                    }
                }.onDelete(perform: { self.userData.groups.remove(atOffsets: $0)})
            }.sheet(isPresented: $showingActionSheet) {
                CreateNewGroupView().environmentObject(self.userData)
            }
            .navigationBarTitle("Groups")
        }
    }
}

struct GroupsPage_Previews: PreviewProvider {
    static var previews: some View {
        GroupsPage()
    }
}
