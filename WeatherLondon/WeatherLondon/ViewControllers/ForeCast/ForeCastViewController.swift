//
//  ForeCastViewController.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 25/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit
import PureLayout
import Kingfisher

class ForeCastViewController: BaseViewController {

    //MARK: - Properties
    var viewModel: ForeCastViewModel!

    private lazy var tableView: UITableView = {
        let tableView = UITableView(forAutoLayout: ())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerCellClass(ofType: ForeCastCell.self)
        tableView.registerHeaderFooterClass(ofType: ForeCastSectionHeaderView.self)
        tableView.tableFooterView = UIView()
        tableView.sectionHeaderHeight = ForeCastSectionHeaderView.Layout.headerHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    
    //MARK: - Init
    
    init(viewModel: ForeCastViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.bindViewcontroller(viewcontroller: self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleLabel.text = viewModel.screenTitle
        
        // Register to receive notification
        NotificationCenter.default.addObserver(self, selector: #selector(ForeCastViewController.showSlowInterNet), name: Notification.Name(rawValue: PR2NetworkingNotifications.slowInternet), object: nil)

        refreshData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: PR2NetworkingNotifications.slowInternet), object: nil)
    }
    
    override func setupLoadView() {
        view.addSubview(tableView)
        
        super.setupLoadView()
    }

    override func setupConstraints() {
        tableView.autoPinEdgesToSuperviewEdges()
        
        super.setupConstraints()
    }

    private func refreshData() {
        viewModel.readData {[unowned self] (success) in
            self.tableView.reloadData()
        }
    }
    
}

extension ForeCastViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ForeCastCell.self, for: indexPath)
        let row = viewModel.row(at: indexPath)
        
        cell.imgIcon.kf.indicatorType = .activity
        let imgURL = APIConstants.image+row.icon+".png"
        let resourceOut = ImageResource(downloadURL: URL(string: imgURL)!, cacheKey: row.icon)
        cell.imgIcon.kf.setImage(with: resourceOut)
        
        cell.configure(viewModel: row)
        return cell
    }
    
}

extension ForeCastViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(ofType: ForeCastCell.self, for: indexPath)
        cell.imgIcon.kf.cancelDownloadTask()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(ofType: ForeCastSectionHeaderView.self)
        header.viewModel = viewModel.headerViewModel(section: section)
        return header
    }
    
}

