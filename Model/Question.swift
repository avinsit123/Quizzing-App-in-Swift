//
//  Question.swift
//  Quiz-up
//
//  Created by Avinash Swaminathan on 07/09/18.
//  Copyright © 2018 Avinash Swaminathan. All rights reserved.
//

import Foundation

class Question{
    let questionText : String
    let correctAns : Bool
    init(text: String,correctAnswer:Bool){
        questionText=text
        correctAns=correctAnswer
    }
    
}


