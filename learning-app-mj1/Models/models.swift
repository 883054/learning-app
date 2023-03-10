//
//  models.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/18/23.
//

import Foundation


struct moduleSM: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var content: contentS
    var test: testS
}


struct contentS: Decodable, Identifiable {
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [lessonS]
}


struct lessonS: Decodable, Identifiable {
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
}



struct testS: Decodable, Identifiable {
    var id: Int
    var image: String
    var time: String
    var description: String
    var questions: [questionS]
}



struct questionS : Decodable, Identifiable {
    
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
