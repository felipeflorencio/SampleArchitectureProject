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
    fileprivate let requestManager = HFHomeManager()

    fileprivate var hudController: HFHUDLoading?

    
//    Use this to refer to UIView
    internal var mainView: HFHomeView {
        return self.view as! HFHomeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hudController = HFHUDLoading(viewToShowLoading: self.mainView)

        self.mainView.tableView.delegate = self
        self.mainView.tableView.dataSource = self
        
        requestManager.requestHomeData { (listOfData, errorMsg) in
            self.hudController?.stopLoading()
            
            if errorMsg == nil {
                guard let dataResponse = listOfData else { return }
                self.listOfFoodRecipes = dataResponse
                self.mainView.tableView.reloadData()
            } else {
                self.mainView.failedInMakeRequest(controller: self)
            }
            
        }
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
        
        // We do this here, because first request is made before the view was
        // full loaded, so avoiding problems we call here that we have sure
        if self.listOfFoodRecipes.count == 0 {
            self.hudController?.showLoading()
        }
        
        return self.listOfFoodRecipes.count != 0 ? self.listOfFoodRecipes.count : 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let foodCell = tableView.dequeueReusableCell(withIdentifier: String(describing: HFHomeTableViewCell.self), for: indexPath) as! HFHomeTableViewCell
        
        // This is for security reason, when we have like infinite list 
        // sometimes can happen out of inbox, this is just precaution
        if self.listOfFoodRecipes.indices.contains(indexPath.row) {
            foodCell.homeViewCellDelegate = self
            foodCell.fillFoodCellWithData(data: self.listOfFoodRecipes[indexPath.row], index: indexPath.row)
        }
        
        return foodCell
    }
    
}

extension HFViewController: HFHomeTableViewCellProtocol {
    func selectedFavoriteFood(item positionItem: Int, status favoritedStatus: Bool) {
        if self.listOfFoodRecipes.indices.contains(positionItem) {
            var temporaryObjectReference = self.listOfFoodRecipes[positionItem]
            temporaryObjectReference.userFavorited = favoritedStatus
            self.listOfFoodRecipes[positionItem] = temporaryObjectReference
        }
    }
}

