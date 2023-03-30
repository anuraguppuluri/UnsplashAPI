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
        vm.segueOrDisplay(searchStr: queryText.text)
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
        vc.vm.query = queryText.text
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func displayAlert(alertMessage: String) {
        let alertController = UIAlertController(title: "ATTENTION", message: alertMessage, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAlertAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
