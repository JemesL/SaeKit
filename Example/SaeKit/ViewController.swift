//
//  ViewController.swift
//  SaeKit
//
//  Created by Jemesl on 11/10/2019.
//  Copyright (c) 2019 Jemesl. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    var tableview: UITableView!
    var cellConfigs = ["STAT - 对视图增加多状态管理",
                       "KVO - 更简洁的使用kvo,自动管理移除",
                       "UIStreaming - 对一个序列的视图进行快捷布局"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

extension ViewController {
    func setupViews() {
        tableview = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        tableview.frame = view.bounds
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableview.delegate = self
        tableview.dataSource = self
        view.addSubview(tableview)
    }
}

extension ViewController: UITableViewDataSource {
    
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

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(STATVCtrl(), animated: true)
        case 1:
            self.navigationController?.pushViewController(KVOVCtrl(), animated: true)
        case 2:
            self.navigationController?.pushViewController(UIStreamingVCtrl(), animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

