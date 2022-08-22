//
//  BillPaymentViewController.swift
//  AlMeezanScreens
//
//  Created by Ahmad on 29/07/2022.
//

import UIKit

class BillPaymentViewController: UIViewController {
    
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
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var  titleLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.text = "From Account"
        label.font = UIFont(name: AppFontName.circularStdBold, size: 14)
        return label
    }()
    
    public var subLbl: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.text = "Select Portfolio Id you would like to transfer from"
        label.font = UIFont(name: AppFontName.robotoRegular, size: 10)
        return label
    }()
    
    var names: [String] = ["Ahmed", "Saeed", "Speed", "s","Saeed", "Speed", "s","Saeed", "Speed", "s"]
    var secondName: [String] = ["1002.3", "12223.2"]
    
    private let tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(BillPaymentCell.self, forCellReuseIdentifier: BillPaymentCell.identifer)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.isScrollEnabled = true
        tableview.backgroundColor = UIColor.gray2
        return tableview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        containerView.addSubview(tableview)
        view.addSubview(headerView)
        view.addSubview(containerView)
        containerView.addSubview(titleLbl)
        containerView.addSubview(subLbl)
        tableview.delegate = self
        tableview.dataSource = self
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = containerView.bounds
    }
}

extension BillPaymentViewController:  UITableViewDelegate, UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return secondName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: BillPaymentCell.identifer, for: indexPath) as? BillPaymentCell else {return UITableViewCell()}
        cell.image.image = UIImage(named: "meezanLogo")
        cell.portfolioLbl.text = "Portfolio ID 316 XXXX XX 88"
        cell.balanceLbl.text = "Balance PKR \(secondName[indexPath.row])"
        cell.layer.borderColor = UIColor.gray2.cgColor
        cell.layer.borderWidth = 2
        cell.layer.cornerRadius = 5
        cell.clipsToBounds = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
}

extension BillPaymentViewController {
    
    func setupConstraints() {
        headerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        titleLbl.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10).isActive = true
        titleLbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: -60).isActive = true
        
        subLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 5).isActive = true
        subLbl.leadingAnchor.constraint(equalTo: titleLbl.leadingAnchor, constant: 0).isActive = true
        subLbl.trailingAnchor.constraint(equalTo: titleLbl.trailingAnchor).isActive = true
        
        tableview.topAnchor.constraint(equalTo: subLbl.bottomAnchor, constant: 5).isActive = true
        tableview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        tableview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        tableview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        
    }
}
