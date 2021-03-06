//
//  ViewController.swift
//  QuizWork
//
//  Created by Wilson Mejía on 16/03/16.
//  Copyright © 2016 NinjaLABS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    @IBOutlet weak var viewFeedback: UIView!
    @IBOutlet weak var lbFeedback: UILabel!
    @IBOutlet weak var btnFeedback: UIButton!
    @IBOutlet weak var imgFeedback: UIImageView!
    
    var questions: [Question]!
    
    var currentQuestion = 0
    var grade = 0.0
    var quizEnded = false
    var answerid = -1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView.setProgress(0, animated:false)
        
        let q0answer0 = Answer(answer: "was", isCorrect: true)
        let q0answer1 = Answer(answer: "were", isCorrect: false)
        let q0answer2 = Answer(answer: "have", isCorrect: false)
        let q0answer3 = Answer(answer: "has", isCorrect: false)
        let question0 = Question(question: "Last year Rachel ...., so she is 23 now.", answers: [q0answer0, q0answer1, q0answer2, q0answer3])
        
        let q1answer0 = Answer(answer: "forgot", isCorrect: true)
        let q1answer1 = Answer(answer: "forget", isCorrect: false)
        let q1answer2 = Answer(answer: "have", isCorrect: false)
        let q1answer3 = Answer(answer: "has", isCorrect: false)
        let question1 = Question(question: "I'm so sorry, I ... your birthday.", answers: [q1answer0, q1answer1, q1answer2, q1answer3])
        
        let q2answer0 = Answer(answer: "speaks", isCorrect: true)
        let q2answer1 = Answer(answer: "speak", isCorrect: false)
        let q2answer2 = Answer(answer: "sspeaks", isCorrect: false)
        let q2answer3 = Answer(answer: "speeak", isCorrect: false)
        let question2 = Question(question: "She .... four languages.", answers: [q2answer0, q2answer1, q2answer2, q2answer3])
        
        let q3answer0 = Answer(answer: "teaches", isCorrect: true)
        let q3answer1 = Answer(answer: "teach", isCorrect: false)
        let q3answer2 = Answer(answer: "teachs", isCorrect: false)
        let q3answer3 = Answer(answer: "teaach", isCorrect: false)
        let question3 = Question(question: "Jane is a teacher. She .... French.", answers: [q3answer0, q3answer1, q3answer2, q3answer3])

        
        let q4answer0 = Answer(answer: "close", isCorrect: true)
        let q4answer1 = Answer(answer: "closes", isCorrect: false)
        let q4answer2 = Answer(answer: "cloose", isCorrect: false)
        let q4answer3 = Answer(answer: "clooses", isCorrect: false)
        let question4 = Question(question: "I always .... the window at night because it is cold.", answers: [q4answer0, q4answer1, q4answer2, q4answer3])

        let q5answer0 = Answer(answer: "costs", isCorrect: true)
        let q5answer1 = Answer(answer: "cost", isCorrect: false)
        let q5answer2 = Answer(answer: "cosst", isCorrect: false)
        let q5answer3 = Answer(answer: "coosts", isCorrect: false)
        let question5 = Question(question: "The food in Japan is expensive. It .... a lot to live there.", answers: [q5answer0, q5answer1, q5answer2, q5answer3])

        
        
        questions = [question0, question1, question2, question3, question4, question5]
        
        startQuiz()
    }
    
    func startQuiz(){
        questions.shuffle()
        for(var i=0; i < questions.count; i=i+1){
            questions[i].answers.shuffle()
        }
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
        
        showQuestion(0) // muestra la primera pregunta
    }
    
    func showQuestion(questionid: Int){
        
        btnAnswer1.enabled = true
        btnAnswer2.enabled = true
        btnAnswer3.enabled = true
        btnAnswer4.enabled = true
        
        lbQuestion.text = questions[questionid].strQuestion
        btnAnswer1.setTitle(questions[questionid].answers[0].strAnswer, forState: UIControlState.Normal)
        btnAnswer2.setTitle(questions[questionid].answers[1].strAnswer, forState: UIControlState.Normal)
        btnAnswer3.setTitle(questions[questionid].answers[2].strAnswer, forState: UIControlState.Normal)
        btnAnswer4.setTitle(questions[questionid].answers[3].strAnswer, forState: UIControlState.Normal)
    }
    
    @IBAction func chooseAnswer1(sender: AnyObject) {
        answerid = 0
        btnAnswer1.backgroundColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        
        //reset_color_others
        btnAnswer2.backgroundColor = UIColor.whiteColor()
        btnAnswer3.backgroundColor = UIColor.whiteColor()
        btnAnswer4.backgroundColor = UIColor.whiteColor()
    }
    
    @IBAction func chooseAnswer2(sender: AnyObject) {
        answerid = 1
        btnAnswer2.backgroundColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)

        //reset_color_others
        btnAnswer1.backgroundColor = UIColor.whiteColor()
        btnAnswer3.backgroundColor = UIColor.whiteColor()
        btnAnswer4.backgroundColor = UIColor.whiteColor()

    }
    
    @IBAction func chooseAnswer3(sender: AnyObject) {
        answerid = 2
        btnAnswer3.backgroundColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        
        //reset_color_others
        btnAnswer1.backgroundColor = UIColor.whiteColor()
        btnAnswer2.backgroundColor = UIColor.whiteColor()
        btnAnswer4.backgroundColor = UIColor.whiteColor()

    }
    
    @IBAction func chooseAnswer4(sender: AnyObject) {
        answerid = 3
        btnAnswer4.backgroundColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
        
        //reset_color_others
        btnAnswer1.backgroundColor = UIColor.whiteColor()
        btnAnswer2.backgroundColor = UIColor.whiteColor()
        btnAnswer3.backgroundColor = UIColor.whiteColor()

    }
    
    func resetAllButtons(){
        btnAnswer1.backgroundColor = UIColor.whiteColor()
        btnAnswer2.backgroundColor = UIColor.whiteColor()
        btnAnswer3.backgroundColor = UIColor.whiteColor()
        btnAnswer4.backgroundColor = UIColor.whiteColor()
    }
    
    
    @IBAction func calificar(sender: AnyObject) {
        
        if answerid != -1 {
            btnAnswer1.enabled = false
            btnAnswer2.enabled = false
            btnAnswer3.enabled = false
            btnAnswer4.enabled = false
            
            viewFeedback.hidden = false
            
          let answer: Answer = questions[currentQuestion].answers[answerid]
        
          if(answer.isCorrect == true){
            grade = grade + 1.0
            imgFeedback.image = UIImage(named: "happy")
            lbFeedback.text = answer.strAnswer + "\n\n Respuesta Correcta!"
          }else{
            imgFeedback.image = UIImage(named: "frowning")
            lbFeedback.text = answer.strAnswer + "\n\n Respuesta Incorrecta..."
          }
        
          if (currentQuestion < questions.count - 1){
            btnFeedback.setTitle("Próxima", forState: UIControlState.Normal)
          }else{
            btnFeedback.setTitle("Ver Nota", forState: UIControlState.Normal)
          }
            answerid = -1
            
            let percentage = Double(currentQuestion + 1)*(0.17)
            
            self.progressView.progress = Float(percentage)
            
        }
        
    }
    
    
    @IBAction func btnFeedbackAction(sender: AnyObject) {
        viewFeedback.hidden = true
        resetAllButtons()
        
        if quizEnded{
            startQuiz()
        }else{
            nextQuestion()
        }
    }
    
    func nextQuestion(){
        currentQuestion += 1
        if(currentQuestion < questions.count){
            showQuestion(currentQuestion)
        }else{
            endQuiz()
        }
    }
    
    func endQuiz(){
        grade = grade/Double(questions.count)*100.0
        quizEnded = true
        viewFeedback.hidden = false
        if (grade > 50.0){
            imgFeedback.image = UIImage(named: "happy")
        }else{
            imgFeedback.image = UIImage(named: "frowning")
        }
        
        lbFeedback.text = "Su nota: \(grade)"
        btnFeedback.setTitle("Reintentar", forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

