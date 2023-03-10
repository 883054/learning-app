//
//  contentdetailview.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/25/23.
//

import SwiftUI
import AVKit

struct contentdetailview: View {
    @EnvironmentObject var modelvar4: contentmodelCVM
    
    var body: some View {
        let lesson = modelvar4.currentlesson
        let url = URL(string: constants.videohosturl+(lesson?.video ?? ""))
        
        VStack {
            //video
            if url != nil {
                VideoPlayer(player: AVPlayer(url: url!))
            }
            //description
            codetextview()
            //next button if there's a next lesson
            if modelvar4.hasnextlesson() {
                Button {
                    //advance the lesson
                    modelvar4.nextlesson()
                } label: {
                    ZStack {
                        Rectangle().foregroundColor(.green).frame(height: 48)
                        Text("next lesson  \(modelvar4.currentmodule!.content.lessons[modelvar4.currentlessonindex+1].title)")
                    }
                    
                }
            }
            else {
                //show the complete button instead
                Button {
                    //take the user to homeview
                    modelvar4.currentcontentselected = nil
                } label: {
                    ZStack {
                        Rectangle().foregroundColor(.green).frame(height: 48)
                        Text("complete")
                    }
                    
                }
                
            }

        }
        

        
    }
}

//truct contentdetailview_Previews: PreviewProvider {
 //   static var previews: some View {
//        contentdetailview()
 //   }
//}
