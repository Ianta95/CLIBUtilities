//
//  CLIBCustomElegantCell1View.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

class CLIBCustomElegantCell1View: UIView {
    // MARK: Components
    lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = title
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 24)
        return lbl
    }()
    
    lazy var imgIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        view.image = imgResource
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let btn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.backgroundColor = .clear
        return btn
    }()
    // MARK: Properties
    let title: String
    let imgResource: UIImage?
    let font: UIFont?
    var action: ( () -> ())?
    
    public init(title: String, imgResource: UIImage?, font: UIFont? = nil){
        self.title = title
        self.imgResource = imgResource
        self.font = font
        super.init(frame: .zero)
        prepareUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func prepareUI(){
        self.heightAnchor.constraint(equalToConstant: 36).isActive = true
        self.addSubview(imgIcon)
        self.imgIcon.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.imgIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.addSubview(titleLbl)
        titleLbl.leftAnchor.constraint(equalTo: self.imgIcon.rightAnchor, constant: 8).isActive = true
        titleLbl.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLbl.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.addSubview(btn)
        btn.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        btn.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        btn.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        btn.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        btn.addTarget(self, action: #selector(clickOption), for: .touchUpInside)
    }
    
    @objc func clickOption(){
        action?()
    }
}
