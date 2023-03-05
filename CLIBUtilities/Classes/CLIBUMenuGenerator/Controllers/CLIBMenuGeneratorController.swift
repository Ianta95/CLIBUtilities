//
//  CLIBMenuGeneratorController.swift
//  CLIBUtilities
//
//  Created by Ian Barragan Preciado on 04/03/23.
//

import UIKit

public class CLIBMenuGeneratorController: UIViewController {
    // MARK: Components
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var shadowContainerView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.alpha = 0.7
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var menuView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var stackMenuView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 12
        return stack
    }()
    var scrollMenuView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    var containerScrollMenu: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var titleLabl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 24)
        lbl.text = "MENU"
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var imgMenuView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = secondaryColor
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    // MARK: Override Properties
    var titleMenu: NSMutableAttributedString = NSMutableAttributedString() {
        didSet {
            self.titleLabl.attributedText = titleMenu
        }
    }
    var imgResource: String = "" {
        didSet {
            
        }
    }
    var primaryColor: UIColor = .black {
        didSet {
            self.view.backgroundColor = primaryColor
        }
    }
    var secondaryColor: UIColor = .white {
        didSet {
            self.imgMenuView.backgroundColor = secondaryColor
            for line in arrayOfLines {
                line.backgroundColor = secondaryColor
            }
        }
    }
    
    // MARK: Properties
    internal var viewModel: CLIBMenuViewModel
    internal var arrayOfLines: [UIView] = []
    
    // MARK: Overrides
    public init(data: CLIBMenuGeneratorController.Model){
        self.viewModel = CLIBMenuViewModel(viewControllerOptions: data.options, bottomOptions: data.bottomOptions, configs: data.configs)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        self.prepareUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.applyConfigurations(menu: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.imgMenuView.layer.cornerRadius = 18
        self.imgMenuView.clipsToBounds = true
    }
    
    // MARK: Prepare functions
    private func prepareUI(){
        self.viewModel.prepareViewController(menu: self, startIndex: 0)
        testAnimations()
    }
    
    private func testAnimations() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
//            self.menuViewAnimateEnter()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
//                self.menuViewAnimateExit()
//            })
//        })
    }
}
