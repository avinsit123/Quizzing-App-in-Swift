//
//  ViewController.swift
//  Quiz-up
//
//  Created by Avinash Swaminathan on 06/09/18.
//  Copyright © 2018 Avinash Swaminathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Question: UILabel!
    @IBOutlet weak var Progress: UILabel!
    @IBOutlet var ProgressBar: UIView!
    @IBOutlet weak var Score: UILabel!
    
    let allQuestion = QuestionBank()
    var pickedAnswer : Bool = false
    var QuestionNumber : Int = 0
    var trueAnswers : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let firstQs=allQuestion.list[QuestionNumber]
       Question.text=firstQs.questionText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ButtonPress(_ sender: Any) {
        if (sender as AnyObject).tag==1 {
            pickedAnswer=true
        }
        else{
            pickedAnswer=false
        }
        checkAnswer(pickedAnswer: pickedAnswer, correctAnswer: allQuestion.list[QuestionNumber].correctAns)
        Progress.text = (String)(trueAnswers)+"/11"
        ProgressBar.frame.size.width=(view.frame.size.width/11)*CGFloat(trueAnswers)
       nextQuestion()
    }
    
    func checkAnswer(pickedAnswer : Bool , correctAnswer : Bool){
        if pickedAnswer==correctAnswer{
            print("haha")
            trueAnswers+=1
        }else{
            print("lol")
        }
        
    }
    func nextQuestion(){
        QuestionNumber = QuestionNumber + 1
        if QuestionNumber>=11 {
            print("Over")
            let alert = UIAlertController(title: "alert box", message: "Wanna Continue", preferredStyle: .alert)
            let restart = UIAlertAction(title: "Restart?", style: .destructive, handler: { (UIAlertAction) in
            })
            alert.addAction(restart)
            present(alert, animated: true, completion: nil)
        }
        else {
            Question.text = allQuestion.list[QuestionNumber].questionText
        }
       
    }
}

