//
//  HFViewController.swift
//  HelloFreshTest
//
//  Created by Felipe Florencio Garcia on 3/24/17.
//  Copyright © 2017 Felipe Florencio Garcia. All rights reserved.
//

import UIKit

class HFViewController: UIViewController {

    fileprivate var listOfFoodRecipes = Array<HFHomeModel>()
    
//    Use this to refer to UIView
    internal var mainView: HFHomeView {
        return self.view as! HFHomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
    }

}

extension HFViewController: UITableViewDelegate, UITableViewDataSource {
    
    //    MARK: TableView Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 340
    }
    
    //    MARK: - TableView Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.listOfFoodRecipes.count != 0 ? self.listOfFoodRecipes.count : 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HFHomeTableViewCell.self), for: indexPath) as! HFHomeTableViewCell
        
        
        return foodCell
    }
    
        
    
}

