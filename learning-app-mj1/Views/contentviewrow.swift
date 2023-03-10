//
//  contentviewrow.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/25/23.
//

import SwiftUI

struct contentviewrow: View {
    @EnvironmentObject var modelvar3: contentmodelCVM
    var index : Int
    
    
    var body: some View {
     
        let lesson1 = modelvar3.currentmodule!.content.lessons[index]
        ZStack {
            Rectangle().foregroundColor(.orange).frame(height: 66)
            HStack {
                Text(String(index+1))
                VStack {
                    Text(lesson1.title)
                    Text(lesson1.duration)
                }
            }
        }
        
        
    }
}
