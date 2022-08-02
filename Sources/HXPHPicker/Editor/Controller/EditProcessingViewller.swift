//
//  Constants.swift
//  TikTokDemo
//
//  Created by Suoge on 2022/7/22.
//


import Foundation
import UIKit

open class EditProcessingViewller: UIViewController {
    
    var progress: Int = 0 {
        didSet{
            processLabel.text = "\(progress)%"
        }
    }
    
    public lazy var cancelButton : UIButton = {
        let but = UIButton()
        but.setImage(#imageLiteral(resourceName: "close"), for: .normal)
        but.addTarget(self, action: #selector(onClickDismiss), for: .touchUpInside)
        return but
    }()
    
    public lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text =  "Processing"
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    public lazy var Video_ProcessingLable: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Video Processing..."
        label.font = UIFont.init(name: "PingFangSC-Semibold", size: 20)
        label.textColor = .white
        return label
    }()

    public lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Please do not lock the screen or exit."
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    public lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    public lazy var leftView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    public lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public lazy var rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public lazy var showView: UIView = {
        let view = UIView()
        return view
    }()
    
    public lazy var coverView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    public lazy var processLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.font = .init(name: "PingFangSC-Semibold", size: 32)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
    }
    
    
}

extension EditProcessingViewller {
    func setupUI(){
        view.addSubview(cancelButton)
        view.addSubview(titleLabel)
        view.addSubview(Video_ProcessingLable)
        view.addSubview(hintLabel)
        view.addSubview(showView)
        showView.addSubview(coverView)
        showView.addSubview(processLabel)
        showView.addSubview(topView)
        showView.addSubview(leftView)
        showView.addSubview(rightView)
        showView.addSubview(bottomView)
        
        cancelButton.frame = CGRect(x: 24, y: 58, width: 25.46, height: 25.46)
        titleLabel.frame = CGRect(x:  UIScreen.main.bounds.width/2-50, y:  58, width: 100, height: 25)
        Video_ProcessingLable.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: 126, width: 200, height: 30)
        hintLabel.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: 169, width: 200, height: 40)
        showView.frame = CGRect(x: UIScreen.main.bounds.width/2 - 93, y: 244, width: 186, height: 324)
        coverView.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
        processLabel.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
        topView.frame = CGRect(x: 0, y: 0, width: 186, height: 2)
        bottomView.frame = CGRect(x: 0, y: 0, width: 184, height: 2)
        rightView.frame = CGRect(x: 184, y: 0, width: 2, height:324)
        leftView.frame = CGRect(x: 0, y: 0, width: 2, height: 324)
        
//        Video_ProcessingLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 137).isActive = true
//        Video_ProcessingLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        Video_ProcessingLable.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        Video_ProcessingLable.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
       
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
    
    @objc func onClickDismiss() {
        dismiss(animated: true)
    }
    
}
