//
//  HomeVCViewController.swift
//  LoginViewCode
//
//  Created by ALYSSON MENEZES on 25/05/22.
//

import UIKit

class HomeVC: UIViewController{
    var  homeScreen : HomeScreen?
    var dataUser : [ DataUser] = [ DataUser(name: " Alysson ", nameImage: "user1"),
                             DataUser(name: " Ane", nameImage: "user2"),
                             DataUser(name: " Aline ", nameImage: "user3")]
    
    var dataSport: [ Sport] = [ Sport(name: "Corrida", nameImage: "user1"),
                                Sport(name: "Ciclismo", nameImage: "user2"),
                                Sport(name: "Nataçao", nameImage: "user3"),
                                Sport(name: "Caminhada", nameImage: "user1")]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.dataUser.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3{
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            cell?.dataCollection(data: self.dataSport)
            return cell ?? UITableViewCell()
        }
        
        let cell : UserDetailTableViewCell? = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
        cell?.setUpCell(data: self.dataUser[ indexPath.row])
        return cell ?? UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 
    }
}
