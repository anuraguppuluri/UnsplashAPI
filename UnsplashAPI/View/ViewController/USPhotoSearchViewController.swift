//
//  USPhotoSearchViewController.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/22/23.
//

import UIKit

protocol USPhotoSearchProtocol: AnyObject {
    func segueToPhotoResults()
    func displayAlert(alertMessage: String)
}

class USPhotoSearchViewController: UIViewController, USPhotoSearchProtocol {
    @IBOutlet weak var queryText: UITextField!
    @IBOutlet weak var orderBySegments: UISegmentedControl!
    @IBOutlet weak var orientationSegments: UISegmentedControl!
    var orderBySelected: String?
    var orientationSelected: String?
    var vm = USPhotoSearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initViewModel()
    }

    func initViewModel() {
        vm.delegate = self
    }
    
    @IBAction func orderByChanged(_ sender: Any) {
        orderBySelected = K.orderByOptions[orderBySegments.selectedSegmentIndex]
    }
    
    @IBAction func orientationChanged(_ sender: Any) {
        orientationSelected = K.orientationOptions[orientationSegments.selectedSegmentIndex]
    }
    
    @IBAction func searchTapped(_ sender: Any) {
        vm.params["query"] = queryText.text
        vm.params["orderBy"] = orderBySelected
        vm.params["orientation"] = orientationSelected
        vm.initDataSources()
    }
    
}

// MARK: — USPhotoSearchViewController Helper Methods

extension USPhotoSearchViewController {
    func segueToPhotoResults() {
        let vc: USPhotoResultsViewController? = storyboard?.instantiateViewController(withIdentifier: K.photoResultsViewID) as? USPhotoResultsViewController
        guard let vc = vc else {
            //print("VC not created!")
            return
        }
        //print("VC created!")
        vc.vm.params = vm.params
        vc.vm.photosDataSource = vm.photosDataSource
        vc.vm.photoImagesDataSource = vm.photoImagesDataSource
        vc.vm.currentPage = vm.currentPage
        vc.vm.totalPages = vm.totalPages
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func displayAlert(alertMessage: String) {
        let alertController = UIAlertController(title: "ATTENTION", message: alertMessage, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAlertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
