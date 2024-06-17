//
//  PuebaPlantillaView.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit
class PuebaPlantillaView: UIViewController {
    var presenter: PuebaPlantillaPresenterProtocol?
    private var ui: PuebaPlantillaViewUI?
    
    
    override func loadView() {
        ui = PuebaPlantillaViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
        notificationKeybord()
    }
    
    func notificationKeybord(){
            NotificationCenter.default.addObserver(self, selector: #selector(PuebaPlantillaView.keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification , object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(PuebaPlantillaView.keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }

        @objc func keyboardWillShow(sender: NSNotification) {
            view.frame.origin.y = -150 // Move view 150 points upward
        }
        @objc func keyboardWillHide(sender: NSNotification) {
            view.frame.origin.y = 0 // Move view to original position
        }
    
}

extension PuebaPlantillaView: PuebaPlantillaViewProtocol {
    func formSavedSuccessfully() {
        ui?.firstNameTextField.text = ""
        ui?.lastNameTextField.text = ""
        ui?.middleNameTextField.text = ""
        ui?.emailTextField.text = ""
        ui?.cellPhoneTextField.text = ""
        showSuccessMessage()
    }
    
    
    
    func submitForm(firstName: String, lastName: String, middleName: String, email: String, phone: String) {
        guard firstName != "" && lastName != "" && middleName != "" && email != "" && phone != "" else {
           showErrorMessage("Todos los campos son obligatorios.")
            return
        }
        guard isValidEmail(email) else {
           showErrorMessage("El correo electrónico no es válido.")
            return
        }
        presenter?.saveDataUser(firstName: firstName, lastName: lastName, middleName: middleName, email: email, phone: phone)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func showErrorMessage(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }

    func showSuccessMessage() {
        let alert = UIAlertController(title: "Success", message: "Formulario enviado con éxito", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}



extension PuebaPlantillaView: PuebaPlantillaViewUIDelegate {
    func goToViewTable() {
        let x = SavedDataViewMain.createModule(navigation: self.navigationController!)
        navigationController?.pushViewController(x, animated: true)
    }
    
   
    
    }
    
  
  

