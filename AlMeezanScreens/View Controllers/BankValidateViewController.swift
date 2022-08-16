//
//  BankValidateViewController.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 10/08/2022.
//

import UIKit

class BankValidateViewController: UIViewController {
    
    private (set) lazy var headerView: HeaderView = { [unowned self] in
        let view = HeaderView.init(titleLbl: Headings.fundTransfer, closeAction: {
            self.navigationController?.popViewController(animated: true)
        }, nextAction: {
            print("next")
        }, previousAction: {
            self.navigationController?.popViewController(animated: true)
        })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private (set) lazy var customView: CustomPortfolioView = {
        let view = CustomPortfolioView.init(portfolioLabel: "Portfolio ID 316 XXXX XX 88", balanceLabel: "Balance PKR 1200.2", viewColor: .purple)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var titleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "From Account"
        label.font = UIFont(name: AppFontName.circularStdRegular, size: 13)
        return label
    }()
    
    public var containerView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let validateBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setTitle("VALIDATE", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = UIColor.purple
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action: #selector(changeName), for: .touchUpInside)
        return btn
    }()

    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        view.layer.cornerRadius = 10
        view.distribution = .fillEqually
        view.alignment = .fill
        view.axis = .vertical
        view.backgroundColor = UIColor.gray2
        view.spacing = 2
        view.clipsToBounds = true
        view.frame = view.bounds
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray2
        setupConstraint()
    }
    
    func setupConstraint() {
        
        view.addSubview(headerView)

        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(titleLbl)
        titleLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 5).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        
        view.addSubview(customView)
        customView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        customView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5).isActive = true
        customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        containerView.addSubview(validateBtn)
        validateBtn.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 30).isActive = true
        validateBtn.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -30).isActive = true
        validateBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        validateBtn.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20).isActive = true
        
        view.addSubview(containerView)
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: customView.bottomAnchor, constant: 20).isActive = true
        
        containerView.addSubview(scrollView)
        scrollView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        
        scrollView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
    }
    
    @objc func changeName() {
      
    }

}
