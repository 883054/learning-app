//
//  testresultview.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 3/9/23.
//

import SwiftUI

struct testresultview: View {
    @EnvironmentObject var modelvar7 : contentmodelCVM
    var numcorrect2:Int
    var body: some View {
        VStack {
            Text("it's over")
            Text("you got \(numcorrect2) out of \(modelvar7.currentmodule?.test.questions.count ?? 0) questions")
            
            Button {
                //send user back to home view
                modelvar7.currenttestselected = nil
            } label: {
                ZStack {
                    Rectangle().foregroundColor(.green)
                    Text("compeleteeeee")
                }
            }

        }
    }
}

