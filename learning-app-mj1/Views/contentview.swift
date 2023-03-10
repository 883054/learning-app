//
//  contentview.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/25/23.
//

import SwiftUI

struct contentview: View {
    @EnvironmentObject var modelvar2 : contentmodelCVM
    var body: some View {
        
        ScrollView {
            LazyVStack {
             // confirm that currentmodule is set
                if modelvar2.currentmodule != nil {
                    ForEach(0..<modelvar2.currentmodule!.content.lessons.count) {index in
                        //lesson card
                        NavigationLink(destination: contentdetailview().onAppear(perform: {modelvar2.beginlesson(index)})) {
                            contentviewrow(index: index)
                        }
                        
                    }
                    }
            }.padding()
                .navigationTitle("learn \(modelvar2.currentmodule?.category ?? "")")
            }
        }
        
        
    }


