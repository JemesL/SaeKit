//
//  StreamingOfHor.swift
//  SaeKit
//
//  Created by Jemesl on 2019/12/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 垂直布局
class StreamingOfHor: UIViewController {
    
    var bg = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StreamingOfHor"
        setupViews()
        setData()
    }
}

extension StreamingOfHor {
    func setData() {
        let list = (0..<3).map { _ in UIView.singleView() }
        // 水平布局
        bg.sae.streaming(subs: list).horizontal.isFillHor.isFillVer.makeConstraints()
    }
    
    func setupViews() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
            bg.backgroundColor = UIColor.systemBackground
        } else {
            view.backgroundColor = .white
            bg.backgroundColor = .white
        }

        view.addSubview(bg)
        bg.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.centerY.equalToSuperview()
        }
    }
}

