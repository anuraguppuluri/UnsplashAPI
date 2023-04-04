//
//  USPhotoResultsViewController.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import UIKit

protocol USPhotoResultsProtocol: AnyObject {
    func segueToPhotoDisplay(item: Int)
    func reloadCollection()
}

class USPhotoResultsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, USPhotoResultsProtocol {
    @IBOutlet weak var photoCollection: UICollectionView!
    var vm = USPhotoResultsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        initView()
        initViewModel()
        //vm.addToDataSources(page: 1)
    }
    
    func initView() {
        photoCollection.delegate = self
        photoCollection.dataSource = self
    }
    
    func initViewModel() {
        vm.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        photoCollection.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: K.photoCellWidth, height: K.photoCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.photosDataSource?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return populateCell(item: indexPath.item, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        prefetchNextPage(item: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.segueWhenPressed(item: indexPath.item)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: — USPhotoResultsViewController Helper Methods

extension USPhotoResultsViewController {
    func populateCell(item: Int, indexPath: IndexPath) -> UICollectionViewCell {
        if vm.currentPage! < vm.totalPages! && indexPath.item == vm.photosDataSource!.count - 1 {
            let cell: USPhotoCollectionViewCell? = photoCollection.dequeueReusableCell(withReuseIdentifier: K.photoLoadingCellID, for: indexPath) as? USPhotoCollectionViewCell
            guard let cell = cell else {
                return UICollectionViewCell()
            }
            cell.photoResultsActivity.startAnimating()
            return cell
        } else {
            let cell: USPhotoCollectionViewCell? = photoCollection.dequeueReusableCell(withReuseIdentifier: K.photoCellID, for: indexPath) as? USPhotoCollectionViewCell
            guard let cell = cell else {
                return UICollectionViewCell()
            }
            cell.photoResultsImage.image = UIImage(named: "placeholder")
            print(vm.photoImagesDataSource?.count)
            if let photoImageData = vm.photoImagesDataSource?[item] {
                let photoImage = UIImage(data: photoImageData)
                cell.photoResultsImage.contentMode = UIView.ContentMode.scaleAspectFit
                cell.photoResultsImage.image = photoImage
            }
            photoCollection.reloadItems(at: [indexPath])
            return cell
        }
    }
    
    func prefetchNextPage(item: Int) {
        if vm.currentPage! <= (vm.totalPages! - 5) && item == (vm.photosDataSource!.count - 1 - (2 * 10)) {
            vm.currentPage = (vm.currentPage!) + 1
            vm.addToDataSources(page: vm.currentPage!)
        }
    }

    func segueToPhotoDisplay(item: Int) {
        let vc: USPhotoDisplayViewController? = storyboard?.instantiateViewController(withIdentifier: K.photoDisplayViewID) as? USPhotoDisplayViewController
        guard let vc = vc else {
            //print("VC not created!")
            return
        }
        //print("VC created!")
        vc.vm.currentPhoto = vm.photosDataSource?[item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func reloadCollection() {
        photoCollection.reloadData()
    }
}
