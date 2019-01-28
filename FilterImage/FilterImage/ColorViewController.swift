//
//  ColorViewController.swift
//  FilterImage
//
//  Created by J K on 2019/1/28.
//  Copyright © 2019 KimsStudio. All rights reserved.
//

import UIKit
import CoreImage

class ColorViewController: UIViewController {

    var images: UIImage!
    
    @IBOutlet weak var imageViews: UIImageView!
    @IBOutlet weak var setSlider: UISlider!
    
    @IBAction func setSlider(_ sender: UISlider) {
        self.imageViews.image = self.colorFunc(self.images, CGFloat(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        images = UIImage(named: "sw1")
        imageViews.contentMode = UIView.ContentMode.scaleAspectFit
        imageViews.layer.masksToBounds = true
        imageViews.image = colorFunc(images, 1.0)
        
        
        setSlider.minimumValue = 0.0
        setSlider.maximumValue = 1.0
        setSlider.value = 1.0
    }
    
    //配置单色调
    func colorFunc(_ image: UIImage, _ value: CGFloat) -> UIImage {
        let ciColor = CIColor(red: 0.5, green: 0.5, blue: 0.7)
        let ciImage = CIImage(cgImage: image.cgImage!)
        let fileter = CIFilter(name: "CIColorMonochrome")
        fileter?.setValue(ciColor, forKey: kCIInputColorKey)
        fileter?.setValue(ciImage, forKey: kCIInputImageKey)
        fileter?.setValue(value, forKey: kCIInputIntensityKey)
        let img = fileter?.outputImage
        let returnImage = UIImage(ciImage: img!)

        return returnImage
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
