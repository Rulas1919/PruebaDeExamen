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
   
}

class PuebaPlantillaViewUI: UIView{
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
        cellphone.translatesAutoresizingMaskIntoConstraints = false
        return cellphone
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: PuebaPlantillaViewUIDelegate){
        self.init()
        self.delegate = delegate
        self.navigationController = navigation
            
        setUI()
        setConstrains()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
 
    
    func setUI(){
        self.backgroundColor = .white
        stackView.addArrangedSubview(firstNameTextField)
        stackView.addArrangedSubview(lastNameTextField)
        stackView.addArrangedSubview(middleNameTextField)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(cellPhoneTextField)
        self.addSubview(stackView)

    }

    func setConstrains(){
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        
        
        ])
    }

}




