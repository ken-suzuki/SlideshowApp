//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 鈴木 顕 on 2018/04/25.
//  Copyright © 2018年 ken.suzuki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var outImage: UIImageView!
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var sendImage:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outImage.image = UIImage(named: sendImage!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
