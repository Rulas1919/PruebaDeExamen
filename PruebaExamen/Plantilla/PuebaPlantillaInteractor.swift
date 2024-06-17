//
//  PuebaPlantillaInteractor.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 13/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
class PuebaPlantillaInteractor{
    var presenter: PuebaPlantillaPresenterProtocol?
    
    
    
}

extension PuebaPlantillaInteractor: PuebaPlantillaInteractorProtocol {
    func saveDataUser(firstName: String, lastName: String, middleName: String, email: String, phone: String) {
        let defaults = UserDefaults.standard
        if let dataValue: [datos] = defaults.value(forKey: "form") as? [datos] {
            
            var form: [datos] = dataValue
            let data: datos = datos(firstName:  firstName,
                                    lastName:  lastName,
                                    middleName: middleName,
                                    email: email,
                                    phone: phone)
            form.append(data)
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(form) {
                        UserDefaults.standard.set(encodedData, forKey: "form")
                    }
            presenter?.formSavedSuccessfully()
            
        } else {
            var form: [datos] = []
            let data: datos = datos(firstName:  firstName,
                                    lastName:  lastName,
                                    middleName: middleName,
                                    email: email,
                                    phone: phone)
            form.append(data)
            let encoder = JSONEncoder()
            if let encodedData = try? encoder.encode(form) {
                        UserDefaults.standard.set(encodedData, forKey: "form")
                    }
            presenter?.formSavedSuccessfully()
        }
        
        
    }
    
}
public struct userData: Codable {
    var datos: [datos]
}
public struct datos: Codable {
    var firstName: String
    var lastName: String
    var middleName: String
    var email: String
    var phone: String
    
    init(firstName: String, lastName: String, middleName: String, email: String, phone: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.email = email
        self.phone = phone
    }
}
