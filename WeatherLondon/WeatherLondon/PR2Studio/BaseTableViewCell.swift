//
//  BaseTableViewCell.swift
//  SkyScannerFlights
//
//  Created by Pablo Roca Rozas on 17/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    var didSetupConstraints: Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setupLoadView()
        self.contentView.setNeedsUpdateConstraints()
    }
    
    func setupLoadView() {
        fatalError("should be overwritten")
    }
    
    override func updateConstraints() {
        if !didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        
        self.setupExtraConstraints()
        
        super.updateConstraints()
    }
    
    func setupConstraints() {
        fatalError("should be overwritten")
    }
    
    func setupExtraConstraints() {
        
    }
    
}
