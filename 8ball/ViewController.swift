//
//  ViewController.swift
//  8ball
//
//  Created by Bogdan Mishura on 9/4/19.
//  Copyright © 2019 Bogdan Mishura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    
    let ballView: UIImageView = {
        let image = UIImage(named: "ball")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let answerLable = UILabel()
    
    lazy var animator = UIDynamicAnimator(referenceView: view)
    
    lazy var ballBehavior = BallBehavior(in: animator)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ballView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        view.addSubview(ballView)
        
        answerLable.frame = CGRect(x: 0, y: 0, width: 60, height: 50)
        answerLable.numberOfLines = 0
        answerLable.text = "answer"
        answerLable.textColor = .white
        
        ballView.addSubview(answerLable)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        answerLable.center = ballView.center
        answerLable.center.y = ballView.center.y - 20
        ballView.center = view.center


    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        ballBehavior.addItem(ballView)
        timer = Timer.scheduledTimer(withTimeInterval: 7.0, repeats: false, block: { (timer) in
            
        })
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 3.0, delay: 2.0, options: [.allowUserInteraction], animations: {
            self.ballView.center.y = self.view.center.y - 50
        }) { (position) in
            if position == .end {
                self.ballBehavior.removeItem(self.ballView)
            }
        }
        
    }

}


