//
//  UpdateProductViewController.swift
//  Bir Esnaf MVVM
//
//  Created by Seyma Arslan on 20.04.2024.
//

import UIKit

class UpdateProductViewController: UIViewController {

    var selectedProduct: Product?
    
    //MARK: - Create UI
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 0)
        return view
    }()
    
    private let prodNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let prodNameTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        return textField
    }()
    
    private let costTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let costTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let amountTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(named: Colors.labelColourful)
        return label
    }()
    
    private let amountTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = UIColor(named: Colors.label)
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    private let updateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Update", for: .normal)
        button.setTitleColor(UIColor(named: Colors.blue), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor(named: Colors.blue)
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configuration()
    }
    

    @objc func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Snapkit Func
    func configuration() {
        view.addSubview(backgroundImage)
        view.addSubview(contentView)
        view.addSubview(prodNameLabel)
        view.addSubview(prodNameTextField)
        view.addSubview(costTitleLabel)
        view.addSubview(costTextField)
        view.addSubview(amountTitleLabel)
        view.addSubview(amountTextField)
        view.addSubview(updateButton)
        view.addSubview(closeButton)
        
        prodNameLabel.text = "Product Name"
        costTitleLabel.text = "Cost"
        amountTitleLabel.text = "Amount"
        
        prodNameTextField.placeholder = selectedProduct?.prodName
        costTextField.placeholder = selectedProduct?.prodPrice
        amountTextField.placeholder = selectedProduct?.prodTotal
        
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
        }
        
        prodNameLabel.snp.makeConstraints { make in
            make.top.equalTo(50)
            make.leading.equalTo(20)
        }
        
        prodNameTextField.snp.makeConstraints { make in
            make.top.equalTo(prodNameLabel.snp.bottom).offset(11)
            make.leading.equalTo(21)
        }
        
        costTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(prodNameTextField.snp.bottom).offset(25)
            make.leading.equalTo(20)
        }
        
        costTextField.snp.makeConstraints { make in
            make.top.equalTo(costTitleLabel.snp.bottom).offset(11)
            make.leading.equalTo(21)
        }
        
        amountTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(costTextField.snp.bottom).offset(25)
            make.leading.equalTo(20)
        }
        
        amountTextField.snp.makeConstraints { make in
            make.top.equalTo(amountTitleLabel.snp.bottom).offset(11)
            make.leading.equalTo(21)
        }
        
        updateButton.snp.makeConstraints { make in
            make.top.equalTo(amountTextField.snp.bottom).offset(120)
            make.centerX.equalToSuperview()
            
        }
    }
    
    
    //MARK: - Button Actions
    @objc func saveButtonPressed() {
        print("saveButtonPressed")
    }
    

}
