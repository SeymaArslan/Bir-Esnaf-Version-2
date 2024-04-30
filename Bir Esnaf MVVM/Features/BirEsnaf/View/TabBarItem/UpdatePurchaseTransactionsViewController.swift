//
//  UpdatePurchaseTransactionsViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 29.04.2024.
//

import UIKit
import SnapKit

class UpdatePurchaseTransactionsViewController: UIViewController {
    
    var selectedPurchase: Purchase?
    
    //MARK: - Create UI
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Images.background)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: Colors.blue)
        button.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let compName: UILabel = {
        let label = UILabel()
        label.text = "Products"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = UIColor(named: Colors.blue)
        return label
    }()
    
    private let compPicker: UIPickerView = {
        let picker = UIPickerView()
        
        return picker
    }()
    
    private let companyProdTitle: UILabel = {
       let label = UILabel()
        label.text = "Product Name"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let companyProdTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.placeholder = "Product Name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let unitPriceTitle: UILabel = {
        let label = UILabel()
        label.text = "Unit Price"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let unitPriceTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.placeholder = "Unit Price"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let quantityTitle: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let quantityTextField: UITextField = {
       let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.placeholder = "Quantity"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let totalCostLabel: UILabel = {
        let label = UILabel()
        label.text = "Total Cost"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let totalCostTextField: UITextField = {
       let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.placeholder = "Total Cost"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let dateTitle: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let dateTextField: UITextField = {
       let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.placeholder = "Date"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.setTitleColor(UIColor(named: Colors.blue), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.addTarget(self, action: #selector(updateButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    //MARK: - Button Actions
    @objc func cancelButtonPressed() {
        
    }
    
    @objc func updateButtonPressed() {
        
    }
    
    
    //MARK: - Snapkit Function
    
}
