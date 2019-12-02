//
//  UIStreamingVCtrl.swift
//  SaeKit
//
//  Created by Jemesl on 2019/11/11.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class UIStreamingVCtrl: UIViewController {
    
    var tableview: UITableView!
    var cellConfigs = ["垂直布局",
                       "水平布局",
                       "水平换行布局",
                       "水平换行且限定每行个数布局"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "UIStreamingVCtrl"
        setupViews()
        setupConstraints()
    }
}

extension UIStreamingVCtrl {
    func setData() {
    }
    
    func setupViews() {
        tableview = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableview.frame = view.bounds
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
    }
    
    func setupConstraints() {
    }
}

extension UIStreamingVCtrl: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellConfigs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") {
            cell.textLabel?.text = cellConfigs[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.isUserInteractionEnabled = false
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 1
    }
}

extension UIStreamingVCtrl: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(StreamingOfVer(), animated: true)
        case 1:
            self.navigationController?.pushViewController(StreamingOfHor(), animated: true)
        case 2:
            self.navigationController?.pushViewController(StreamingOfHorMulLine(), animated: true)
        case 3:
            self.navigationController?.pushViewController(StreamingOfHorMulLineWithCount(), animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

}

extension UIView {
    static func singleView() -> UIView {
        let single = UIView()
        single.layer.borderWidth = 0.5
        single.layer.borderColor = UIColor.lightGray.cgColor
        

        let icon = UIImageView()
        icon.contentMode = .scaleAspectFill
        icon.image = UIImage.randomImg()
        let name = UILabel()
        name.text = String.randomTitle()
        
        single.addSubview(icon)
        single.addSubview(name)
        
        if #available(iOS 13.0, *) {
            single.backgroundColor = UIColor.systemBackground
            name.textColor = UIColor.label
        } else {
            single.backgroundColor = .white
        }
        single.width = (name.text?.getLabelWidth(font: (name.font)!, height: 0) ?? 0.0) + 91.0
        icon.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(20)
            make.bottom.equalTo(-10)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        name.snp.makeConstraints { make in
            make.left.equalTo(icon.snp.right).offset(10)
            make.right.equalTo(-20)
            make.centerY.equalTo(icon)
        }
        return single
    }
    
    static func label() -> UILabel {
        let name = UILabel()
        name.layer.borderWidth = 0.5
        name.layer.borderColor = UIColor.lightGray.cgColor
        name.text = String.randomTitle()
        name.textAlignment = .center
        if #available(iOS 13.0, *) {
            name.textColor = UIColor.label
        } else {
        }
        name.width = (name.text?.getLabelWidth(font: (name.font)!, height: 0) ?? 0.0) + 1 + 16
        return name
    }
    
    var width: CGFloat {
        get {
            return self.bounds.size.width
        }
        set(width) {
            self.frame.size = CGSize(width: width, height: self.frame.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.bounds.size.height
        }
        set(height) {
            self.frame.size = CGSize(width: self.frame.width, height: height)
        }
    }
}

extension UIImage {
    static func randomImg() -> UIImage? {
        let index = Int.random(in: 1...12)
        return UIImage(named: "headimage\(index)")
    }
}

extension String {
    static func randomTitle() -> String {
        return [
            "Alexia 亚莉克希亚",
            "Alice 爱丽丝",
            "Alma 爱玛",
            "Alva 阿尔娃",
            "Amanda 阿曼达",
            "Amelia 阿蜜莉雅",
            "Amy 艾咪",
            "Anastasia 安娜塔西雅",
            "Andrea 安德莉亚",
            "Angela 安琪拉",
            "Ann 安妮"
        ].randomElement() ?? ""
    }
    
    func getLabelWidth(font: UIFont, height: CGFloat) -> CGFloat {
        
        let labelText: NSString = self as NSString
        let size = CGSize(width: 900, height: height)
        let dic = NSDictionary(object: font, forKey: NSAttributedString.Key.font as NSCopying)
        let strSize = labelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [NSAttributedString.Key: Any], context: nil).size
        return strSize.width
    }
}
