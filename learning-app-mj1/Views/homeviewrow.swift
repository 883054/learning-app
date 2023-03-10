//
//  homeviewrow.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/25/23.
//

import SwiftUI

struct homeviewrow: View {
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    var mjid: String
    
    var body: some View {
       
        
        ZStack {
            Rectangle().foregroundColor(.red).aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack {
                //Image
                Image(image).resizable().frame(width: 116, height: 116).clipShape(Circle())
                //Text
                VStack (alignment: .leading) {
                    //headline
                    Text(title).bold()
                    //description
                    Text(description)
                    //Icons
                    HStack {
                        //number of lessons/questions
                        Image(systemName: "text.book.closed").resizable().frame(width: 15, height: 15)
                        Text(count).font(.caption)
                        //Time
                        Image(systemName: "clock").resizable().frame(width: 15, height: 15)
                        Text(time).font(.caption)
                    }
                    Text(mjid)
                }
                
                
            }.padding()
        }
        
        
    }
}

struct homeviewrow_Previews: PreviewProvider {
    static var previews: some View {
        homeviewrow(image: "swift", title: "lean swift", description: "some description", count: "12 lessons", time: "1000 hours", mjid: "10")
    }
}
