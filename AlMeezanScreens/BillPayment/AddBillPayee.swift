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
        view.distribution = .fillEqually
        view.alignment = .fill
        view.axis = .vertical
        view.backgroundColor = UIColor.gray2
        view.spacing = 2
        view.clipsToBounds = true
        view.frame = view.bounds
        return view
    }()
    private let scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private var uiview: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = .green
        return view
    }()
    
    var organizationCompany: TextInputView!
    var mobileNumber: TextInputView!
    var orgranizationTxt: String = ""
    var mobileNumberTxt: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(headerView)
        view.addSubview(containerView)
        view.addSubview(buttonView)
        containerView.addSubview(scrollView)
        scrollView.addSubview(stackView)
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
        
        scrollView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: containerView.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
      
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20).isActive = true
        
        organizationCompany = TextInputView(heading: "Organization Company", placeholder: "Mobilink-PostPaid", isPasswordEnable: false) { [weak self] (enteredText) in
            guard let self = self else {return}
            self.orgranizationTxt = enteredText
        }
        UserDefaults.standard.set(orgranizationTxt, forKey: "Amount")
        organizationCompany.txtField.keyboardType = .asciiCapableNumberPad
        organizationCompany.setData(text: orgranizationTxt)
        organizationCompany.translatesAutoresizingMaskIntoConstraints = false
        organizationCompany.heightAnchor.constraint(equalToConstant: 70).isActive = true
        organizationCompany.containerView.backgroundColor = .gray2
        stackView.addArrangedSubview(organizationCompany)
        
        mobileNumber = TextInputView(heading: "Mobile Number", placeholder: "Enter mobile number", isPasswordEnable: false) { [weak self] (enteredText) in
            guard let self = self else {return}
            self.mobileNumberTxt = enteredText
        }
        UserDefaults.standard.set(mobileNumberTxt, forKey: "Amount")
        mobileNumber.txtField.keyboardType = .asciiCapableNumberPad
        mobileNumber.setData(text: mobileNumberTxt)
        mobileNumber.translatesAutoresizingMaskIntoConstraints = false
        mobileNumber.heightAnchor.constraint(equalToConstant: 70).isActive = true
        mobileNumber.containerView.backgroundColor = .gray2
        stackView.addArrangedSubview(mobileNumber)
        
    }

}
