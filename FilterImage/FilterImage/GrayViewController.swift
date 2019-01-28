//
//  GrayViewController.swift
//  FilterImage
//
//  Created by J K on 2019/1/27.
//  Copyright © 2019 KimsStudio. All rights reserved.
//

import UIKit

class GrayViewController: UIViewController {

    var images: UIImage!
    
    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var setSlider: UISlider!
    
    @IBAction func setSlider(_ sender: UISlider) {
        let value = sender.value
        DispatchQueue.main.async {
            self.imageViews.image = self.grayImage(self.images!, CGFloat(value))
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let images = UIImage(named: "sw1")
        images = UIImage(named: "sw1")
        
        imageViews.contentMode = UIView.ContentMode.scaleAspectFit
        imageViews.layer.masksToBounds = true
        imageViews.image = grayImage(images!, 1)
        
        setSlider.minimumValue = 0.0
        setSlider.maximumValue = 1.0
        setSlider.value = 1.0
    }
    
    //配置灰度
    func grayImage(_ image: UIImage, _ value: CGFloat) -> UIImage {
        let imageWidth = Int(image.size.width)
        let imageHeight = Int(image.size.height)
        
        let spaceRef = CGColorSpaceCreateDeviceGray()
        let context = CGContext(data: nil, width: imageWidth, height: imageHeight, bitsPerComponent: 8, bytesPerRow: 0, space: spaceRef, bitmapInfo: CGBitmapInfo().rawValue)!
        let rect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        context.setAlpha(value)
        context.draw(image.cgImage!, in: rect)
       
        let img = UIImage(cgImage: context.makeImage()!)
        return img
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
}
