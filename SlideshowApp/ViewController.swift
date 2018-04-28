//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 鈴木 顕 on 2018/04/25.
//  Copyright © 2018年 ken.suzuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let imageNames = [
        "DSC_0202.jpg",
        "DSC_0263.jpg",
        "kazusakawama.jpg"
    ]
    var index = 0
    
    var timer: Timer!

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var autoNext: UIButton!
    @IBAction func onNext(_ sender: Any) {
        
        // 表示している画像の番号を1増やす
        index += 1
        
        if index > 2 {
            index = 0
        }
        
        // 表示している画像の番号を元に画像を表示する
        imageView.image = UIImage(named: imageNames[index])
        
    }
    
    @IBOutlet weak var autoBack: UIButton!
    @IBAction func onBackimage(_ sender: Any) {
        
        // 表示している画像の番号を1減らす
        index -= 1
        
        if index < 0 {
            index = 2
        }
        
        // 表示している画像の番号を元に画像を表示する
        imageView.image = UIImage(named: imageNames[index])
        
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBAction func playStop(_ sender: Any) {
        
        // タイマーの作成、開始
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            autoNext.isEnabled = false
            autoBack.isEnabled = false
            
            playButton.setTitle("停止", for: .normal)
        }
        else {

            // タイマーを停止する
            timer.invalidate()
            timer = nil
            
            autoNext.isEnabled = true
            autoBack.isEnabled = true
            
            playButton.setTitle("再生", for: .normal)
            
        }
        
    }
    
    // selector: #selector(updatetimer) で指定された関数
    // timeInterval: 2.0, repeats: true で指定された通り、2.0秒毎に呼び出され続ける
    @objc func updateTimer(timer: Timer) {
        // 表示している画像の番号を1増やす
        index += 1
        
        if index > 2 {
            index = 0
        }
        
        // 表示している画像の番号を元に画像を表示する
        imageView.image = UIImage(named: imageNames[index])
    }

    // セグエを使用して画面を遷移
    @IBAction func tapImage(_ sender: Any) {
  
  // nil かどうかのチェックを行う
  if self.timer != nil {
        
        // タイマーを停止する
        timer.invalidate()
        timer = nil
        
        autoNext.isEnabled = true
        autoBack.isEnabled = true
        
        playButton.setTitle("再生", for: .normal)

        }
        
        self.performSegue(withIdentifier: "movewind", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // バンドルした画像ファイルを読み込み
        let image = UIImage(named: imageNames[index])
        
        // Image Viewに画像を設定
        imageView.image = image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx値を文字列として代入して渡す
        resultViewController.sendImage = imageNames[index]
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

