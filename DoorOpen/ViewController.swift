//
//  ViewController.swift
//  DoorOpen
//
//  Created by o.s on 2021/12/07.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    let animationView = AnimationView()
    var animationNo = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        staryAnimation()

        // タップジェスチャー作成
        animationView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
    }
    
    @objc
        func tapped() {
            changeDoor()
        }
    
    @IBAction func start(_ sender: Any) {
        staryAnimation()
    }
    
    @IBAction func up(_ sender: Any) {
        upAnimation()
    }
    
    @IBAction func slow(_ sender: Any) {
        slowAnimation()
    }
    
    
    @IBAction func pause(_ sender: Any) {
        pauseAnimation()
    }
    
    @IBAction func change(_ sender: Any) {
        //changeDoor()
        
    }
    
    //アニメーションをスタートさせるメソッド
        func staryAnimation() {
            
            let animation = Animation.named(String(animationNo))
     
            //アニメーションのサイズを決める
            animationView.frame = CGRect(x: 0,
                                         y: 20,
                                         width: view.frame.size.width,
                                         height: view.frame.size.height/1.5)
            
            /*アニメーション名を設定する。
            右辺のanimationにはAnimation.named("example")が代入されている*/
            animationView.animation = animation
     
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop//アニメをループさせるか
            animationView.play()//アニメを走らせる
            
            view.addSubview(animationView)//viewに乗っける
        }
     
    //スピードUP
    func upAnimation() {
        if animationView.animationSpeed < 50 {
            animationView.animationSpeed = animationView.animationSpeed + 1
            }
        }
    //スピードslow
    func slowAnimation() {
        if animationView.animationSpeed > 1 {
            animationView.animationSpeed = animationView.animationSpeed - 1
            }
            
        }

    //一時停止
    func pauseAnimation(){
        if animationView.isAnimationPlaying{
            animationView.pause()
        }else{
            animationView.play()
        }
    }
    
    //ドア変更
    func changeDoor(){
        animationView.removeFromSuperview()  //親のビューから排除する

        if animationNo == 11 {
            animationNo = 0
        }
        animationNo = animationNo + 1
        animationView.animation = Animation.named(String(animationNo))
        animationView.reloadImages()
        animationView.animationSpeed = 1
        animationView.contentMode = .scaleAspectFit
         animationView.loopMode = .loop//アニメをループさせるか
         animationView.play()//アニメを走らせる
        
        view.addSubview(animationView)//viewに乗っける
    }
    
    //一つ前のドアに変更
    func changePreDoor(){
        animationView.removeFromSuperview()  //親のビューから排除する

        if animationNo == 0 {
            animationNo = 12
        }
        animationNo = animationNo - 1
        animationView.animation = Animation.named(String(animationNo))
        animationView.reloadImages()
        animationView.animationSpeed = 1
        animationView.contentMode = .scaleAspectFit
         animationView.loopMode = .loop//アニメをループさせるか
         animationView.play()//アニメを走らせる
        
        view.addSubview(animationView)//viewに乗っける
    }
}

