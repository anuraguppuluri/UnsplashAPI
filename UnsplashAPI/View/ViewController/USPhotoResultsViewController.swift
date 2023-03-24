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
        vm.loadDataSource()
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
        return vm.photosDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if viewModel.currentPage < viewModel.totalPages && indexPath.item == viewModel.currentPhotos!.count - 1 {
        //if viewModel.currentPage < viewModel.totalPages && indexPath.row == viewModel.currentPhotos!.count - 1 {
            let cell: PhotoCollectionViewCell? = photoResultsCollection.dequeueReusableCell(withReuseIdentifier: "loadingCell", for: indexPath) as? PhotoCollectionViewCell
            
            cell?.photoIndicator.startAnimating()
            
            guard let cell = cell else {
                return UICollectionViewCell()
            }
            return cell
        } else {
            let cell: PhotoCollectionViewCell? = photoResultsCollection.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCollectionViewCell
            
            cell?.photoView.image = UIImage(named: "placeholder") // set placeholder image first
            
            guard let id = viewModel.currentPhotos?[indexPath.item].id else {return cell!}
            
            if let existingImage = photoImageCache.object(forKey: NSString(string: String(id))) {
                cell?.photoView.image = existingImage
            }
            
            //else
            /*else*/ if let imageURL = viewModel.currentPhotos?[indexPath.item].src?.small {
                cell?.photoView.downloadImageFrom(link: imageURL, contentMode: UIView.ContentMode.scaleAspectFit, isVideo: false, cacheID: id)
            }
            
            if viewModel.db.checkPhoto(id: Int64(id)) {
                cell?.backgroundColor = .green
            } else {
                cell?.backgroundColor = nil
            }
            
            collectionView.reloadItems(at: [indexPath])
            
            return cell!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return populateCell(row: indexPath.row)
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
    func populateCell(row: Int) -> UITableViewCell {
        let cell: SDNewsTableViewCell? = newsTable.dequeueReusableCell(withIdentifier: K.newsCellID) as? SDNewsTableViewCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        if let title = vm.newsDataSource[row].title {
            cell.titleLabel.text = title
        }
        if let description = vm.newsDataSource[row].description {
            cell.descriptionLabel.text = description
        }
        cell.viewStoryButton.tag = row
        return cell
    }
    
    func segueToPhotoDisplay(item: Int) {
        let vc: USPhotoDisplayViewController? = storyboard?.instantiateViewController(withIdentifier: K.photoDisplayViewID) as? USPhotoDisplayViewController
        guard let vc = vc else {
            print("VC not created!")
            return
        }
        print("VC created!")
        vc.newsWebsite = vm.newsDataSource[item].url
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func reloadCollection() {
        photoCollection.reloadData()
    }
}
