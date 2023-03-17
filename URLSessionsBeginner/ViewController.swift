//
//  ViewController.swift
//  URLSessionsBeginner
//
//  Created by Hande Nur Yavaş on 17.03.2023.
//

import UIKit

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        var request = URLRequest(url: URL(string: "")!)
        
        var header = [String : String]()
        
        header["Content - Type"] = "application/json"
        
        header["Autorization"] = "Token value"
        
        request.allHTTPHeaderFields = header
        
        request.addValue("Value", forHTTPHeaderField: "Key")
        
        request.httpMethod = "POST"
        
        let parameters : [String : Any] = [
            
            "Email" : "value",
            "Password" : "value"
            
        ]
        
        if header["Content - Type"] == "application/json"
        {
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
            
        }
        else if header["Content - Type"] == "application/x-www-from-urlencoded"
        {
            request.httpBody = UrlEncodedTranslate(parameters: parameters)
        }
        
       
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil
            {
                
            }
            else
            {
                let result = response as! HTTPURLResponse
                
                if result.statusCode == 200
                {
                    DispatchQueue.main.async
                    {
                        
                    }
                }
                else
                {
                    
                }
            }
            
        }.resume()
        
    
        
       
    }

    func UrlEncodedTranslate(parameters : [String : Any]) -> Data
    {
        var strData = ""
        
        for p in parameters {
            
            if strData != ""
            {
               strData += "&"
            }
            
            strData += "\(p.key)=\(p.value)"
            
        }
        
        return strData.data(using: .ascii)!
    }
}

