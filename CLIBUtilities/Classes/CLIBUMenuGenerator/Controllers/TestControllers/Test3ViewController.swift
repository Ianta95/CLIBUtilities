//
//  Test3ViewController.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

class Test3ViewController: UIViewController {
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Texto de prueba 3"
        lbl.textAlignment = .center
        lbl.heightAnchor.constraint(equalToConstant: 32).isActive = true
        lbl.font = UIFont.systemFont(ofSize: 42)
        return lbl
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        prepareUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    private func prepareUI(){
        self.view.addSubview(lblTitle)
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        lblTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 42).isActive = true
    }
}
