//
//  ViewController.swift
//  ImagePickerSample
//
//  Created by Rathna on 09/09/19.
//  Copyright © 2019 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageV: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imageV.layer.cornerRadius = imageV.frame.height / 2
        imageV.clipsToBounds = true
        imageV.contentMode = .scaleAspectFill
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func pickImageTap(_ sender: Any) {
        
        let AC = UIAlertController(title: "Choose Pic", message: "", preferredStyle: .actionSheet)
        
        let photoAction = UIAlertAction(title: "Camera", style: .default) { [weak self](action) in
            guard let strongSelf = self else { return }
            
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return}

            strongSelf.imagePicker.sourceType = .camera
            strongSelf.present(strongSelf.imagePicker, animated: true, completion: nil)
        }
        AC.addAction(photoAction)
        let LibraryAction = UIAlertAction(title: "Photos", style: .default) { [weak self](action) in
            guard let strongSelf = self else { return }
            guard UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) else { return}
            strongSelf.imagePicker.sourceType = .savedPhotosAlbum
            strongSelf.present(strongSelf.imagePicker, animated: true, completion: nil)

        }
        AC.addAction(LibraryAction)
        present(AC, animated: true, completion: nil)
    }
    


}

extension ViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        self.imageV.image = image
        dismiss(animated: true, completion: nil)
        
    }
    
  @objc  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

