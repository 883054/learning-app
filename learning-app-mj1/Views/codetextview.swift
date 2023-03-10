//
//  codetextview.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/25/23.
//

import SwiftUI

struct codetextview: UIViewRepresentable{
    @EnvironmentObject var modelV5 : contentmodelCVM
    
    func makeUIView(context: Context) -> UITextView {
        let textview = UITextView()
        textview.isEditable = false
        return textview
    }
    func updateUIView(_ textview: UITextView, context: Context) {
        //set the attributed text for the lesson
            textview.attributedText = modelV5.codetext
        
        //scroll back to the top
        textview.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

//struct codetextview_Previews: PreviewProvider {
    //static var previews: some View {
  //      codetextview()
  //  }
//}
