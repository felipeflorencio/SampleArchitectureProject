// APESuperHUD.swift
//
// The MIT License (MIT)
//
// Copyright (c) 2016 apegroup
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

/**
 Default icons
 
 - HappyFace: An icon with a smiling face.
 - SadFace: An icon with a sad face.
 - CheckMark: An icon with a standard checkmark.
 - Email: An icon with a letter.
*/
public enum IconType: String {
    
    case Info = "info_icon"
    case HappyFace = "happy_face_icon"
    case SadFace = "sad_face_icon"
    case CheckMark = "checkmark_icon"
    case Email = "email_icon"
    
}

/**
Layout of the loading indicator
 
 - Standard: Apple standard spinner loading indicator.
*/
public enum LoadingIndicatorType: Int {
    case standard
}

/**
 Enum for setting language for default messages in the HUD
 
 - English: English
 */
public enum LanguageType: Int {
    case english
}

open class APESuperHUD {

    /// Property for setting up the HUD appearance
    open static var appearance = HUDAppearance()
    
    // MARK: API With UIImage
    
    /**
     Show or update the HUD.
    
     - parameter icon: The icon type icon in the HUD.
     - parameter message: The text in the HUD.
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
    */
    open static func showOrUpdateHUD(icon: UIImage, message: String, presentingView: UIView, completion: (() -> Void)?) {
        let duration = appearance.defaultDurationTime
        showHud(text: Array(arrayLiteral: message), icon: icon, duration: duration, presentingView: presentingView, completion: completion)
    }
    
    /**
     Show or update the HUD.
     
     - parameter icon: The icon type icon in the HUD.
     - parameter message: The text in the HUD.
     - parameter duration: How long the HUD will be displayed (in seconds).
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
     */
    open static func showOrUpdateHUD(icon: UIImage, message: String, duration: Double, presentingView: UIView, completion: (() -> Void)?) {
        showHud(text: Array(arrayLiteral: message), icon: icon, duration: duration, presentingView: presentingView, completion: completion)
    }
    
    
    // MARK: API With IconType
    
    /**
     Show or update the HUD.
    
     - parameter icon: The icon type icon in the HUD.
     - parameter message: The text in the HUD.
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
    */
    open static func showOrUpdateHUD(icon: IconType, message: String, presentingView: UIView, completion: (() -> Void)?) {
        let defaultIcon = iconImage(imageName: icon.rawValue)
        let duration = appearance.defaultDurationTime
        showHud(text: Array(arrayLiteral: message), icon: defaultIcon, duration: duration, presentingView: presentingView, completion: completion)
    }
    
    /**
     Show or update the HUD.
     
     - parameter icon: The icon type icon in the HUD.
     - parameter message: The text in the HUD.
     - parameter duration: How long the HUD will be displayed (in seconds).
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
     */
    open static func showOrUpdateHUD(icon: IconType, message: String, duration: Double, presentingView: UIView, completion: (() -> Void)?) {
        let defaultIcon = iconImage(imageName: icon.rawValue)
        showHud(text: Array(arrayLiteral: message), icon: defaultIcon, duration: duration, presentingView: presentingView, completion: completion)
    }
    
    
    // MARK: API With Title
    
    /**
     Show or update the HUD.
     
     - parameter title: The title in the HUD.
     - parameter message: The text in the HUD.
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
     */
    open static func showOrUpdateHUD(title: String, message: String, presentingView: UIView, completion: (() -> Void)?) {
        let duration = appearance.defaultDurationTime
        showHud(title: title, text: Array(arrayLiteral: message), icon: nil, duration: duration, presentingView: presentingView, completion: completion)
    }
    
    
    // MARK: API With LoadingIndicator
    
    /**
     Show or update the HUD.
    
     - parameter loadingIndicator: The type of loading indicator in the HUD.
     - parameter message: The text in the HUD.
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
    */
    open static func showOrUpdateHUD(loadingIndicator: LoadingIndicatorType, message: String, presentingView: UIView) {
        if loadingIndicator == .standard {
            showHud(text: Array(arrayLiteral: message), presentingView: presentingView, completion: nil)
        }
    }
    
