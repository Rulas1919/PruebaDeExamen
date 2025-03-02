//
//  PuebaPlantillaViewUI.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol PuebaPlantillaViewUIDelegate {
    func submitForm(firstName: String, lastName: String, middleName: String, email: String, phone: String)
    func goToViewTable()
}

class PuebaPlantillaViewUI: UIView, UITextFieldDelegate{
    var delegate: PuebaPlantillaViewUIDelegate?
    var navigationController: UINavigationController?
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
     lazy var firstNameTextField: UITextField = {
        let firstName = UITextField()
        firstName.borderStyle = .roundedRect
        firstName.placeholder = "Nombre"
        firstName.translatesAutoresizingMaskIntoConstraints = false
        return firstName
        
    }()
    
    lazy var lastNameTextField: UITextField = {
        let lastName = UITextField()
        lastName.borderStyle = .roundedRect
        lastName.placeholder = "Apellido Paterno"
        lastName.translatesAutoresizingMaskIntoConstraints = false
        return lastName
    }()
    
    lazy var middleNameTextField: UITextField = {
        let middleName = UITextField()
        middleName.borderStyle = .roundedRect
        middleName.placeholder = "Apellidos Materno"
        middleName.translatesAutoresizingMaskIntoConstraints = false
        return middleName
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.borderStyle = .roundedRect
        email.placeholder = "Correo Electronico"
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
        
    }()
    
    lazy var cellPhoneTextField: UITextField = {
        let cellphone = UITextField()
        cellphone.borderStyle = .roundedRect
        cellphone.placeholder = "Teléfono Celular"
        cellphone.keyboardType = .numberPad
        cellphone.delegate = self
        cellphone.translatesAutoresizingMaskIntoConstraints = false
        return cellphone
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(submitForm), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var savedData: UIButton = {
        let savedDate = UIButton()
        savedDate.setTitle("Registro de Datos", for: .normal)
        savedDate.backgroundColor = .systemBlue
        savedDate.layer.cornerRadius = 5
        savedDate.addTarget(self, action: #selector(goToViewTable), for: .touchUpInside)
        savedDate.translatesAutoresizingMaskIntoConstraints = false
        return savedDate
        
        
        
    }()
    
    lazy var imagevView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "los-pollos-hermanos")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        
    }()

    public convenience init(
        navigation: UINavigationController,
        delegate: PuebaPlantillaViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
        setUI()
        setConstrains()
            
            
    }

    @objc func submitForm() {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let middleName = middleNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let phone = cellPhoneTextField.text ?? ""

        delegate?.submitForm(firstName: firstName, lastName: lastName, middleName: middleName, email: email, phone: phone)
    }
    
    @objc func DismissKeyboard(){
        self.endEditing(true)
    }
    @objc func goToViewTable(){
        delegate?.goToViewTable()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
    
    func setUI(){
        self.backgroundColor = .white
        self.addSubview(imagevView)
        self.addSubview(stackView)
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(middleNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(cellPhoneTextField)
        stackView.addArrangedSubview(submitButton)
        stackView.addArrangedSubview(savedData)
        
    

    }

    func setConstrains(){
        NSLayoutConstraint.activate([
            
            
            imagevView.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            imagevView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imagevView.widthAnchor.constraint(equalToConstant: 200),
            imagevView.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 230),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            
            

        ])
    }
    
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
            if textField == cellPhoneTextField {
                guard let currentText = textField.text,
                      let range = Range(range, in: currentText) else {
                    return false
                }

                let newText = currentText.replacingCharacters(in: range, with: string)

                return newText.count <= 10
            }

            return true
    }
    
}




