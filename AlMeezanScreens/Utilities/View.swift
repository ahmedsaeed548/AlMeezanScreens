//
//  View.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 29/07/2022.
//

import UIKit

class View: UIView {
    
    private let inner: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.robotoRegular, size: 12)
        label.clipsToBounds = true
        return label
    }()
    
    private let subLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.circularStdBold, size: 14)
        label.clipsToBounds = true
        return label
    }()
    
    private var Image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(titleLabl: String, subLabel: String, imageName: String) {
        super.init(frame: CGRect.zero)
        self.backgroundColor = .white
        self.titleLbl.text = titleLabl
        self.subLbl.text = subLabel
        self.Image.image = UIImage(named: imageName)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        
        self.addSubview(inner)
        inner.addSubview(titleLbl)
        inner.addSubview(subLbl)
        self.addSubview(Image)
        
        self.inner.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.inner.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.inner.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.inner.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        Image.widthAnchor.constraint(equalToConstant: 44).isActive = true
        Image.heightAnchor.constraint(equalToConstant: 44).isActive = true
        Image.centerYAnchor.constraint(equalTo: self.inner.centerYAnchor).isActive = true
        Image.leadingAnchor.constraint(equalTo: self.inner.leadingAnchor, constant: 20).isActive = true
        
        self.titleLbl.topAnchor.constraint(equalTo: inner.topAnchor, constant: 15).isActive = true
        self.titleLbl.leftAnchor.constraint(equalTo: self.Image.rightAnchor, constant: 10).isActive = true
        
        self.subLbl.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 2).isActive = true
        self.subLbl.leftAnchor.constraint(equalTo: self.Image.rightAnchor, constant: 10).isActive = true
        
        self.Image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        self.Image.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.Image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25).isActive = true
        
        self.titleLbl.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        self.titleLbl.leftAnchor.constraint(equalTo: self.Image.rightAnchor, constant: 10).isActive = true
        
        self.subLbl.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant: 2).isActive = true
        self.subLbl.leftAnchor.constraint(equalTo: self.Image.rightAnchor, constant: 10).isActive = true
        
        
    }
    
}

class PaymentServiceView: UIView {
    
    private let views: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        // view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 10
        view.layer.borderWidth = 0.1
        view.layer.cornerRadius = 20
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.circularStdRegular, size: 18)
        label.clipsToBounds = true
        return label
    }()
    
    private let subLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: AppFontName.robotoRegular, size: 15)
        label.clipsToBounds = true
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let btnImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: IconName.chevron_down)?.transform(withNewColor: UIColor.btnGray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(titleLabel: String, subTitleLabel: String, imageName: String) {
        super.init(frame: CGRect.zero)
        self.addSubview(views)
        self.views.addSubview(btnImage)
        self.views.addSubview(titleLbl)
        self.views.addSubview(image)
        self.views.addSubview(subLbl)
        
        titleLbl.text = titleLabel
        image.image = UIImage(named: imageName)
        subLbl.text = subTitleLabel
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        //        self.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //        self.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        self.views.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.views.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.views.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        self.views.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.image.centerYAnchor.constraint(equalTo: self.views.centerYAnchor).isActive = true
        self.image.leadingAnchor.constraint(equalTo: self.views.leadingAnchor, constant: 15).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.titleLbl.centerYAnchor.constraint(equalTo: self.views.centerYAnchor, constant: -35).isActive = true
        self.titleLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        
        self.subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5).isActive = true
        self.subLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        self.subLbl.trailingAnchor.constraint(equalTo: btnImage.leadingAnchor, constant: -15).isActive = true
        
        btnImage.topAnchor.constraint(equalTo: views.topAnchor, constant: 55).isActive = true
        btnImage.rightAnchor.constraint(equalTo: views.rightAnchor, constant: -10).isActive = true
        btnImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
    }
    
}


class SubscriptionView: UIView {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Select the service that you would like to subscribe to"
        label.font = UIFont(name: AppFontName.circularStdRegular, size: 12)
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.addSubview(label)
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -15).isActive = true
        self.label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
}


