//
//  ForeCastSectionHeaderView.swift
//  WeatherLondon
//
//  Created by Pablo Roca Rozas on 25/9/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import PureLayout

class ForeCastSectionHeaderView: UITableViewHeaderFooterView {
    
    // MARK: Constants
    
    public struct Layout {
        static let headerHeight: CGFloat = 36.0
    }
    
    // MARK: - Properties
    
    var viewModel: ForeCastSectionHeaderViewModel? {
        didSet {
            self.update()
        }
    }
    
    // MARK: - Views
    
    private let lblDate: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorMain
        label.backgroundColor = UIColor.clear
        return label
    }()

    private let lblTempMin: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorBlue
        label.backgroundColor = UIColor.clear
        return label
    }()

    private let lblTempMax: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorRed
        label.backgroundColor = UIColor.clear
        return label
    }()

    private let lblSuggestion: UILabel = {
        let label = UILabel(forAutoLayout: ())
        label.font = UIFont.pr2FontHeader()
        label.textColor = UIColor.pr2ColorMain
        label.backgroundColor = UIColor.clear
        return label
    }()

    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View config
    
    override func updateConstraints() {
        contentView.autoSetDimension(.height, toSize: Layout.headerHeight)
        
        lblDate.autoPinEdge(toSuperviewEdge: .left, withInset: Constants.kMarginNormal)
        lblDate.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        lblTempMin.autoPinEdge(.left, to: .right, of: lblDate, withOffset: Constants.kMarginNormal)
        lblTempMin.autoAlignAxis(toSuperviewAxis: .horizontal)

        lblTempMax.autoPinEdge(.left, to: .right, of: lblTempMin, withOffset: Constants.kMarginNormal)
        lblTempMax.autoAlignAxis(toSuperviewAxis: .horizontal)

        lblSuggestion.autoPinEdge(toSuperviewEdge: .right, withInset: Constants.kMarginNormal)
        lblSuggestion.autoAlignAxis(toSuperviewAxis: .horizontal)

        super.updateConstraints()
    }
    
    override func prepareForReuse() {
        self.contentView.backgroundColor = .white
        lblDate.text = nil
        lblDate.textColor = UIColor.pr2ColorMain

        lblTempMin.text = nil
        lblTempMin.textColor = UIColor.pr2ColorBlue

        lblTempMax.text = nil
        lblTempMax.textColor = UIColor.pr2ColorRed

        lblSuggestion.text = nil
        lblSuggestion.textColor = UIColor.pr2ColorMain
    }
    
    private func setup() {
        contentView.backgroundColor = .white
        
        self.addSubview(lblDate)
        self.addSubview(lblTempMin)
        self.addSubview(lblTempMax)
        self.addSubview(lblSuggestion)
        self.setNeedsUpdateConstraints()
    }
    
    private func update() {
        if let viewModel = self.viewModel {
            lblDate.text = viewModel.title
            lblTempMin.text = viewModel.tempMin.toString(decimalDigits: 1, thousandsSeparator: ",", decimalSeparator: ".")+"°"
            lblTempMax.text = viewModel.tempMax.toString(decimalDigits: 1, thousandsSeparator: ",", decimalSeparator: ".")+"°"
            lblSuggestion.text = viewModel.suggestion
        }
    }

}
