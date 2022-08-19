import UIKit
import Foundation

enum PageToShow {
    case myPayees
    case history
}

class TestBillPayment: UIViewController {
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let myPayeesView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let historyView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let myPayeesUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let historyUnderlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topbarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "bar")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let midLbl: UILabel = {
        var label = UILabel()
        label.text = "Bill Payment"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.font = UIFont(name: AppFontName.circularStdRegular, size: 16)
        return label
    }()
    
    private let backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setImage(UIImage(named: IconName.backArrow)?.transform(withNewColor: .white), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let notificationBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setImage(UIImage(named: "notification")?.transform(withNewColor: .white), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.alignment = .fill
        view.axis = .horizontal
        view.spacing = 4
        view.clipsToBounds = true
        view.frame = view.bounds
        return view
    }()
    
    private let myPayeesBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setTitle("My Payees", for: .normal)
        btn.tintColor = .white
        btn.isSelected = true
        btn.titleLabel?.font = UIFont(name: AppFontName.robotoRegular, size: 12)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(isBtnTapped), for: .touchUpInside)
        btn.tag = 0
        return btn
    }()
    
    private let historyBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.clipsToBounds = true
        btn.setTitle("History", for: .normal)
        btn.setTitleColor(.offwhite, for: .normal)
        btn.titleLabel?.font = UIFont(name: AppFontName.robotoRegular, size: 12)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(isBtnTapped), for: .touchUpInside)
        btn.tintColor = .white
        btn.isSelected = true
        btn.tag = 1
        return btn
    }()
    
    private let tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(BillPaymentCell.self, forCellReuseIdentifier: BillPaymentCell.identifer)
        tableview.register(HistoryCell.self, forCellReuseIdentifier: HistoryCell.identifer)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.isScrollEnabled = true
        tableview.backgroundColor = UIColor.gray2
        return tableview
    }()
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray2
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
    
    var views: [UIView]!
    var names: [String] = ["Ahmed", "Saeed", "Speed", "s"]
    var amount: [String] = ["03303234233", "03303234233", "03303234233", "03303234233d"]
    var date: [String] = ["15, July", "16th July", "17th July", "20th July"]
    var details = UIButton()
    
    var pagetoShow = PageToShow.myPayees
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.addSubview(containerView)
        view.addSubview(buttonView)
        containerView.addSubview(tableview)
        buttonView.addSubview(addBeneficiaryBtn)
        headerView.addSubview(topbarImage)
        headerView.addSubview(backBtn)
        headerView.addSubview(midLbl)
        headerView.addSubview(notificationBtn)
        headerView.addSubview(stackView)
        stackView.addArrangedSubview(myPayeesView)
        stackView.addArrangedSubview(historyView)
        myPayeesView.addSubview(myPayeesBtn)
        historyView.addSubview(historyBtn)
        myPayeesView.addSubview(myPayeesUnderlineView)
        historyView.addSubview(historyUnderlineView)
        historyUnderlineView.isHidden = true
        tableview.delegate = self
        tableview.dataSource = self
        self.tableview.reloadData()
        
        setupConstraints()
    }
    
    @objc func isBtnTapped(sender: UIButton) {
        
        switch sender.tag {
        case 0:
            print("MyPayees is selected \(sender.tag)")
            myPayeesUnderlineView.isHidden = false
            historyUnderlineView.isHidden = true
            historyBtn.setTitleColor(.offwhite, for: .normal)
            myPayeesBtn.setTitleColor(.white, for: .normal)
            self.pagetoShow = PageToShow.myPayees
            self.buttonView.backgroundColor = .white
            self.addBeneficiaryBtn.isHidden = false
            self.tableview.reloadData()
        case 1 :
            print("History is selected \(sender.tag)")
            myPayeesUnderlineView.isHidden = true
            historyUnderlineView.isHidden = false
            myPayeesBtn.setTitleColor(.offwhite, for: .normal)
            historyBtn.setTitleColor(.white, for: .normal)
            self.buttonView.backgroundColor = .gray2
            self.addBeneficiaryBtn.isHidden = true
            self.pagetoShow = PageToShow.history
            self.tableview.reloadData()
        default:
            return
        }
        self.tableview.reloadData()
    }
    
    func setupConstraints() {
        
        self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        self.headerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        
        self.topbarImage.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        self.topbarImage.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 0).isActive = true
        self.topbarImage.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: 0).isActive = true
        self.topbarImage.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        self.backBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        self.backBtn.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15).isActive = true
        
        self.midLbl.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        self.midLbl.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 5).isActive = true
        
        self.notificationBtn.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        self.notificationBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15).isActive = true
        
        self.stackView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        self.stackView.topAnchor.constraint(equalTo: midLbl.bottomAnchor, constant: 4).isActive = true
        
        self.myPayeesBtn.topAnchor.constraint(equalTo: self.myPayeesView.topAnchor).isActive = true
        self.myPayeesBtn.leadingAnchor.constraint(equalTo: self.myPayeesView.leadingAnchor).isActive = true
        self.myPayeesBtn.trailingAnchor.constraint(equalTo: self.myPayeesView.trailingAnchor).isActive = true
        self.myPayeesBtn.bottomAnchor.constraint(equalTo: self.myPayeesUnderlineView.topAnchor).isActive = true
        
        self.historyBtn.topAnchor.constraint(equalTo: self.historyView.topAnchor).isActive = true
        self.historyBtn.leadingAnchor.constraint(equalTo: self.historyView.leadingAnchor).isActive = true
        self.historyBtn.trailingAnchor.constraint(equalTo: self.historyView.trailingAnchor).isActive = true
        self.historyBtn.bottomAnchor.constraint(equalTo: self.historyUnderlineView.topAnchor).isActive = true
        
        self.myPayeesUnderlineView.leadingAnchor.constraint(equalTo: myPayeesView.leadingAnchor).isActive = true
        self.myPayeesUnderlineView.trailingAnchor.constraint(equalTo: myPayeesView.trailingAnchor).isActive = true
        self.myPayeesUnderlineView.bottomAnchor.constraint(equalTo: myPayeesView.bottomAnchor).isActive = true
        self.myPayeesUnderlineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        self.historyUnderlineView.leadingAnchor.constraint(equalTo: historyView.leadingAnchor).isActive = true
        self.historyUnderlineView.trailingAnchor.constraint(equalTo: historyView.trailingAnchor).isActive = true
        self.historyUnderlineView.bottomAnchor.constraint(equalTo: historyView.bottomAnchor).isActive = true
        self.historyUnderlineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: buttonView.topAnchor).isActive = true
        
        self.tableview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        self.tableview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        self.tableview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20).isActive = true
        self.tableview.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor).isActive = true
        
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

