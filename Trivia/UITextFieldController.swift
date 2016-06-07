//
//  ViewController.swift
//  Trivia
//
//  Created by Alexander Hanneman on 5/30/16.
//  Copyright © 2016 Alexander Hanneman. All rights reserved.
//

import UIKit

class UITextFieldController : UIViewController, UITextFieldDelegate
{
    var answer : String = ""
    
    func initAnswer(answer: String){
        self.answer = answer
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("TextField did begin editing method called")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print("TextField did end editing method called")
        textField.resignFirstResponder();
        showModalExamples(textField.text!)
    }
    //
    //    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
    //        print("TextField should begin editing method called")
    //        return true;
    //    }
    //
    //    func textFieldShouldClear(textField: UITextField) -> Bool {
    //        print("TextField should clear method called")
    //        return true;
    //    }
    //
    //    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
    //        print("TextField should snd editing method called")
    //        return true;
    //    }
    //
    //    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    //        print("While entering the characters this method gets called")
    //        return true;
    //    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("TextField should return method called")
        textField.resignFirstResponder();
        showModalExamples(textField.text!)
        
        return true;
    }
    
    func showModalExamples(userInput: String)
    {
        print()
        print("-- Show Modal --")
        
        //    @IBAction func showModalExamples(sender: UIButton)
        //    {
        //        switch sender.tag
        //        {
        //        case 1 :
        //            Modal(title: "Correct!", body: answer, status: .Success).show()
        //
        //        case 2 :
        //            var settings = Modal.Settings()
        //            settings.backgroundColor = .whiteColor()
        //            settings.shadowType = .Hover
        //            settings.shadowRadius = CGFloat(5)
        //            settings.shadowOffset = CGSize(width: 0, height: 0)
        //            settings.shadowOpacity = 0.1
        //            settings.overlayBlurStyle = .ExtraLight
        //
        //            Modal(title: "Correct!", body: answer, status: .Warning, settings: settings).show()
        //
        //        case 3 :
        //            var settings = Modal.Settings()
        //            settings.borderRadius = 0
        //            settings.shadowType = .Curl
        //            settings.shadowOffset = CGSize(width: 0, height: -3)
        //
        //            Modal(title: "Correct!", body: answer, status: .Error, settings: settings).show()
        //
        //        case 4 :
        //            var settings = Modal.Settings()
        //            settings.overlayBlurStyle = .Dark
        //            settings.backgroundColor = UIColor(red: 200/255, green: 203/255, blue: 177/255, alpha: 0.5)
        //            settings.bodyColor = .whiteColor()
        //            Modal(title: "Correct!", body: answer, status: .Notice, settings: settings).show()
        //
        //        case 5 :
        //        var settings = Modal.Settings()
        //        settings.overlayColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
        //        settings.backgroundColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
        //        settings.borderColor = .whiteColor()
        //        settings.titleColor = .whiteColor()
        //        settings.bodyColor = .blueColor()
        //        Modal(title: "Correct!", body: answer, status: .Info, settings: settings).show()
        //
        //        default :
        //            Modal(title: "Correct!", body: answer, status: .Info).show()
        //
        //        }
        
        var result : String
        
        if(userInput.lowercaseString == self.answer.lowercaseString){
            result = "Correct!"
        }
        else{
            result = "Incorect :("
        }
        
        //case 5
        var settings = Modal.Settings()
        settings.overlayColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
        settings.backgroundColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
        settings.borderColor = .whiteColor()
        settings.titleColor = .whiteColor()
        settings.bodyColor = .blueColor()
        Modal(title: result, body: self.answer, status: .Info, settings: settings).show()
    }
}