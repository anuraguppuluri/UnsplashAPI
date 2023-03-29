//
//  USPhotoSearchViewController.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/22/23.
//

import UIKit

protocol USPhotoSearchProtocol: AnyObject {
    func segueToPhotoResults()
}

class USPhotoSearchViewController: UIViewController, USPhotoSearchProtocol {
    var vm = USPhotoSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initViewModel()
    }

    func initViewModel() {
        vm.delegate = self
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        vm.segueWhenTapped()
    }
    
}

// MARK: — USPhotoSearchViewController Helper Methods

extension USPhotoSearchViewController {
    func segueToPhotoResults() {
        let vc: USPhotoResultsViewController? = storyboard?.instantiateViewController(withIdentifier: K.photoResultsViewID) as? USPhotoResultsViewController
        guard let vc = vc else {
            print("VC not created!")
            return
        }
        print("VC created!")
        //vc.vm.newsWebsite = vm.newsDataSource[row].url
        navigationController?.pushViewController(vc, animated: true)
    }
}
