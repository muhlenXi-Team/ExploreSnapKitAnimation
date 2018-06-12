//
//  ViewController.swift
//  ExSnapKitAnimation
//
//  Created by muhlenXi on 2018/6/12.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var isShowDismissBtn = false
    
    lazy var dismissBtn: UIButton = {
        let dismiss = UIButton()
        dismiss.backgroundColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        dismiss.setTitleColor(UIColor.white, for: .normal)
        dismiss.setTitle("∧ 收起", for: .normal)
        dismiss.layer.cornerRadius = 4
        dismiss.clipsToBounds = true
        dismiss.titleLabel?.font = UIFont(name: "PingFang SC", size: 14)
        dismiss.addTarget(self, action: #selector(self.onClickDismissBtn(_:)), for: .touchUpInside)
        return dismiss
    }()
    
    lazy var tapBtn: UIButton = {
        let tap = UIButton()
        tap.setTitle("tap me", for: .normal)
        tap.layer.borderColor = UIColor.black.cgColor
        tap.layer.borderWidth = 0.5
        tap.setTitleColor(UIColor.black, for: .normal)
        tap.addTarget(self, action: #selector(self.onClickTapBtn(_:)), for: .touchUpInside)
        return tap
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Private method
    func setupSubviews() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(tapBtn)
        self.view.addSubview(dismissBtn)
        
        tapBtn.snp.makeConstraints { (maker) in
            maker.width.equalTo(80)
            maker.height.equalTo(25)
            maker.center.equalTo(self.view)
        }
        
        dismissBtn.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(tapBtn)
            maker.height.equalTo(28)
            maker.width.equalTo(0)
            maker.trailing.equalTo(tapBtn.snp.leading).offset(-16)
        }
    }
    
    func showDismissBtn() {
        self.dismissBtn.snp.updateConstraints { (maker) in
            maker.width.equalTo(64)
        }
        self.dismissBtn.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func hideDismissBtn(){
        self.dismissBtn.snp.updateConstraints { (maker) in
            maker.width.equalTo(0)
        }
        self.dismissBtn.setNeedsUpdateConstraints()
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func onClickTapBtn(_ sender: UIButton) {
        if self.isShowDismissBtn {
            self.hideDismissBtn()
        } else {
            self.showDismissBtn()
        }
        self.isShowDismissBtn = !self.isShowDismissBtn
    }
    
    @objc func onClickDismissBtn(_ sender: UIButton) {
        print("onClickDismissBtn")
    }
}

