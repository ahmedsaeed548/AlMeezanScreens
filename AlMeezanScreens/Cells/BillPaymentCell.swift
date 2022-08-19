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
        image.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
        image.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.45)
        
        portfolioLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -10).isActive = true
        portfolioLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        
        balanceLbl.topAnchor.constraint(equalTo: portfolioLbl.bottomAnchor, constant: 5).isActive = true
        balanceLbl.leadingAnchor.constraint(equalTo: portfolioLbl.leadingAnchor).isActive = true
        balanceLbl.trailingAnchor.constraint(equalTo: portfolioLbl.trailingAnchor).isActive = true
        
        chevronImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        chevronImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        chevronImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        
    }

}
