//
//  ViewController.swift
//  FilterImage
//
//  Created by J K on 2019/1/26.
//  Copyright © 2019 KimsStudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func grayButton(_ sender: UIButton) {
    }
    
    @IBAction func colorButton(_ sender: UIButton) {
        
    }
    
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var grayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.7365469512, blue: 0.8971803688, alpha: 1)
        
        let screen = UIScreen.main.bounds
        
        grayButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: (15 / (480*320)) * screen.height*screen.width) //字体自动适配
        colorButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: (15 / (480*320)) * screen.height*screen.width) //字体自动适配
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }


}

