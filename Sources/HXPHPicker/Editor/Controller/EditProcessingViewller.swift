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
    
    var exitClosure: (() -> Void)? = nil
    
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
    
    public lazy var filterView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(exportProgress(_:)), name: NSNotification.Name(rawValue: "exportProgress"), object: nil)
    }
    
    @objc func exportProgress(_ notification: Notification) {
        if let dic = notification.userInfo as? [String: Float], let progress = dic["progress"] as? Float {
            self.progress = Int(progress*100)
        }
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        exitClosure?()
    }
    
    deinit {
        print("EditProcessingViewller deinit")
        exitClosure?()
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
        showView.addSubview(filterView)
        showView.addSubview(processLabel)
        
        cancelButton.frame = CGRect(x: 24, y: 58, width: 25.46, height: 25.46)
        titleLabel.frame = CGRect(x:  UIScreen.main.bounds.width/2-50, y:  58, width: 100, height: 25)
        Video_ProcessingLable.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: 126, width: 200, height: 30)
        hintLabel.frame = CGRect(x: UIScreen.main.bounds.width/2 - 100, y: 169, width: 200, height: 40)
        showView.frame = CGRect(x: UIScreen.main.bounds.width/2 - 93, y: 244, width: 186, height: 324)
        coverView.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
        filterView.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
        processLabel.frame = CGRect(x: 0, y: 0, width: 186, height: 324)
        
    }
    
    @objc func onClickDismiss() {
        dismiss(animated: true)
    }
    
}
