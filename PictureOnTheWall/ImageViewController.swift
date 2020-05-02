//
//  ImageViewController.swift
//  PictureOnTheWall
//
//  Created by ehsan sat on 4/30/20.
//  Copyright © 2020 ehsan sat. All rights reserved.
//

import UIKit
import Vision

class ImageViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    var imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cameraPressed(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        if let imageCI = CIImage(image: image) {
            
        }
    }
    
    func detectFace (image: CIImage) {
        let requestHandler = VNImageRequestHandler(ciImage: image, options: [:])
        let request = VNDetectFaceRectanglesRequest { (request, error) in
            let results = request.results as! [VNFaceObservation]
            results.first?.boundingBox
            
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
