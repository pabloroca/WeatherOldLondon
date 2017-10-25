//
//  ForeCastCell.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 25/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit
import PureLayout

class ForeCastCell: BaseTableViewCell {
    
    static let designatedHeight: CGFloat = 40

    // MARK: - Views

    private let lblHour: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorMain
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    let imgIcon: UIImageView = {
        let imageView = UIImageView(forAutoLayout: ())
        return imageView
    }()
    
    private let lblWeatherType: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorMain
        label.backgroundColor = UIColor.clear
        return label
    }()

    private let lblTemp: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorMain
        label.backgroundColor = UIColor.clear
        return label
    }()
    
    override func setupLoadView() {
        
        contentView.addSubview(lblHour)
        contentView.addSubview(imgIcon)
        contentView.addSubview(lblWeatherType)
        contentView.addSubview(lblTemp)

        contentView.backgroundColor = UIColor.pr2ColorLightGrey
    }
    
    override func setupConstraints() {
        lblHour.autoPinEdge(toSuperviewEdge: .left, withInset: 7*Constants.kMarginNormal)
        lblHour.autoAlignAxis(toSuperviewAxis: .horizontal)
        lblHour.autoSetDimension(.width, toSize: 50.0)
        
        imgIcon.autoPinEdge(.left, to: .right, of: lblHour, withOffset: Constants.kMarginNormal)
        imgIcon.autoAlignAxis(toSuperviewAxis: .horizontal)

        lblWeatherType.autoPinEdge(.left, to: .right, of: imgIcon, withOffset: Constants.kMarginNormal)
        lblWeatherType.autoAlignAxis(toSuperviewAxis: .horizontal)
        lblWeatherType.autoSetDimension(.width, toSize: 60.0)

        lblTemp.autoPinEdge(toSuperviewEdge: .right, withInset: 7*Constants.kMarginNormal)
        lblTemp.autoAlignAxis(toSuperviewAxis: .horizontal)

    }
    
    func configure(viewModel: ForeCastCellViewModel) {
        lblHour.text = viewModel.lblHour
        lblWeatherType.text = viewModel.lblWeatherType
        lblTemp.text = viewModel.lblTemp
    }
    
}
