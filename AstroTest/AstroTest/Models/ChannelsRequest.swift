//
//  ChannelsRequest.swift
//  AstroTest
//
//  Created by HOANGSON on 10/27/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit

class ChannelsRequest: NSObject {
    
    static let shareInstance = ChannelsRequest()
    
    public typealias CompletionBlock = (Bool, AnyObject) -> Void
    
    
    //MARK:
    //MARK: - Public Methods

    public func getListChannel(context: BaseViewController, completion: @escaping CompletionBlock) {
        let requestDetail = RequestDetail.init(baseURL: API.SERVER_PRODUCT_URL, path: API.CHANNEL_LIST, requestMethod: .GET)
        let urlRequest = requestDetail.urlRequest
        
        Request.shareInstance.requestWithGETMethod(request: urlRequest!) { (success, data) in
            if (success) {
                DispatchQueue.main.async {
                    completion(success, self.parseChannelDictionary(response: data as! Response))
                }
            }
        }
    }
    
    public func channelDetail(context: BaseViewController, channelId: Int, completion: @escaping CompletionBlock) {
        let requestDetail = RequestDetail.init(baseURL: API.SERVER_PRODUCT_URL, path: API.DETAIL_CHANNEL, requestMethod: .GET)
        requestDetail.params = ChannelParams.channelDetail(channelId: channelId)
        let urlRequest = requestDetail.urlRequest
        
        Request.shareInstance.requestWithGETMethod(request: urlRequest!) { (success, data) in
            DispatchQueue.main.async {
                completion(success, data!)
            }
        }
    }

    
    //MARK:
    //MARK: - Private Methods
    
    private func parseChannelDictionary(response: Response) -> AnyObject{
        let dict = response.data?["channels"] as! Array<AnyObject>
        var listChannelsId: Array<String> = [String]()
        var results = [Channel]()
        
        for item in dict {
            let channelDict = item as! Dictionary<String, AnyObject>
            let channel = Channel(channelId: channelDict["channelId"] as! Int,
                                  channelStbNumber: channelDict["channelStbNumber"] as! Int,
                                  channelTitle: channelDict["channelTitle"] as! String,
                                  isFavorites: false)            
            listChannelsId.append(String(describing: channel.channelId!))
            let isFavorites = LocalDataManager.shareInstance.checkChannelExists(channel: channel)
            channel.setFavorite(isFavorites: isFavorites)
            results.append(channel)
        }
        
        Application.shareInstance.listChannelsId = listChannelsId
        
        return results as AnyObject
    }
}
