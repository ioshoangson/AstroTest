//
//  RequestDetail.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

enum HeaderContentType {
    case applicationJSON
    case applicationXWWWFormUrlEncoded
}

class RequestDetail: NSObject {
    public enum RequestMethods: Int {
        case GET
        case POST
        case DELETE
        case PUT
    }
    
    public var params: NSDictionary? {
        didSet{
            let isExistingParams: Bool = self.params != nil && self.urlRequest != nil
            if (isExistingParams) {
                self.createRequestWithParams(params: self.params)
            }
        }
    }
    
    private(set) var urlRequest: NSMutableURLRequest?
    private(set) var baseURL: String?
    private(set) var fullURL: String?
    private(set) var requestMethod: RequestMethods = .POST //Default by POST method
    
    convenience init(baseURL: String, path: String) {
        self.init()
        self.baseURL = baseURL
        self.fullURL = baseURL + path
        self.urlRequest = NSMutableURLRequest(url: NSURL(string: self.fullURL!)! as URL)
    }
    
    convenience init(baseURL: String, path: String, requestMethod: RequestMethods) {
        self.init()
        self.baseURL = baseURL
        self.fullURL = baseURL + path
        self.requestMethod = requestMethod
        self.urlRequest = NSMutableURLRequest(url: NSURL(string: self.fullURL!)! as URL)
    }
    
    convenience init(baseURL: String, path: String, params: NSDictionary?, requestMethod: RequestMethods) {
        self.init()
        self.baseURL = baseURL
        self.fullURL = baseURL + path
        self.params = params
        self.requestMethod = requestMethod
        self.urlRequest = NSMutableURLRequest(url: NSURL(string: self.fullURL!)! as URL)
    }
    
    
    private func createRequestWithParams(params: NSDictionary?) {
        switch self.requestMethod {
        case .GET:
            if self.params != nil {
                let formatParams = self.formatParamForGET(params: params)
                self.fullURL = self.fullURL! + "\(formatParams)"
                let escapedAddress = self.fullURL?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
                self.urlRequest?.url = NSURL(string: escapedAddress!)! as URL
            }
            break
        case .POST:
            self.setHeaderContentType(contentType: .applicationJSON)
            do {
                let data = try JSONSerialization.data(withJSONObject: params!, options: JSONSerialization.WritingOptions.prettyPrinted)
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                self.setHttpBodyData(data: json!.data(using: String.Encoding.utf8.rawValue)!)
            } catch {}
            break
        case .DELETE:
            break
        case .PUT:
            break
        }
    }
    
    public func setHttpBodyData(data: Data) {
        self.urlRequest?.httpBody = data
    }
    
    public func formatParamForGET(params: NSDictionary?) -> String {
        let values = params?.allValues
        let keys = params?.allKeys
        
        var formatParams: String = ""
        for (index, key) in (keys?.enumerated())! {
            let value: String = values?[index] as! String
            formatParams = formatParams + "\(index != 0 ? "&" : "?")\(key)=\(value)"
        }
        
        return formatParams
    }
    
    public func setHeaderContentType(contentType: HeaderContentType) {
        switch contentType {
        case .applicationJSON:
            self.urlRequest?.setValue("application/json", forHTTPHeaderField: "Content-Type")
            break
        case .applicationXWWWFormUrlEncoded:
            self.urlRequest?.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            break
        }
    }
}
