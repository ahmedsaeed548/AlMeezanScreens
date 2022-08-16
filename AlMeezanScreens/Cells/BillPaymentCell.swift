//
//  BillPaymentCell.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 29/07/2022.
//

import UIKit

class BillPaymentCell: UITableViewCell {
    
    static let identifer = "BillPaymentCell"
    
    public var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var portfolioLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.circularStdBold, size: 14)
        return label
    }()
    
    public var  balanceLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.robotoMedium, size: 10)
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
        contentView.addSubview(portfolioLbl)
        contentView.addSubview(balanceLbl)
        contentView.addSubview(chevronImage)
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
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        portfolioLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
        portfolioLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -10).isActive = true
        
        balanceLbl.topAnchor.constraint(equalTo: portfolioLbl.bottomAnchor, constant: 5).isActive = true
        balanceLbl.leadingAnchor.constraint(equalTo: portfolioLbl.leadingAnchor).isActive = true
        balanceLbl.trailingAnchor.constraint(equalTo: portfolioLbl.trailingAnchor).isActive = true
        
        chevronImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 35).isActive = true
        chevronImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
        chevronImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        
    }

}
