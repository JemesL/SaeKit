//
//  StreamingOfVer.swift
//  SaeKit
//
//  Created by Jemesl on 2019/12/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 垂直布局
class StreamingOfVer: UIViewController {
    
    var bg = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StreamingOfVer"
        setupViews()
        setData()
    }
}

extension StreamingOfVer {
    func setData() {
        let list = (0..<10).map { _ in UIView.singleView() }
        // 垂直布局
        bg.sae.streaming(subs: list).vertical.isFillHor.isFillVer.makeConstraints()
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
            make.left.right.equalTo(0)
            make.centerX.centerY.equalToSuperview()
        }
    }
}
