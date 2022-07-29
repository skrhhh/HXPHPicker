//
//  EditProcessingViewController.swift
//  TTS
//
//  Created by skrhhh on 2022/7/27.
//

import Foundation
import UIKit
class EditProcessingViewller: UIViewController {
    
    var progress: Int = 0 {
        didSet{
            processLabel.text = "\(progress)%"
        }
    }
    
    lazy var cancelButton : UIButton = {
        let but = UIButton()
        but.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        return but
    }()
    
    lazy var Video_ProcessingLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Video Processing…".localized
        label.font = UIFont.init(name: "PingFangSC-Semibold", size: 20)
        label.textColor = .white
        return label
    }()

    lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Please do not lock the screen or switch application.".localized
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var showView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var coverView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var processLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = .init(name: "PingFangSC-Semibold", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.title = "Processing".localized
        setupUI()
    }
    
    
}

extension EditProcessingViewller {
    func setupUI(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
        
        view.addSubview(Video_ProcessingLable)
        view.addSubview(hintLabel)
        view.addSubview(showView)
        showView.addSubview(coverView)
        showView.addSubview(processLabel)
        
//        Video_ProcessingLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 137).isActive = true
//        Video_ProcessingLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        Video_ProcessingLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        Video_ProcessingLable.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
        Video_ProcessingLable.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: 126, width: 200, height: 30)
        hintLabel.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: 169, width: 200, height: 40)
        showView.frame = CGRect(x: UIScreen.main.bounds.width/2 - 93, y: 244, width: 186, height: 324)
        coverView.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
        processLabel.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
//        Video_ProcessingLable.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(37)
//            make.centerX.equalToSuperview()
//            make.left.right.equalToSuperview().inset(93.5)
//        }
//
//        hintLabel.snp.makeConstraints { make in
//            make.top.equalTo(Video_ProcessingLable.snp.bottom).offset(13)
//            make.centerY.equalToSuperview()
//            make.left.equalTo(Video_ProcessingLable.snp.left)
//            make.right.equalTo(Video_ProcessingLable.snp.right)
//        }
//
//        showView.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.left.equalTo(Video_ProcessingLable.snp.left)
//            make.right.equalTo(Video_ProcessingLable.snp.right)
//            make.top.equalTo(hintLabel.snp.bottom).offset(35)
//            make.height.equalTo(showView.width*1.74)
//        }
    }
}
