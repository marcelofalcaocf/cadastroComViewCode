//
//  SportTableViewCell.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 19/08/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
    
    var sportTableViewCellScreen: SportTableViewCellScreen = SportTableViewCellScreen()

    static let identifier: String = "SportTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.configContraints()
        self.sportTableViewCellScreen.configProtocolsCollectionView(delegate: self, dataSouce: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.sportTableViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(sportTableViewCellScreen)
    }
    
    func configContraints() {
        self.sportTableViewCellScreen.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SportTableViewCell: UICollectionViewDelegate {
    
}

extension SportTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell: SportCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.indetifier, for: indexPath) as? SportCollectionViewCell
        cell?.setupCell(data: Sport(name: "Corrida", nameImage: "corrida"))
        
            return cell ?? UICollectionViewCell()
    }
}

extension SportTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 100)
    } // setar o tamanho da celula da collection view cell, altura e largura
}
