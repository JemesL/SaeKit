//
//  StreamingOfHorMulLineWithCount.swift
//  SaeKit
//
//  Created by Jemesl on 2019/12/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 垂直布局
class StreamingOfHorMulLineWithCount: UIViewController {
    
    var bg = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StreamingOfHorMulLineWithCount"
        setupViews()
        setData()
    }
}

extension StreamingOfHorMulLineWithCount {
    func setData() {
        let list = (0..<10).map { _ in UIView.singleView() }
        // 水平换行且限定每行个数
        bg.sae.streaming(subs: list).horizontalMulWithCount(3).isFillVer.equalWidth.makeConstraints()
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

