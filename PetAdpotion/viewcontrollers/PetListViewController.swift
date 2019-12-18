//
//  PetListViewController.swift
//  PetAdpotion
//
//  Created by Phyo Thiha on 06/10/2019.
//  Copyright © 2019 Phyo Thiha. All rights reserved.
//

import UIKit
import LGSideMenuController
import RxSwift
import RxCocoa
class PetListViewController: UIViewController {
    
    @IBOutlet weak var petsTableView: UITableView!
    @IBOutlet weak var ivUser: UIImageView!
    @IBOutlet weak var collectionViewCategory: UICollectionView!
    private let viewModel = PetListViewModel()
    let bag = DisposeBag()
    var mCategoryList:[CategoryVO] = []
    var mCats:[CatsVO] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ivUser.layer.cornerRadius = ivUser.frame.width/2
        ivUser.layer.borderWidth = 1
        ivUser.layer.borderColor = UIColor.lightGray.cgColor
        collectionViewCategory.delegate = self
        petsTableView.separatorStyle = .none
        
        //        petsTableView.delegate = self
        //        petsTableView.dataSource = self
        
        collectionViewCategory.register(UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: CategoryCollectionViewCell.self))
        petsTableView.register(UINib(nibName: String(describing: PetTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PetTableViewCell.self))
        
        initDataObservation()
        
        viewModel.requestData()
        
        
        
    }
    
    private func initDataObservation(){

        //MARK: RxCocoa
        viewModel.catsObs
            .observeOn(MainScheduler.instance)
            .bind(to: petsTableView.rx.items) { tableView, index, item in
                
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PetTableViewCell.self), for: IndexPath(row: index, section: 0)) as! PetTableViewCell
                cell.mData = item
                return cell
        }
        .disposed(by: bag)
        
        
        
        Observable
            .zip(petsTableView.rx.itemSelected, petsTableView.rx.modelSelected(CatsVO.self))
            .bind { indexPath, model in
                self.petsTableView.deselectRow(at: indexPath, animated: true)
                print("Selected " + model.type + " at \(indexPath)")
        }
        .disposed(by: bag)
        
        viewModel
            .dataObs
            .observeOn(MainScheduler.instance)
            .bind(to: collectionViewCategory.rx.items){ collectionView , index, item in
                
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: IndexPath(row: index, section: 0)) as! CategoryCollectionViewCell
                return cell
        }.disposed(by: bag)
        
        Observable
            .zip(collectionViewCategory.rx.itemSelected, collectionViewCategory.rx.modelSelected(CategoryVO.self))
            .bind { indexPath, model in
                self.petsTableView.deselectRow(at: indexPath, animated: true)
                print("Selected " + model.name + " at \(indexPath)")
        }
        .disposed(by: bag)
    }
    
    func bindCategory(category:[CategoryVO]){
        
        self.mCategoryList = category
        self.collectionViewCategory.reloadData()
    }
    
    func bindCats(cats:[CatsVO]){
        
        self.mCats = cats
        self.petsTableView.reloadData()
    }
    
    @IBAction func onClickMenu(_ sender: Any) {
        
        let vc =  (UIApplication.shared.keyWindow!.rootViewController) as! LGSideMenuController
        vc.showLeftViewAnimated()
    }
    
    
}


extension PetListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width/3 - 50, height: 100)
    }
}
