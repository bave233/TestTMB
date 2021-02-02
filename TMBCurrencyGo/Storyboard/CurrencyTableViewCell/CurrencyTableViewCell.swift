//
//  CurrencyTableViewCell.swift
//  TMBCurrencyGo
//
//  Created by Ratchanon.Int on 1/2/2564 BE.
//

import Kingfisher
import UIKit

protocol CurrencyTableViewCellDelegate: class {
    func callbackfromTF(text: String, row: Int)
}

class CurrencyTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var currencySubContentLabel: UILabel!
    @IBOutlet weak var currencyContentLabel: UILabel!
    @IBOutlet weak var currencySubtitleLabel: UILabel!
    @IBOutlet weak var currencytitleLabel: UILabel!
    @IBOutlet weak var currencyTextField: UITextField! {
        didSet {
            currencyTextField.placeholder = "โปรดกรอกจํานวนเงินที่ต้องการแปลง"
            currencyTextField.delegate = self
        }
    }

    @IBOutlet weak var covertButton: UIButton!
    @IBOutlet weak var currencyImageView: UIImageView!

    struct CurrencyCellModel {
        let title: String
        let row: Int
        let subtitle: String
        let content: String
        let subcontent: String
        let imageString: String
    }

    var row: Int?
    @IBAction func convertButtonAction(_ sender: Any) {
        currencyTextField.endEditing(true)
        delegate?.callbackfromTF(text: currencyTextField.text ?? "", row: row ?? 0)
    }

    weak var delegate: CurrencyTableViewCellDelegate?

    static let cellIdentifier = "CurrencyTableViewCell"

    func setupUI(model: CurrencyCellModel) {
        row = model.row
        currencySubContentLabel.text = model.subcontent
        currencyContentLabel.text = model.content
        currencytitleLabel.text = model.title
        currencySubtitleLabel.text = model.subtitle
        currencyImageView.kf.setImage(with: URL(string: model.imageString),
                                      completionHandler: {
                                          result in
                                          switch result {
                                          case .success:
                                              break
                                          case .failure:
                                              break
                                          }
        })
    }
}

extension CurrencyTableViewCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn: "0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}
