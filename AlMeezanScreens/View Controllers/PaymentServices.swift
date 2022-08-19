//
//  PaymentServices.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 02/08/2022.
//

import UIKit

class PaymentServicesViewController: UIViewController {
    
    private (set) lazy var headerView: HeaderView = { [unowned self] in
        let view = HeaderView.init(titleLbl: Headings.paymentService, closeAction: {
            self.navigationController?.popViewController(animated: true)
        }, nextAction: {
            print("next")
        }, previousAction: {
            self.navigationController?.popViewController(animated: true)
        })
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fundTransferView: PaymentServiceView = {
        
        let view = PaymentServiceView(titleLabel: Headings.fundTransfer, subTitleLabel: Description.fundTransferDecription , imageName: IconName.fundImage )
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subscriptionView: PaymentServiceView = {

        let view = PaymentServiceView(titleLabel: Headings.subscribe, subTitleLabel: Description.subscriptionDescription, imageName: IconName.subImage )
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let billPaymentView: PaymentServiceView = {
        let view = PaymentServiceView(titleLabel: Headings.billPayment, subTitleLabel: Description.billPaymentDescription , imageName: IconName.billImage )
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray2

        let fundtrasnferGesture = UITapGestureRecognizer(target: self, action: #selector(fundTranferTapped))
      
        self.fundTransferView.addGestureRecognizer(fundtrasnferGesture)
        
        let subscribeGesture = UITapGestureRecognizer(target: self, action: #selector(subscribeTapped))
    
        self.subscriptionView.addGestureRecognizer(subscribeGesture)

        let billPaymentGesture = UITapGestureRecognizer(target: self, action: #selector(billPaymentTapped))
        self.billPaymentView.addGestureRecognizer(billPaymentGesture)
        
        view.addSubview(headerView)
        view.addSubview(subscriptionView)
        view.addSubview(fundTransferView)
        view.addSubview(billPaymentView)
        setupConstraint()
    }
    
    @objc func fundTranferTapped(sender: UITapGestureRecognizer) {
     print("fund Transfer is tapped")
    }
    
    @objc func subscribeTapped(sender: UITapGestureRecognizer) {
        print("Subscribe Tapped.")
        let vc = SubscriptionViewController()
        let navVc = UINavigationController(rootViewController: vc)
        navVc.modalPresentationStyle = .fullScreen
        present(navVc, animated: true)
    }
    
    @objc func billPaymentTapped(sender: UITapGestureRecognizer) {
        print("BillPayment Tapped.")
    }
    
    
    private func setupConstraint() {
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        subscriptionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        subscriptionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        subscriptionView.trailingAnchor.constraint(equalTo: fundTransferView.trailingAnchor, constant: 0).isActive = true
        subscriptionView.leadingAnchor.constraint(equalTo: fundTransferView.leadingAnchor, constant: 0).isActive = true
        subscriptionView.bottomAnchor.constraint(equalTo: fundTransferView.topAnchor, constant: 15).isActive = true
        
        fundTransferView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        fundTransferView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 30).isActive = true
        fundTransferView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        fundTransferView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        billPaymentView.leadingAnchor.constraint(equalTo: fundTransferView.leadingAnchor, constant: 0).isActive = true
        billPaymentView.trailingAnchor.constraint(equalTo: fundTransferView.trailingAnchor).isActive = true
        billPaymentView.topAnchor.constraint(equalTo: fundTransferView.bottomAnchor, constant: -20).isActive = true
        
        billPaymentView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        billPaymentView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
    }
    
}
