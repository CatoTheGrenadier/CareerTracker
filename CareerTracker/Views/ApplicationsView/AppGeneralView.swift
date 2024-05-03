//
//  AppGeneralView.swift
//  CareerTracker
//
//  Created by Yi Ling on 5/2/24.
//

import Foundation
import SwiftUI

struct AppGeneralView: View {
    @ObservedObject var appStateVM : AppStateViewModel
    @ObservedObject var profileRep : ProfileRepository
    @State var isSheetPresented = false
    
    var body: some View {
        VStack{
            List{
                ForEach(Array(profileRep.profile.userApplications.applicationsList.enumerated()), id: \.1.id){ (idx, item) in
                    NavigationLink{
                        ApplicationItemDetailView(appStateVM: appStateVM, profileRep: profileRep,applicationItem:item)
                    } label: {
                        HStack{
                            Text("\(idx + 1).")
                                .alignmentGuide(.leading) { _ in 0 }
                            Text("\(item.companyName)")
                                .alignmentGuide(.leading) { _ in 0 }
                            Text("\(item.roleName)")
                                .alignmentGuide(.leading) { _ in 0 }
                        }
                    }
                }
            }
            .listStyle(.plain)
            Spacer()
            Button {
                isSheetPresented = true
            } label: {
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Add New Application")
                }
                .padding()
            }
            .sheet(isPresented: $isSheetPresented) {
                NavigationStack {
                    var newApplication = ApplicationItem()
                    ApplicationItemDetailView(appStateVM: appStateVM, profileRep: profileRep,applicationItem:newApplication)
                        .onDisappear{
                            profileRep.profile.userApplications.applicationsList.append(newApplication)
                            profileRep.updateProfile()
                        }
                }
            }
        }
    }
}
