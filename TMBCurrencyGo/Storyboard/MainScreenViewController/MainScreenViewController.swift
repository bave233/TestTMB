//
//  MainScreenViewController.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//  Copyright (c) 2564 ___ORGANIZATIONNAME___. All rights reserved.
//

import PopupDialog
import SVProgressHUD
import UIKit
protocol MainScreenDisplayLogic: class {
    func displayError(error: CurrencyErorrResponse)
    func displayAllCurrency(viewModel: MainScreen.AllCurrencies.ViewModel, currencyDic: [String: String])
    func displayConvertCurrency(viewModel: MainScreen.CovertedCurrencies.ViewModel)
    func displayRatesCurrency(viewModel: MainScreen.RatesCurrencies.ViewModel)
}

class MainScreenViewController: BaseViewController, MainScreenDisplayLogic {
    var interactor: MainScreenBusinessLogic?
    var convertCurrency: CovertCurrencyResponse?
    var tableviewRowToReload: Int?
    var router: (NSObjectProtocol & MainScreenRoutingLogic)?
    var allCurrency: [CurrencyData]?
    var searchDataCurrency: [CurrencyData] = []
    var backupData: [CurrencyData] = []
    var backupListData: [CurrencyData] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactorMainScreen = MainScreenInteractor()
        let presenter = MainScreenPresenter()
        let routerMainScreen = MainScreenRouter()
        viewController.interactor = interactorMainScreen
        viewController.router = routerMainScreen
        interactorMainScreen.presenter = presenter
        presenter.viewController = viewController
        routerMainScreen.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        callAPI()
    }
    
    @IBOutlet weak var chooseCountryView: UIView! {
        didSet {
            chooseCountryView.layer.borderWidth = 2
            chooseCountryView.layer.borderColor = UIColor.red.cgColor
            chooseCountryView.isHidden = true
            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
            chooseCountryView.isUserInteractionEnabled = true
            chooseCountryView.addGestureRecognizer(panGesture)
        }
    }
    
    @IBOutlet weak var chooseCountryViewLabel: UILabel!
    
    var pickerData: CurrencyData?
    @IBAction func closeButtonPopupAction(_ sender: Any) {
        chooseCountryView.isHidden = true
        navigationItem.leftBarButtonItem?.isEnabled = true
        navigationItem.rightBarButtonItem?.isEnabled = true
        pickerData = nil
        pickerViewHeight.constant = 0
        currencyTableView.reloadData()
    }
    
    var refreshControl = UIRefreshControl()
    @IBOutlet weak var searchBarHeight: NSLayoutConstraint!
    @IBOutlet weak var currencyTableView: UITableView! {
        didSet {
            currencyTableView.delegate = self
            currencyTableView.dataSource = self
            refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
            refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
            currencyTableView.addSubview(refreshControl)
            registerXIB()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.placeholder = "ค้นหาจากคําย่อประเทศ"
            searchBar.delegate = self
        }
    }
    
    @objc func refresh(_ sender: AnyObject) {
        if searchBarHeight.constant > 0 {
            if !backupData.isEmpty {
                searchDataCurrency = []
                allCurrency = backupData
            }
            
            searchBar.endEditing(true)
            UIView.animate(withDuration: 2.0, animations: {
                self.searchBarHeight.constant = 0
            })
            searchBar.text = ""
            currencyTableView.reloadData()
        }
        if pickerViewHeight.constant > 0 {
            pickerViewHeight.constant = 0
            pickerView.endEditing(true)
        }
        
        callAPI()
    }
    
    @IBOutlet weak var pickerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.dataSource = self
            pickerView.delegate = self
        }
    }
    
    func registerXIB() {
        currencyTableView.register(UINib(nibName: CurrencyTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: CurrencyTableViewCell.cellIdentifier)
    }
    
    @objc func draggedView(_ sender: UIPanGestureRecognizer) {
        view.bringSubviewToFront(chooseCountryView)
        let translation = sender.translation(in: view)
        chooseCountryView.center = CGPoint(x: chooseCountryView.center.x + translation.x, y: chooseCountryView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func setupUI() {
        title = "หน้าหลัก"
        guard let systemMagImg = UIImage(systemName: "magnifyingglass.circle.fill") else { return }
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: systemMagImg, style: .plain, target: self, action: #selector(searchAction(sender:)))
        guard let systemBadgeImg = UIImage(systemName: "note.text.badge.plus") else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: systemBadgeImg, style: .plain, target: self, action: #selector(pickerAction(sender:)))
    }
    
    func callAPI() {
        showHudBlackCover()
        interactor?.fetchGetAllCurrency()
    }
    
    @objc func searchAction(sender: UIBarButtonItem) {
        navigationItem.rightBarButtonItem?.isEnabled = false
        backupListData += backupData
        UIView.animate(withDuration: 2.0, animations: {
            self.searchBarHeight.constant = 50
        })
    }
    
    @objc func pickerAction(sender: UIBarButtonItem) {
        navigationItem.leftBarButtonItem?.isEnabled = false
        UIView.animate(withDuration: 2.0, animations: {
            self.pickerViewHeight.constant = 100
        })
        pickerView.reloadAllComponents()
    }
    
    func displayAllCurrency(viewModel: MainScreen.AllCurrencies.ViewModel, currencyDic: [String: String]) {
        interactor?.fetchGetRatesCurrency(allCurrency: viewModel.result ?? [], currencyDic: currencyDic)
    }
    
    func displayError(error: CurrencyErorrResponse) {
        refreshControl.endRefreshing()
        hideHud()
        var title = "ขอภัยค่ะระบบไม่สามารถดําเนินการได้ในขณะนี้ \n กรุณา ลองใหม่อีกครั้ง"
        if !ReachabilityManager.isConnectedToNetwork() {
            title = "ขออภัยสัญญาณอินเตอร์เน็ตขัดข้อง \n กรุณาลองใหม่อีกครั้ง"
        }
        let image = UIImage(contentsOfFile: "")
        let popup = PopupDialog(title: title, message: "\(error.error?.code ?? 999) : \(error.error?.message ?? "")", image: image)
        let buttonOne = CancelButton(title: "OK") {
            popup.dismiss()
        }
        popup.addButtons([buttonOne])
        present(popup, animated: true, completion: nil)
    }
    
    func displayConvertCurrency(viewModel: MainScreen.CovertedCurrencies.ViewModel) {
        refreshControl.endRefreshing()
        hideHud()
        convertCurrency = viewModel.result
        currencyTableView.reloadRows(at: [IndexPath(row: tableviewRowToReload ?? 0, section: 0)], with: .automatic)
    }
    
    func displayRatesCurrency(viewModel: MainScreen.RatesCurrencies.ViewModel) {
        allCurrency = viewModel.result
        currencyTableView.reloadData()
        refreshControl.endRefreshing()
        hideHud()
    }
}

extension MainScreenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCurrency?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.cellIdentifier, for: indexPath) as! CurrencyTableViewCell
        let shotCountryText = "\(allCurrency?[indexPath.row].shotCountry ?? "") เรท \(allCurrency?[indexPath.row].rateCountry ?? 0.0)"
        var covertText = ""
        var resultText = ""
        if let selectedData = pickerData {
            cell.currencyTextField.isHidden = false
            covertText = "แปลงจาก \(allCurrency?[indexPath.row].shotCountry ?? "") ไป \(selectedData.shotCountry)"
            cell.covertButton.isHidden = false
            cell.currencyContentLabel.isHidden = false
        } else {
            cell.currencyContentLabel.isHidden = true
            cell.currencyTextField.isHidden = true
            cell.covertButton.isHidden = true
        }
        if let currency = convertCurrency {
            cell.currencySubContentLabel.isHidden = false
            resultText = String(currency.conversion?.result ?? 0.0)
        } else {
            cell.currencySubContentLabel.isHidden = true
        }
        cell.delegate = self
        cell.setupUI(model: CurrencyTableViewCell.CurrencyCellModel(title: allCurrency?[indexPath.row].longCountry ?? "", row: indexPath.row, subtitle: shotCountryText, content: covertText, subcontent: resultText, imageString: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Flag_of_Uganda.svg/510px-Flag_of_Uganda.svg.png"))
        return cell
    }
}

extension MainScreenViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let realData = allCurrency
        backupData = allCurrency ?? []
        if let mRealData = realData {
            for item in mRealData {
                if item.shotCountry.contains(searchBar.text!) {
                    searchDataCurrency.append(item)
                }
            }
            if searchBar.text!.isEmpty {
                allCurrency = backupListData
                searchBar.endEditing(true)
                UIView.animate(withDuration: 2.0, animations: {
                    self.searchBarHeight.constant = 0
                })
            } else {
                searchBar.endEditing(true)
                UIView.animate(withDuration: 2.0, animations: {
                    self.searchBarHeight.constant = 50
                })
                backupListData += mRealData
                allCurrency = searchDataCurrency
            }
            currencyTableView.reloadData()
        } else {
            searchBar.endEditing(true)
            UIView.animate(withDuration: 2.0, animations: {
                self.searchBarHeight.constant = 0
            })
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem?.isEnabled = true
        if !backupData.isEmpty {
            searchDataCurrency = []
            allCurrency = backupData
        }
        
        searchBar.endEditing(true)
        UIView.animate(withDuration: 2.0, animations: {
            self.searchBarHeight.constant = 0
        })
        searchBar.text = ""
        currencyTableView.reloadData()
    }
}

extension MainScreenViewController: CurrencyTableViewCellDelegate {
    func callbackfromTF(text: String, row: Int) {
        tableviewRowToReload = row
        if pickerData?.shotCountry.isEmpty ?? false || pickerData?.shotCountry == "" {
            let title = "โปรดเลือกประเทศก่อนบนมุมซ้่ายมือ"
            let image = UIImage(contentsOfFile: "")
            let popup = PopupDialog(title: title, message: "", image: image)
            let buttonOne = CancelButton(title: "OK") {
                popup.dismiss()
            }
            popup.addButtons([buttonOne])
            present(popup, animated: true, completion: nil)
        } else {
            showHudBlackCover()
            interactor?.fetchGetConvertCurrency(request: MainScreen.CovertedCurrencies.Request(amount: text, from: allCurrency?[row].shotCountry ?? "", to: pickerData?.shotCountry ?? ""))
        }
    }
}

extension MainScreenViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allCurrency?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allCurrency?[row].shotCountry
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        chooseCountryView.isHidden = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        
        pickerData = allCurrency?[row]
        chooseCountryViewLabel.text = pickerData?.shotCountry
        currencyTableView.reloadData()
        pickerView.endEditing(true)
        
        pickerViewHeight.constant = 0
    }
}
