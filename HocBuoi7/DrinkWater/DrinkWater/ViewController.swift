//
//  ViewController.swift
//  DrinkWater
//
//  Created by Toan-tech on 10/26/19.
//  Copyright © 2019 Toan-tech. All rights reserved.
//

import UIKit
//thêm thư viện AVFoundation để làm việc với âm thanh
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var countLabel: UILabel!
    
    
    @IBOutlet weak var waterView: UIView!
    
    // khai báo biến timer kiểu Timer
    var timer: Timer!
    
    //khai báo biến n
    var n = 50
    
    // khai báo biến đếm
    var count = 0
    
    //khai báo biến sound
    var soundPlayer: AVAudioPlayer?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
        //nếu repeat là true thì hàm runloop được lặp lại, nếu repeat là false thì hàm runloop chỉ được gọi 1 lần đầu tiên.
//đơn vị của timeInterval là giây. Cứ 1 giây thì hàm runloop trong selector lặp lại 1 lần.
        countLabel.text = String(n)
        count = n
        playSound()
    }

//hàm kế thừa objc, phải có @objc ở trước từ khoá khai báo hàm
    @objc func runTimer (){
     print("runloop")
        count -= 1
        countLabel.text = String(count)
        if count < 1 {
            timer.invalidate()
            soundPlayer?.pause() //khi count < 1 thì sẽ dừng âm thanh lại
        }
        waterView.frame = CGRect(x: 0, y: waterView.frame.origin.y + waterView.frame.size.height/CGFloat(n)
            , width: waterView.frame.size.width, height: waterView.frame.size.height)
    }
    func playSound () {
        let path = Bundle.main.path(forResource: "bubblewater.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            soundPlayer?.play()
            //đặt numberOfLoops = -1 để nó chạy lại khi chạy hết
            soundPlayer?.numberOfLoops = -1
        } catch {
            print("lỗi")
        }
    }
}

