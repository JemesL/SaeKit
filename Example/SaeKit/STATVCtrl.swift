//
//  STATVCtrl.swift
//  SaeKit
//
//  Created by Jemesl on 2019/11/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SaeKit

enum LabelStatus {
    case first
    case two
    case three
}

class STATVCtrl: UIViewController {
    
    var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "STATVCtrl"
        setupViews()
    }
}

extension STATVCtrl {
    
    func setupViews() {
        testLabel = UILabel()
        
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
            testLabel.textColor = UIColor.systemBackground
        } else {
            view.backgroundColor = .white
            testLabel.textColor = .black
        }
        
        
        testLabel.sae.setStatBlock(defaultValue: LabelStatus.first) { (label, e) in
            switch e {
            case .first:
                label.text = " 状态一 "
            case .two:
                label.text = "状态二"
            case .three:
                label.text = "状态三"
            }
        }
        view.addSubview(testLabel)
        
        testLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        testLabel.sae.setStat(e: LabelStatus.three)
    }
}

