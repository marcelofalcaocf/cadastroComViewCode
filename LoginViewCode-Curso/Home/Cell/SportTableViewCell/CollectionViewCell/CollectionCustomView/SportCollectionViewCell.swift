//
//  SportCollectionViewCell.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 22/08/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    static let indetifier: String = "SportCollectionViewCell"
    
    let sportCollectionViewCellScreen: SportCollectionViewCellScreen = SportCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.sportCollectionViewCellScreen.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.sportCollectionViewCellScreen)
    }
    
    func configContraints() {
        NSLayoutConstraint.activate([
            self.sportCollectionViewCellScreen.topAnchor.constraint(equalTo: self.topAnchor),
            self.sportCollectionViewCellScreen.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.sportCollectionViewCellScreen.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.sportCollectionViewCellScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
