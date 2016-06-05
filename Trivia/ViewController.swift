//
//  ViewController.swift
//  Trivia
//
//  Created by Alexander Hanneman on 5/30/16.
//  Copyright © 2016 Alexander Hanneman. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var question = "";
    var answer = "";
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.GetRandomQuestion()
        self.answer = "Blue"
    }
    
    internal func GetRandomQuestion(){
        
        
        let url:NSURL = NSURL(string: "http://jservice.io/api/random")!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
//        let paramString = "data=Hello"
//        request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            let dataString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(dataString)
            
        }
        
        task.resume()
        
        
//        let session = NSURLSession.sharedSession()
//        let url = NSURL(string: "http://jservice.io/api/random")!
//        
//        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
//                        // Make sure we get an OK response
//                        guard let realResponse = response as? NSHTTPURLResponse where
//                            realResponse.statusCode == 200 else {
//                                print("Not a 200 response")
//                                return
//                        }
//   
//            // 1. Check HTTP response for successful GET request
//            if let httpResponse = response as? NSHTTPURLResponse {
//                switch httpResponse.statusCode {
//                case 200:
//                    do{
//                        // 2. Create JSON object with data
//                        let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
//                        print(jsonDictionary)
//                    }
//                    catch{
//                        
//                    }
//                    
//                default:
//                    print("GET request not successful. HTTP status code: \(httpResponse.statusCode)")
//                }
//            } else {
//                print("Error: Not a valid HTTP response")
//                print(response)
//            }
//        }).resume()
        
        
        
//        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
//        let postEndpoint: String = "https://jservice.io/api/random"
//        let session = NSURLSession.sharedSession()
//        let url = NSURL(string: postEndpoint)!
//        
//        // Make the POST call and handle it in a completion handler
//        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
//            // Make sure we get an OK response
//            guard let realResponse = response as? NSHTTPURLResponse where
//                realResponse.statusCode == 200 else {
//                    print("Not a 200 response")
//                    return
//            }
//            
//            // Read the JSON
//            do {
//                if NSString(data:data!, encoding: NSUTF8StringEncoding) != nil {
//                    
//                    // Parse the JSON to get the IP
//                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
//                    print(jsonDictionary)
//                    
//                    
//                    self.question = ""
//                    self.createView()
//                }
//            } catch {
//                print("bad things happened")
//            }
//        }).resume()
    }

    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal func createView(){
        
        //display question
        let questionLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 600, height: 400))
        questionLabel.text = self.question
        self.view.addSubview(questionLabel)
        
        //display enter button
        let button = UIButton(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
        button.backgroundColor = .greenColor()
        button.setTitle("Enter", forState: .Normal)
        button.addTarget(self, action: #selector(showModalExamples), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
    }
    
    @IBAction func showModalExamples(sender: UIButton)
    {
        switch sender.tag
        {
        case 1 :
            Modal(title: "Correct!", body: answer, status: .Success).show()
            
        case 2 :
            var settings = Modal.Settings()
            settings.backgroundColor = .whiteColor()
            settings.shadowType = .Hover
            settings.shadowRadius = CGFloat(5)
            settings.shadowOffset = CGSize(width: 0, height: 0)
            settings.shadowOpacity = 0.1
            settings.overlayBlurStyle = .ExtraLight
            
            Modal(title: "Correct!", body: answer, status: .Warning, settings: settings).show()
            
        case 3 :
            var settings = Modal.Settings()
            settings.borderRadius = 0
            settings.shadowType = .Curl
            settings.shadowOffset = CGSize(width: 0, height: -3)
            
            Modal(title: "Correct!", body: answer, status: .Error, settings: settings).show()
            
        case 4 :
            var settings = Modal.Settings()
            settings.overlayBlurStyle = .Dark
            settings.backgroundColor = UIColor(red: 200/255, green: 203/255, blue: 177/255, alpha: 0.5)
            settings.bodyColor = .whiteColor()
            Modal(title: "Correct!", body: answer, status: .Notice, settings: settings).show()
            
        case 5 :
            var settings = Modal.Settings()
            settings.overlayColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
            settings.backgroundColor = UIColor(red: 40/255, green: 102/255, blue: 191/255, alpha: 0.25)
            settings.borderColor = .whiteColor()
            settings.titleColor = .whiteColor()
            settings.bodyColor = .blueColor()
            Modal(title: "Correct!", body: answer, status: .Info, settings: settings).show()
            
        default :
            Modal(title: "Correct!", body: answer, status: .Info).show()
            
        }
    }
    
}

