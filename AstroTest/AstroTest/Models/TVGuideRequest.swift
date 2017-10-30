//
//  TVGuideRequest.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class TVGuideRequest: NSObject {
    static let shareInstance = TVGuideRequest()
    
    public typealias CompletionBlock = (Bool, AnyObject) -> Void
    private var periodStart: String?

    
    public func getCurrentShowForAllChannels(context: BaseViewController,
                                             channelId: Array<String>,
                                             periodStart: String,
                                             periodEnd: String,
                                             completion: @escaping CompletionBlock) {
        let requestDetail = RequestDetail.init(baseURL: API.SERVER_PRODUCT_URL, path: API.CURRENT_SHOW, requestMethod: .GET)
        requestDetail.params = TVGuideParams.channelDetail(channelId: channelId, periodStart: periodStart, periodEnd: periodEnd, isLive: false)
        self.periodStart = periodStart
        let urlRequest = requestDetail.urlRequest
        
        Request.shareInstance.requestWithGETMethod(request: urlRequest!) { (success, data) in
            if (success) {
                DispatchQueue.main.async {
                    completion(true, self.parseCurrentShowForAllChannels(response: data as! Response))
                }
            }
        }
    }
    
    private func parseCurrentShowForAllChannels(response: Response) -> AnyObject{
        let dict = response.data?["getevent"] as! Array<AnyObject>
        var results = [TVGuide]()
        for item in dict {
            let tvGuideDict = item as! Dictionary<String, AnyObject>
            let tvGuide = TVGuide(jsonData: tvGuideDict as NSDictionary)            
            if tvGuide.showOnNow(periodStart: self.periodStart!) {
                tvGuide.setIsOnNow(onNow: true)
                results.append(tvGuide)
            }
        }
        return results as AnyObject
    }

}
