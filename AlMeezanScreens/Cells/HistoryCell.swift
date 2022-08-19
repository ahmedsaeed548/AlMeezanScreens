//
//  HistoryCell.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 04/08/2022.
//

import Foundation
import UIKit

class HistoryCell: UITableViewCell {
    
    static let identifer = "HistoryCell"
    
    public var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "sendrecImage")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var accountDetailLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.circularStdBold, size: 12)
        return label
    }()
    
    public var bankNameLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.robotoRegular, size: 10)
        return label
    }()
    
    public var amountPKRLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "PKR 6000.0"
        label.font = UIFont(name: AppFontName.circularStdBold, size: 14)
        return label
    }()
    
    public var chevronImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: IconName.chevron_down)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(image)
        contentView.addSubview(accountDetailLbl)
        contentView.addSubview(bankNameLbl)
        contentView.addSubview(chevronImage)
        contentView.addSubview(amountPKRLbl)
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupConstraints() {
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        accountDetailLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
        accountDetailLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        
        bankNameLbl.topAnchor.constraint(equalTo: accountDetailLbl.bottomAnchor, constant: 5).isActive = true
        bankNameLbl.leadingAnchor.constraint(equalTo: accountDetailLbl.leadingAnchor).isActive = true
        bankNameLbl.trailingAnchor.constraint(equalTo: accountDetailLbl.trailingAnchor).isActive = true
        
        amountPKRLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
        amountPKRLbl.trailingAnchor.constraint(equalTo: chevronImage.leadingAnchor, constant: -10).isActive = true
        
        chevronImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        chevronImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        chevronImage.heightAnchor.constraint(equalToConstant: 12).isActive = true

        
    }
    
}
