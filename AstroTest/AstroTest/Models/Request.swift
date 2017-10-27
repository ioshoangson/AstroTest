//
//  Request.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

struct Response {
    var responseCode: String
    var responseMessage: String
    var data: AnyObject?
}

class Request: NSObject {
    
    static let shareInstance = Request()
    
    //MARK:
    //MARK: - Request Methods
    public func requestWithPOSTMethod(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        self.dataTask(request: request, method: "POST", completion: completion)
    }
    
    public func requestWithPUTMethod(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        self.dataTask(request: request, method: "PUT", completion: completion)
    }
    
    public func requestWithGETMethod(request: NSMutableURLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        self.dataTask(request: request, method: "GET", completion: completion)
    }
    
    
    
    //MARK:
    //MARK: - Private Methods
    
    private func dataTask(request: NSMutableURLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        request.httpMethod = method
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, Response(responseCode: json!["responseCode"] as! String, responseMessage: json!["responseMessage"] as! String, data: json) as AnyObject)
                } else {
                    completion(false, Response(responseCode: json!["responseCode"] as! String, responseMessage: json!["responseMessage"] as! String, data: json) as AnyObject)
                }
                self.logRequest(request: request, data: json as AnyObject)
            } else {
                self.logRequest(request: request, data: data as AnyObject)
            }
            }.resume()
    }
    
    
    
    private func logRequest(request: NSMutableURLRequest, data: AnyObject) {
        if Constants.ENABLE_LOG_REQUEST {
            print("******************** BEGIN REQUEST ********************")
            print("REQUEST URL: \(String(describing: request.url))\n")
            
            print("REQUEST METHOD: \(request.httpMethod)\n")
            
            if request.httpBody != nil {
                do {
                    let jsonDict = try JSONSerialization.jsonObject(with: request.httpBody!, options: []) as! NSDictionary
                    print("REQUEST PARAMS: \(jsonDict)\n")
                } catch {
                    let params = String(data: request.httpBody!, encoding: .utf8)
                    print("REQUEST PARAMS: \(String(describing: params))\n")
                }
            }
            
            print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields))\n")
            
            print("RESPONSE DATA:")
            print(data)
            print("******************** END REQUEST ********************")
        }
    }

}