    /**
     Show or update the HUD.
     
     - parameter loadingIndicator: The type of loading indicator in the HUD.
     - parameter funnyMessagesLanguage: The language of the funny messages.
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
     */
    open static func showOrUpdateHUD(loadingIndicator: LoadingIndicatorType, funnyMessagesLanguage: LanguageType, presentingView: UIView) {
        if loadingIndicator == .standard {
            showHud(presentingView: presentingView, funnyMessagesLanguage: funnyMessagesLanguage, completion: nil)
        }
    }
    
    /**
     Show or update the HUD.

     - parameter loadingIndicator: The type of loading indicator in the HUD.
     - parameter messages: A array of messages that will be displayed one by one.
     - parameter presentingView: The view that the HUD will be located in.
     - parameter completion: Will be trigger when the HUD is removed.
    */
    open static func showOrUpdateHUD(loadingIndicator: LoadingIndicatorType, messages: [String], presentingView: UIView) {
        if loadingIndicator == .standard {
           showHud(text: messages, presentingView: presentingView, completion: nil)
        }
    }

    // MARK: API Remove
    
    /**
     Removes the HUD.

     - parameter animated: If the remove action should be animated or not.
     - parameter presentingView: The view that the HUD is located in.
     - parameter completion: Will be trigger when the HUD is removed.
    */
    open static func removeHUD(animated: Bool, presentingView: UIView, completion: (() -> Void)?) {
        if let hudView = getHudView(presentingView: presentingView) {
            hudView.removeHud(animated: animated, onDone: { _ in
                completion?()
            })
        }
    }

    // MARK: - Private functions

    fileprivate static func showHud(title: String = "", text: [String] = [""], icon: UIImage? = nil, duration: Double = -1, presentingView: UIView, funnyMessagesLanguage: LanguageType? = nil, completion: (() -> Void)? = nil) {

        let hudView = createHudViewIfNeeded(presentingView: presentingView)

        if hudView.isActivityIndicatorSpinnning {

            // Hide HUD view, and call same function when it's done
            hudView.hideLoadingActivityIndicator(completion: { _ in
                showHud(text: text, icon: icon, duration: duration, presentingView: presentingView, completion: completion)
                return
            })
            return
        }
        
        let isFunnyMessages = funnyMessagesLanguage != nil
        let isMessages = text.count > 1
        hudView.isActiveTimer = isFunnyMessages || isMessages

        if isFunnyMessages {
            hudView.showFunnyMessages(funnyMessagesLanguage!)
        } else if isMessages {
            hudView.showMessages(text)
        } else if icon != nil {
            hudView.showMessage(title: nil, message: text.first, icon: icon, completion: nil)
        } else if title != "" {
            hudView.showMessage(title: title, message: text.first, icon: nil, completion: nil)
        }
        else {
            hudView.showLoadingActivityIndicator(text: text.first, completion: nil)
        }

        if duration > 0 {
            runWithDelay(duration, closure: { _ in

                hudView.removeHud(animated: true, onDone: completion)

            })
        }
    }

    fileprivate static func iconImage(imageName: String) -> UIImage? {

        let iconImage = UIImage(named: imageName, in: Bundle(for: APESuperHUD.self), compatibleWith: nil)

        return iconImage
    }

    static func createHudViewIfNeeded(presentingView: UIView) -> HudView {

        if let hudView = getHudView(presentingView: presentingView) {
            return hudView
        }

        let hudView = HudView.create()
        presentingView.addSubview(hudView)

        return hudView
    }

    fileprivate static func getHudView(presentingView: UIView) -> HudView? {

        for subview in presentingView.subviews {
            if let hudview = subview as? HudView {
                return hudview
            }

        }

        return nil
    }

}
