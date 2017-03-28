//
//  HFLoginViewController.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/26/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFLoginViewController: HFGenericViewController {
    
    var selectedField:UITextField?
    
    //    Use this to refer to UIView
    internal var mainView: HFLoginView {
        return self.view as! HFLoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.loginViewDelegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        notificationsConfiguration()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Configure Notifications for keyboard
    private func notificationsConfiguration() {
        // Set observer for receive keyboard notifications
        NotificationCenter.default.addObserver(self, selector:#selector(HFLoginViewController.keyboardWasShown(_:)), name:NSNotification.Name(rawValue: "UIKeyboardDidShowNotification"), object:nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(HFLoginViewController.keyboardWillBeHidden(_:)), name:NSNotification.Name(rawValue: "UIKeyboardWillHideNotification"), object:nil)
        
        NotificationCenter.default.addObserver(self, selector:#selector(HFLoginViewController.userTappedOnField(_:)), name:NSNotification.Name(rawValue: "UITextFieldTextDidBeginEditingNotification"), object:nil)
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target:self, action:#selector(HFLoginViewController.hideKeyBoard))
        
        self.mainView.viewInsideScroll?.addGestureRecognizer(tapGesture)
    }
    
    func hideKeyBoard(){
        self.mainView.endEditing(true)
    }
    
    func userTappedOnField(_ txtSelected: Notification){
        if txtSelected.object is UITextField {
            selectedField = (txtSelected.object as! UITextField)
        }
    }
    
    //MARK: - View readjust actions
    func keyboardWasShown(_ notification: Notification) {
        
        let info:NSDictionary = notification.userInfo! as NSDictionary
        
        let keyboardSize:CGSize = ((info.object(forKey: UIKeyboardFrameBeginUserInfoKey) as AnyObject).cgRectValue.size)
        
        guard let fieldSelected = selectedField else { return }
        
        var txtFieldView:CGPoint = fieldSelected.frame.origin;
        
        let txtFieldViewHeight:CGFloat = fieldSelected.frame.size.height;
        
        guard let viewInsideScrollView = self.mainView.viewInsideScroll else { return }
        
        var visibleRect:CGRect = viewInsideScrollView.frame;
        
        visibleRect.size.height -= keyboardSize.height;
        
        txtFieldView.y = visibleRect.size.height
        
        if !visibleRect.contains(txtFieldView) {
            let scrollPoint:CGPoint = CGPoint(x: 0.0, y: txtFieldView.y - visibleRect.size.height + (txtFieldViewHeight * 1.5))
            
            guard let scrollView = self.mainView.scrollView else { return }
            
            scrollView.setContentOffset(scrollPoint, animated: true)
        }
        
    }
    
    func keyboardWillBeHidden(_ notification: Notification) {
        self.mainView.scrollView?.setContentOffset(CGPoint.zero, animated: true)
    }
    
}

extension HFLoginViewController: HFLoginViewProtocol{
 
    func performLogin() {
        
        if self.isValidEmail(textStr: self.mainView.txtEmailTextField.text!) &&
            self.isValidPassword(textStr: self.mainView.txtPasswordTextField.text!) {

            setLoginStatus(status: true)
            self.dismiss(animated: true, completion: nil)
        } else {
            self.present(self.mainView.showMissingTextFieldAlert(), animated: true, completion: nil)
        }
    }
    
}
