//
//  AddBillPayeeeViewController.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 18/08/2022.
//

import UIKit

class AddBillPayeeeViewController: UIViewController {
    
    private (set) lazy var headerView: HeaderView = { [unowned self] in
        let view = HeaderView.init(titleLbl: Headings.billPayment, closeAction: {
            self.navigationController?.popViewController(animated: true)
        }, nextAction: {
            print("next")
        }, previousAction: {
            self.navigationController?.popViewController(animated: true)
        })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var buttonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let addBeneficiaryBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setTitle("ADD BENEFICIARY", for: .normal)
        btn.tintColor = .white
        btn.backgroundColor = UIColor.purple
        btn.layer.cornerRadius = 20
        return btn
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
        view.backgroundColor = .red
        view.addSubview(headerView)
        view.addSubview(containerView)
        view.addSubview(buttonView)
        buttonView.addSubview(addBeneficiaryBtn)
        setupContraints()
    }
    
    func setupContraints() {
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: buttonView.topAnchor).isActive = true
        
        buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        buttonView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        buttonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12).isActive = true

        addBeneficiaryBtn.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: -5).isActive = true
        addBeneficiaryBtn.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor).isActive = true
        addBeneficiaryBtn.widthAnchor.constraint(equalToConstant: 270).isActive = true
        addBeneficiaryBtn.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

}
