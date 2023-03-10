//
//  testview.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 3/4/23.
//

import SwiftUI

struct testview: View {
    @EnvironmentObject var modelvar6 : contentmodelCVM
    @State var selectedanswerindex : Int?
    @State var numcorrect = 0
    @State var submitted = false
    var body: some View {
        if modelvar6.currentquestion != nil {
            VStack {
                //question number
                Text("Question \(modelvar6.currentquestionindex + 1) of \(modelvar6.currentmodule?.test.questions.count ?? 0)")
                //question
                codetextview()
                //answer
                ScrollView {
                    VStack {
                        ForEach (0..<modelvar6.currentquestion!.answers.count, id: \.self) { index in
                            
                            Button {
                                //track the selected index
                                selectedanswerindex = index
                            } label: {
                                ZStack {
                                    if submitted == false {
                                        Rectangle().foregroundColor(index == selectedanswerindex ? .gray : .white)
                                    } else {
                                        //answer has submitted
                                        if index == selectedanswerindex && index == modelvar6.currentquestion!.correctIndex {
                                            //show green
                                            Rectangle().foregroundColor(.green)
                                        } else if index == selectedanswerindex && index != modelvar6.currentquestion!.correctIndex  {
                                            //show red
                                            Rectangle().foregroundColor(.red)
                                        } else if index == modelvar6.currentquestion!.correctIndex {
                                            //show green
                                            Rectangle().foregroundColor(.green)
                                        }
                                        
                                    }
                                    
                                    Text(modelvar6.currentquestion!.answers[index])
                                }
                            }.disabled(submitted)
                        }
                    }
                }
                //submit button
                Button {
                    //check if answer has beeb submiteed
                    if submitted == true {
                        //answer has already been submited, move to next question
                        modelvar6.nextquestion()
                        //reset properties
                        submitted = false
                        selectedanswerindex = nil
                    } else {
                        //change submtitted state to true
                        submitted = true
                        //check if answer is correct and increment counter if yes
                        if selectedanswerindex == modelvar6.currentquestion!.correctIndex {
                            numcorrect += 1
                        }
                    }
                    
                } label: {
                    ZStack {
                        Rectangle().foregroundColor(.green)
                        Text(buttontext)
                    }
                }.disabled(selectedanswerindex == nil)
                
                
                
            }.navigationTitle("\(modelvar6.currentmodule?.category ?? "") test")
        } else {
            //if there's no questions, show the result view
           testresultview(numcorrect2: numcorrect)
        }
        
    } 
    
    var buttontext: String {
        //check if answer is submitted
        if submitted == true {
            if modelvar6.currentquestionindex + 1 == modelvar6.currentmodule!.test.questions.count {
                //this is last question
                return "finish"
            } else {
                //there is next question
                return "next"
            }
        } else {
            return "submit"
        }
    }
}

//struct testview_Previews: PreviewProvider {
//    static var previews: some View {
//        testview()
 //   }
//}
