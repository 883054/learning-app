//
//  ContentView.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/18/23.
//

import SwiftUI

struct homeview: View {
    
    @EnvironmentObject var modelvar : contentmodelCVM
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("what do you want to do today?")
                ScrollView {
                    LazyVStack {
                        ForEach(modelvar.modulesV) { moduleee in
                            //learning card
                            NavigationLink(destination: contentview().onAppear(perform: {
                                modelvar.beginmodule(moduleee.id)
                            }),
                                           tag: moduleee.id,
                                           selection: $modelvar.currentcontentselected ,
                                           
                                           label: { homeviewrow(image: moduleee.content.image, title: "learn \(moduleee.category)", description: moduleee.content.description, count: "\(moduleee.content.lessons.count) lessons", time: moduleee.content.time, mjid: "\(moduleee.id)")})
                            
                            
                            //test card
                            NavigationLink(destination: testview().onAppear(perform: {
                                modelvar.begintest(moduleee.id)
                            }), tag: moduleee.id, selection: $modelvar.currenttestselected, label: {                            homeviewrow(image: moduleee.test.image, title: " \(moduleee.category) test", description: moduleee.test.description, count: "\(moduleee.test.questions.count) tests", time: moduleee.test.time, mjid: "\(moduleee.id)")})
                            
                            

                            //test for me
                            Text("\(moduleee.id)").bold()
                            
                        }
                        
                        
                    }.padding()
                }
            }.navigationTitle("Get started")
        }.navigationViewStyle(.stack)
        
        
        
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        homeview().environmentObject(contentmodelCVM())
    }
}
