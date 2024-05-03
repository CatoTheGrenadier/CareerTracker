//
//  LeetCodeView.swift
//  CareerTracker
//
//  Created by Yi Ling on 5/2/24.
//

import SwiftUI

struct LeetCodeView: View {
    @ObservedObject var appStateVM : AppStateViewModel
    @ObservedObject var profileRep : ProfileRepository
    @ObservedObject var leetCodeData: LeetCodeData
    
    var body: some View {
        List{
            ForEach(Array(leetCodeData.lcData.recentSubmissionList.enumerated()), id: \.1.id){ (idx, item) in
                HStack{
                    Text("\(idx + 1)")
                        .alignmentGuide(.leading) { _ in 0 }
                        .bold()
                    Text("\(item.title)")
                        .alignmentGuide(.leading) { _ in 0 }
                    Spacer()
                    if item.statusDisplay == "Accepted"{
                        Text("\(item.statusDisplay)")
                            .alignmentGuide(.trailing) { _ in 0 }
                            .foregroundColor(.green)
                            .bold()
                    } else{
                        Text("\(item.statusDisplay)")
                            .alignmentGuide(.trailing) { _ in 0 }
                            .foregroundColor(.red)
                            .bold()
                    }
                }
            }
        }
    }
}
