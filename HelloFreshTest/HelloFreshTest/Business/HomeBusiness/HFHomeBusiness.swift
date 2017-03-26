//
//  HFHomeBusiness.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import Foundation

class HFHomeBusiness: NSObject, HFHomeBusinessProtocol {
    
    
    // Request home data, the callback we have the array list with data formated
    // or we throw some error to user / view, it's here where we handle some error
    // handle, if we need manipulate msg and so on
    func requestHomeData(response dataResponse: @escaping DataResponse) {
        
        let dataCreating = HFNetworkRequest(method: .GET, url: "", bodyParameters: nil, headerParameter: nil)
        let providerData = HFHomeProvider()
        
        providerData.request(dataCreating) { (data, error) in
            
            if error == nil {
                
                do {
                    let jsonSerializedResponse = try data?.fromJSON() as! Array<Dictionary<String, Any>>
                    
                    do {
                        let formatedList = try HFHomeModel.parseToListOfHFHomeModelList(data: jsonSerializedResponse)
                        
                        dataResponse(formatedList, nil)
                    } catch {
                        dataResponse(nil, NetworkErrorResponse.HSParseDataError.failedMappingData)
                    }
                } catch {
                    dataResponse(nil, NetworkErrorResponse.ParseResponseFailed.jsonParseFailed)
                }
            } else {
                dataResponse(nil, NetworkErrorResponse.unknown((error?.description)!))
            }
            
        }

        
    }
    
}
