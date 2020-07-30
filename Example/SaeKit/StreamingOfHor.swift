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
    var bg2 = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "StreamingOfHor"
        setupViews()
        setData()
        setData2()
    }
}

extension StreamingOfHor {
    func setData() {
        let list = (0..<3).map { _ in UIView.singleView() }
        // 水平布局
        bg.sae.streaming(subs: list).horizontal.isFillHor.isFillVer.makeConstraints()
    }
    
    func setData2() {
        var list: [UIView] = []
        for index in 0..<4 {
            let single = UIView.singleView()
            if index != 0 {
                single.width = 66
                single.tag = 666
            }
            list.append(single)
        }
        bg2.sae.streaming(subs: list).horizontal.hasWidth(withTag: 666).isFillHor.isFillVer.makeConstraints()
    }
    
    func setupViews() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = UIColor.systemBackground
            bg.backgroundColor = UIColor.systemBackground
        } else {
            view.backgroundColor = .white
            bg.backgroundColor = .white
        }

        let container = ContainerView(content: bg)
        view.addSubview(container)
        container.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.height.equalTo(100)
        }
        
        view.addSubview(bg2)
        bg2.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.top.equalTo(container.snp.bottom).offset(20)
        }
//        
//        view.addSubview(bg)
//        bg.snp.makeConstraints { make in
//            make.left.equalTo(0)
//            make.centerY.equalToSuperview()
//        }
        
        
    }
}

