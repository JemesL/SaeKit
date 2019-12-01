//
//  KVOVCtrl.swift
//  SaeKit
//
//  Created by Jemesl on 2019/11/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class KVOVCtrl: UIViewController {
    
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "KVOVCtrl"
        setupViews()
        setupConstraints()
    }
    deinit {
        timer.invalidate()
    }
}

extension KVOVCtrl {
    
    func setupViews() {
        let count = UILabel()
        
        let testLabel = UILabel()
        testLabel.numberOfLines = 0
        testLabel.textColor = UIColor.black
        testLabel.text = "1231231"
        
        view.addSubview(testLabel)
        view.addSubview(count)
                
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
            testLabel.textColor = UIColor.label
            timer = Timer(timeInterval: 2, repeats: true, block: { (timer) in
                testLabel.text = "\(Double.random(in: 0..<9999999999))"
            })
            RunLoop.main.add(timer!, forMode: RunLoop.Mode.common)
        } else {
            // Fallback on earlier versions
        }
        
        testLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        count.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(testLabel.snp.top).offset(-20)
        }
    }
    
    func setupConstraints() {
    }
}