extension TestBillPayment:  UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if pagetoShow == PageToShow.history {
            return date[section]
        }
        return " "
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if pagetoShow == PageToShow.myPayees {
            return 5
        }
        else {
            return 25
        }
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = UIFont(name: AppFontName.robotoRegular, size: 13)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalized
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if pagetoShow == PageToShow.myPayees {
            return 1
        }
        else {
            return date.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if pagetoShow == PageToShow.myPayees {
            return amount.count
        } else {
            return 3
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if pagetoShow == PageToShow.myPayees {
            guard let cell = tableview.dequeueReusableCell(withIdentifier: BillPaymentCell.identifer, for: indexPath) as? BillPaymentCell else {return UITableViewCell()}
            cell.image.image  = UIImage(named: "meezanLogo")
            cell.portfolioLbl.text = "Portfolio ID 316 XXXX XX 88"
            cell.balanceLbl.text = amount[indexPath.row]
            cell.layer.borderColor = UIColor.gray2.cgColor
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        } else {
            guard let cell = tableview.dequeueReusableCell(withIdentifier: HistoryCell.identifer, for: indexPath) as? HistoryCell else {return UITableViewCell()}
            
            cell.accountDetailLbl.text = "Mobilink Prepaid"
            cell.bankNameLbl.text = amount[indexPath.row]
            cell.layer.borderColor = UIColor.gray2.cgColor
            cell.layer.borderWidth = 2
            cell.layer.cornerRadius = 5
            cell.clipsToBounds = true
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    
}
