//
//  ViewController.swift
//  Trivia
//
//  Created by Alexander Hanneman on 5/30/16.
//  Copyright © 2016 Alexander Hanneman. All rights reserved.
//

import UIKit

public class RandomQuestionController: UIViewController, UITextFieldDelegate
{
    var randomQuestion = RandomQuestion()
    var input = InputText()
    var service = Services()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        GetRandomQuestion()
    }

    
    required public init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor()
    }
    
    private func GetRandomQuestion(){
        self.randomQuestion = service.GetRandomQuestion()
        while !service.gotRandom {}
        self.createView(randomQuestion.Question, answer: randomQuestion.Answer)
    }
    
    private func createView(question: String, answer: String){
        
        print()
        print("-- Creating View --")

        //display question
        let questionLabel = UILabel(frame: CGRect(x: 20, y: 20, width: 280, height: question.characters.count))
        questionLabel.text = question
        questionLabel.font = UIFont(name: "Times", size: 14)
        questionLabel.numberOfLines = 6
        self.view.addSubview(questionLabel)
        
        //display input
        input = InputText(frame: CGRect(x: 20, y: 130, width: 280, height: 50))
        input.font = UIFont.systemFontOfSize(15)
        input.backgroundColor = UIColor.whiteColor()
        input.updateFocusIfNeeded()
        input.placeholder = "Answer goes here"
        input.textColor = UIColor.blackColor()
        input.keyboardType = UIKeyboardType.Default
        input.returnKeyType = UIReturnKeyType.Done
        input.delegate = self
        self.view.addSubview(input)
    }
    
    //        //display enter button
    //        let button = Button(frame: CGRect(x: 50, y: 240, width: 200, height: 50))
    //        button.backgroundColor = .greenColor()
    //        button.setTitle("Enter", forState: .Normal)
    //        button.addTarget(self, action: #selector(showModalExamples), forControlEvents: .EditingDidEnd)
    //        self.view.addSubview(button)
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        showModalExamples(textField.text!, answer: randomQuestion.Answer)
        
        return true;
    }

    internal func showModalExamples(userInput: String, answer: String)
    {
        print()
        print("-- Show Modal --")
        
        
        var result : String
        if(userInput.lowercaseString == answer.lowercaseString){
            result = "Correct!"
        }
        else{
            result = "Incorect :("
        }
    
        //Grey background with white box red button
//                    var settings = Modal.Settings()
//                    settings.borderRadius = 0
//                    settings.shadowType = .Curl
//                    settings.shadowOffset = CGSize(width: 0, height: -3)
//        
//                    Modal(title: "Correct!", body: answer, status: .Error, settings: settings).show()
        
        //Dark background white box
        var settings = Modal.Settings()
        settings.overlayBlurStyle = .Dark
        Modal(title: result, body: answer, status: .Warning, parentController: self, settings: settings).show()
        
        //Blue background
//        var settings = Modal.Settings()
//        settings.overlayColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
//        settings.backgroundColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
//        settings.borderColor = .whiteColor()
//        settings.titleColor = .whiteColor()
//        settings.bodyColor = .blueColor()
//        Modal(title: result, body: answer, status: .Info, settings: settings).show()
    }
    
    func CloseModal(){
        print()
        print("-- Close Modal --")
        
        GetRandomQuestion()
    }
}

