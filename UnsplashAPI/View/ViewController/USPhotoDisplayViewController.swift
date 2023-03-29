//
//  USPhotoDisplayViewController.swift
//  UnsplashAPI
//
//  Created by Anurag Uppuluri on 3/23/23.
//

import UIKit

class USPhotoDisplayViewController: UIViewController {
    @IBOutlet weak var photoDisplayImage: UIImageView!
    var vm = USPhotoDisplayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let photoURL = vm.currentPhoto?.urls?.regular {
            vm.getImageData(from: photoURL) { success, photoData, error in
                if success, let data = photoData {
                    let photoImage = UIImage(data: data)
                    DispatchQueue.main.async { [self] in
                        photoDisplayImage.contentMode = UIView.ContentMode.scaleAspectFit
                        photoDisplayImage.image = photoImage
                    }
                } else {
                    print(error!)
                }
            }
        }
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
