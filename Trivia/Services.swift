//
//  Services.swift
//  Trivia
//
//  Created by Alexander Hanneman on 6/7/16.
//  Copyright © 2016 Alexander Hanneman. All rights reserved.
//

import Foundation


class Services {
    
    //needed to add this to p.list to allow HTTP calls
    //<key>NSAppTransportSecurity</key>
    //        <dict>
    //        <key>NSAllowsArbitraryLoads</key>
    //        <true/>
    //        <key>NSExceptionDomains</key>
    //        <dict>
    //        <key>http://jservice.io</key>
    //        <dict>
    //        <key>NSTemporaryExceptionAllowsInsecureHTTPLoads</key>
    //        <true/>
    //        </dict>
    //        </dict>
    //        </dict>
    
    var gotRandom: Bool = false
    
    func GetRandomQuestion() -> RandomQuestion{
        
        let randomQuestion = RandomQuestion()
        
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
            
            do{
                print()
                print("-- Getting Random --")
                let dataString = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as! [[String:AnyObject]]
                
                randomQuestion.Question = dataString[0]["question"]! as! String
                randomQuestion.CategoryName = dataString[0]["category"]!["title"]! as! String
                randomQuestion.Answer = dataString[0]["answer"]! as! String
                
//     randomQuestion.Answer = a.stringByReplacingOccurrencesOfString("<i>", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
//     .stringByReplacingOccurrencesOfString("</i>", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                
                print("question: " + randomQuestion.Question)
                print("answer: " + randomQuestion.Answer)
                
                self.gotRandom = true
            }
            catch{
                print("Error getting random question")
            }
        }
        
        task.resume()
        
        return randomQuestion
    }
}