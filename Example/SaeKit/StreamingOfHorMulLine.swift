//
//  StreamingOfHorMulLine.swift
//  SaeKit
//
//  Created by Jemesl on 2019/12/1.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 垂直布局
class StreamingOfHorMulLine: UIViewController {
    
    var bg = UIView()
    var list: [UIView] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StreamingOfHorMulLine"
        setupViews()
        setData()
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//    }
    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        print(bg.bounds)
//        bg.subviews.forEach{ view in
//            view.snp.removeConstraints()
//        }
//        bg.sae.streaming(subs: list).horizontalMul.isFillHor.isFillVer.hasWidth.maskConstraints()

    }
}

extension StreamingOfHorMulLine {
    func setData() {
        list = (0..<10).map { _ -> UIView in
            let single = UIView.singleView()
            return single
        }
        self.view.layoutIfNeeded()
        // 水平换行
        bg.sae.streaming(subs: list).horizontalMul.isFillHor.isFillVer.hasWidth.makeConstraints()
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
            make.centerY.equalToSuperview()
        }
    }
}

