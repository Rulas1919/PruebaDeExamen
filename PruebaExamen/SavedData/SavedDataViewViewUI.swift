//
//  SavedDataViewViewUI.swift
//  PruebaExamen
//
//  Created Jose Raul Gastelum Ruiz on 16/06/24.
//  2024 ___ORGANIZATIONNAME___.
//

import Foundation
import UIKit

protocol SavedDataViewViewUIDelegate {
    
}

class SavedDataViewViewUI: UIView{
    var delegate: SavedDataViewViewUIDelegate?
    var navigationController: UINavigationController?
    
//    var elementList: [String] = ["elemento 1", "elemento 2", "elemento 3"]
    var contact: [datos] = []
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(SavedDataTableView.self, forCellReuseIdentifier: SavedDataTableView.indetifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Tabla de Registros"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: SavedDataViewViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            loadContacts()
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadContacts() {
           if let savedData = UserDefaults.standard.data(forKey: "form") {
               let decoder = JSONDecoder()
               if let loadedContacts = try? decoder.decode([datos].self, from: savedData) {
                   contact = loadedContacts
                   tableView.reloadData()
               }
           }
       }
    
    func setUI(){
        self.backgroundColor = .white
        self.addSubview(infoLabel)
        self.addSubview(tableView)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
extension SavedDataViewViewUI: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contact.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SavedDataTableView", for: indexPath)
            let contact = contact[indexPath.row]
            cell.textLabel?.text = "\(contact.firstName) - \(contact.phone)"
            return cell
        }
}






