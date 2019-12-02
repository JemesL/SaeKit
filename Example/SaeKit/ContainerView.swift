//
//  ContainerView.swift
//  SaeKit
//
//  Created by Jemesl on 2019/12/2.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class ContainerView: UIScrollView {
    
    var heightCon: Constraint?
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeConstraints()
    }
    
    init(content: UIView) {
        super.init(frame: .zero)
        makeConstraints()
        setContent(content)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContainerView {
    func setContent(_ view: UIView) {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.top.left.equalTo(0)
        }
        view.sae.observe(\UIView.bounds, options: .new) { [weak self] (view, change) in
            if let size = change.newValue?.size {
                self?.contentSize = size
                self?.heightCon?.update(offset: size.height)
            }
        }
    }
    
    func makeConstraints() {
        self.snp.makeConstraints { make in
            heightCon = make.height.equalTo(0).priority(.medium).constraint
        }
    }
}