class CustomPortfolioView: UIView {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "MaskGroup")
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "meezanLogo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var portfolioLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: AppFontName.circularStdBold, size: 14)
        return label
    }()
    
    public var  balanceLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: AppFontName.robotoRegular, size: 12)
        return label
    }()
    
    public var fundLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Fund Name"
        label.font = UIFont(name: AppFontName.robotoRegular, size: 12)
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
    
    init(portfolioLabel: String, balanceLabel: String, viewColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.balanceLbl.text = balanceLabel
        self.portfolioLbl.text = portfolioLabel
        self.view.backgroundColor = viewColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.addSubview(backgroundImage)
        view.addSubview(image)
        view.addSubview(portfolioLbl)
        view.addSubview(fundLbl)
        view.addSubview(balanceLbl)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 1).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -1).isActive = true
        
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        portfolioLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -15).isActive = true
        portfolioLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        
        fundLbl.topAnchor.constraint(equalTo: portfolioLbl.bottomAnchor, constant: 2).isActive = true
        fundLbl.leadingAnchor.constraint(equalTo: portfolioLbl.leadingAnchor).isActive = true
        fundLbl.trailingAnchor.constraint(equalTo: portfolioLbl.trailingAnchor, constant: 0).isActive = true
        
        balanceLbl.topAnchor.constraint(equalTo: fundLbl.bottomAnchor, constant: 2).isActive = true
        balanceLbl.leadingAnchor.constraint(equalTo: fundLbl.leadingAnchor).isActive = true
        balanceLbl.trailingAnchor.constraint(equalTo: fundLbl.trailingAnchor).isActive = true
        
    }
    
}

class TransactionLimit: UIView {
    
    public var containerView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightPurple
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.purple.cgColor
        view.layer.cornerRadius = 6
        
        return view
    }()
    
    private let limitLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "50,000 per Transaction limit and your avaialbe limit is 50,000"
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.robotoRegular, size: 12)
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "information-outline")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {
        self.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        containerView.addSubview(image)
        image.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
        image.heightAnchor.constraint(equalToConstant: 20).isActive = true
        image.widthAnchor.constraint(equalToConstant: 20).isActive = true
        image.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        
        containerView.addSubview(limitLbl)
        limitLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        limitLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        limitLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        
    }
    
}


class AccountView: UIView {
    
    private let view: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "MaskGroup")
        view.layer.cornerRadius = 10
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.image = UIImage(named: "meezanLogo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    public var accountName: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: AppFontName.circularStdBold, size: 14)
        return label
    }()
    
    public var accountNo: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: AppFontName.robotoRegular, size: 12)
        return label
    }()
    
    init(accountNames: String, accountNos: String, viewColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.accountName.text = accountNames
        self.accountNo.text = accountNos
        self.view.backgroundColor = viewColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.addSubview(backgroundImage)
        view.addSubview(image)
        view.addSubview(accountName)
        view.addSubview(accountNo)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        backgroundImage.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 1).isActive = true
        backgroundImage.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -1).isActive = true
        
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        accountName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -10).isActive = true
        accountName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        
        accountNo.topAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 5).isActive = true
        accountNo.leadingAnchor.constraint(equalTo: accountName.leadingAnchor).isActive = true
        accountNo.trailingAnchor.constraint(equalTo: accountName.trailingAnchor).isActive = true
        
    }
    
}


class NewPaymentServiceView: UIView {
    
    private let views: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        // view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.3
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 10
        view.layer.borderWidth = 0.1
        view.layer.cornerRadius = 20
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.font = UIFont(name: AppFontName.circularStdRegular, size: 18)
        label.clipsToBounds = true
        return label
    }()
    
    private let subLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: AppFontName.robotoRegular, size: 15)
        label.clipsToBounds = true
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let btnImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: IconName.chevron_down)?.transform(withNewColor: UIColor.btnGray)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(titleLabel: String, subTitleLabel: String, imageName: String) {
        super.init(frame: CGRect.zero)
        self.addSubview(views)
        self.views.addSubview(btnImage)
        self.views.addSubview(titleLbl)
        self.views.addSubview(image)
        self.views.addSubview(subLbl)
        self.backgroundColor = .blue
        titleLbl.text = titleLabel
        image.image = UIImage(named: imageName)
        subLbl.text = subTitleLabel
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        
        
        
        self.views.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.views.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        self.views.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.views.widthAnchor.constraint(equalToConstant: 320).isActive = true
        
        self.image.centerYAnchor.constraint(equalTo: self.views.centerYAnchor).isActive = true
        self.image.leadingAnchor.constraint(equalTo: self.views.leadingAnchor, constant: 15).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 30).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.titleLbl.centerYAnchor.constraint(equalTo: self.views.centerYAnchor, constant: -35).isActive = true
        self.titleLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        
        self.subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5).isActive = true
        self.subLbl.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 15).isActive = true
        self.subLbl.trailingAnchor.constraint(equalTo: btnImage.leadingAnchor, constant: -15).isActive = true
        
        btnImage.topAnchor.constraint(equalTo: views.topAnchor, constant: 55).isActive = true
        btnImage.rightAnchor.constraint(equalTo: views.rightAnchor, constant: -10).isActive = true
        btnImage.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        
    }
    
}
