//
//  contentmodel.swift
//  learning-app-mj1
//
//  Created by Mohammad Jamali on 2/18/23.
//

import Foundation

class contentmodelCVM: ObservableObject {
 
    //list of modules (getting getting data to modulesV and having it everywhere
    @Published var  modulesV = [moduleSM]()
    // current module
    @Published var currentmodule: moduleSM?
    var currentmoduleindex = 0
    //current lesson
    @Published var currentlesson: lessonS?
    var currentlessonindex = 0
    //curent question
    @Published var currentquestion: questionS?
    var currentquestionindex = 0
    //current lesson explanation (description)
    @Published var codetext = NSAttributedString()
    var styledataV: Data?
    
    //current selected content and test
    @Published var currentcontentselected:Int?
    @Published var currenttestselected:Int?
    
    init() {
        getlocaldata()
    }
    
    // MARK: data method (populating modulesV)
    func getlocaldata() {
        //get a url to the jason file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            //read the file into a data object
            let jsondata = try Data(contentsOf: jsonUrl!)
            //try to decode the jason into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([moduleSM].self, from: jsondata)
            // assing parsed modules to modules property
            self.modulesV = modules
        }
        catch {
            // catch error
            print("can't parse")
        }
        //parse style data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            //read the file into a data object
            let styledata = try Data(contentsOf: styleUrl!)
            self.styledataV = styledata
        }
        catch {
            
        }
    }
    
    // MARK: module navigation method (sending data to content view(current state of view))
    func beginmodule (_ moduleid:Int) {
        //find the index of this module id
        for index in 0..<modulesV.count {
            if modulesV[index].id == moduleid {
                //found the matching module
                currentmoduleindex = index
                break
            }
        }
        //set the current module
        currentmodule = modulesV[currentmoduleindex]
    }
    
    func beginlesson(_ lessonindex: Int) {
        //check that the lesson index is within range of module lessons
        if lessonindex < currentmodule!.content.lessons.count {
            currentlessonindex = lessonindex
        }
        else {
            currentlessonindex = 0
        }
        //set the current lesson
        currentlesson = currentmodule!.content.lessons[currentlessonindex]
        codetext = addstyling(currentlesson!.explanation)
    }
    
    
    func nextlesson() {
        //advance the lesson index
        currentlessonindex += 1
        //check if it is within range
        if currentlessonindex < currentmodule!.content.lessons.count {
            //set the current lesson property
            currentlesson = currentmodule!.content.lessons[currentlessonindex]
            codetext = addstyling(currentlesson!.explanation)
        }
        else {
            //reset the state
            currentlessonindex = 0
            currentlesson = nil
            
        }
    }
    
    
    func hasnextlesson() -> Bool {
 //       if currentlessonindex + 1 < currentmodule!.content.lessons.count {
//            return true
 //       }
 //       else {
 //           return false
 //       }
        return(currentlessonindex + 1 < currentmodule!.content.lessons.count)
    }
    
    func begintest(_ moduleid:Int) {
        //set current module
        beginmodule(moduleid)
        //set current question
        currentquestionindex = 0
        //if there are questions, set the current question to the first one
        if currentmodule?.test.questions.count ?? 0 > 0 {
            currentquestion = currentmodule!.test.questions[currentquestionindex]
            codetext = addstyling(currentquestion!.content)
        }
    }
    
    func nextquestion() {
        //advance the question index
        currentquestionindex += 1
        //check if it's within range of questions
        if currentquestionindex < currentmodule!.test.questions.count {
            // set the current question
            currentquestion = currentmodule!.test.questions[currentquestionindex]
            codetext = addstyling(currentquestion!.content)
        } else {
            //if no, the reset properties
            currentquestionindex = 0
            currentquestion = nil 
        }
    }
    
    // MARK: code styling (video description)
    private func addstyling(_ htmlstring: String) -> NSAttributedString {
        var resultstring = NSAttributedString()
        var data = Data()
        //add the styling data
        if styledataV != nil {
            data.append(styledataV!)
        }
        
        // add the html data
        data.append(Data(htmlstring.utf8))
        
        // Convert to attributed string
        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
            
            resultstring = attributedString
        }
        //convert to attributed string
        
        return resultstring
    }
}
