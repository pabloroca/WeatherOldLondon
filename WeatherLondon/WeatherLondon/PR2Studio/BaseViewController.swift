//
//  BaseViewController.swift
//  SkyScannerFlights
//
//  Created by Pablo Roca Rozas on 15/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit
import PureLayout

class BaseViewController: UIViewController {
 
    // MARK: - properties

    var shouldShowViewWaiting: Bool = false {
        didSet {
            shouldShowViewWaiting ? showViewWaiting() : hideViewWaiting()
        }
    }
    
    private(set) var didSetupConstraints: Bool = false

    private var hidesBackButton: Bool = false {
        didSet {
            self.navigationItem.setHidesBackButton(hidesBackButton, animated: false)
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
    // MARK: - Views
    
    lazy var titleLabel: UILabel = {
        var label = UILabel(forAutoLayout: ())
        label.textAlignment = .center
        label.numberOfLines = 2
        label.minimumScaleFactor = 0.7
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorMain
        label.backgroundColor = UIColor.clear
        self.navigationItem.titleView = label
        return label
    }()
    
    private lazy var viewWaiting: UIView = {
        let view = UIView(forAutoLayout: ())
        view.backgroundColor = UIColor.white
        view.isHidden = true
        return view
    }()
    
    private lazy var lblWaiting: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.textColor = UIColor.pr2ColorMain
        label.font = UIFont.pr2FontHeader()
        label.textAlignment = .center
        label.text = NSLocalizedString("loadingdata", comment: "")
        return label
    }()
    
    private lazy var waitingIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(forAutoLayout: ())
        activityIndicator.activityIndicatorViewStyle = .gray
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()
    }
    
    // MARK: - Constraints
    
    override func updateViewConstraints() {
        if !didSetupConstraints {
            titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
            setupConstraints()
            didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = UIColor.white
        
        setupLoadView()
        
        view.setNeedsUpdateConstraints()
    }
    
    func setupLoadView() {
        view.addSubview(viewWaiting)
        viewWaiting.addSubview(lblWaiting)
        viewWaiting.addSubview(waitingIndicator)
        
        view.bringSubview(toFront: viewWaiting)
    }
    
    func setupConstraints() {
        viewWaiting.autoPinEdgesToSuperviewEdges()
        
        lblWaiting.autoPinEdge(toSuperviewEdge: .left)
        lblWaiting.autoPinEdge(toSuperviewEdge: .right)
        lblWaiting.autoPinEdge(.bottom, to: .top, of: waitingIndicator, withOffset: -Constants.kMarginBig)
        
        waitingIndicator.autoAlignAxis(toSuperviewAxis: .horizontal)
        waitingIndicator.autoAlignAxis(toSuperviewAxis: .vertical)
    }
    
    func setupTitle() -> String {
        return self.title ?? ""
    }
    
    // MARK: - Setup
    
    func setupNavigationBar() {
        titleLabel.text = setupTitle()
        
        showBackButton(true)
    }
    
    func showBackButton(_ show: Bool) {
        if show {
            let backButton = UIBarButtonItem(image: UIImage(named: "back_icon"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(BaseViewController.goBack))
            
            self.navigationItem.leftBarButtonItem = backButton
        } else {
            self.navigationItem.leftBarButtonItem = nil
            self.hidesBackButton = true
        }
    }
    
    func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Custom methods
    
    private func showViewWaiting() {
        viewWaiting.isHidden = false
        waitingIndicator.startAnimating()
    }
    
    private func hideViewWaiting() {
        lblWaiting.text = NSLocalizedString("loadingdata", comment: "")
        waitingIndicator.stopAnimating()
        viewWaiting.isHidden = true
    }

    @objc func showSlowInterNet() {
        lblWaiting.text = NSLocalizedString("slowinternet", comment: "")
        showViewWaiting()
    }
}
