//
//  HFHUDLoading.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/25/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFHUDLoading: NSObject {
    
    let superView: UIView
    var msgForLoading = "Loading..."
    
    @available(*, unavailable, message: "init is unavailable, use init with viewToShowLoading parameter")
    override init() {
        fatalError()
    }
    
    init(viewToShowLoading view: UIView) {
        self.superView = view
    }
    
    func showLoading() -> Void {
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: self.msgForLoading, presentingView: self.superView)
    }
    
    func showLoadingWithMessage(_ message: String) -> Void {
        self.msgForLoading = message
        APESuperHUD.showOrUpdateHUD(loadingIndicator: .standard, message: self.msgForLoading, presentingView: self.superView)
    }
    
    func stopLoading() -> Void {
        APESuperHUD.removeHUD(animated: true, presentingView: self.superView, completion: nil)
    }
    
    
}
