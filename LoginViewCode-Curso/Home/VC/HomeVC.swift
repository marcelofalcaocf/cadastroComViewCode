//
//  HomeVC.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 17/08/22.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen: HomeScreen?
    
    var data: [DataUser] = [DataUser(name: "Marcelo", nameImage: "fotoUm"),
                            DataUser(name: "Gabriel", nameImage: "fotoDois"),
                            DataUser(name: "Bruno", nameImage: "fotoTres")
    ]
    
    override func loadView() {
        self.homeScreen = HomeScreen()
        self.view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeScreen?.configTableViewProtocols(delegate: self, dataSource: self)
        // Do any additional setup after loading the view.
    }

}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { // tamanho da celula
        return 120
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 3 { // Ou poderia ser indexPath.row == 3 {}
            let cell: SportTableViewCell? = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
            
            return cell ?? UITableViewCell()
        }
        
        if let cell: UserDetailTableViewCell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell {
            cell.setUpCell(data: self.data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}


