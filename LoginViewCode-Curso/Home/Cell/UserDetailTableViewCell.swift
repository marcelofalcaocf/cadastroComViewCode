//
//  UserDetailTableViewCell.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 18/08/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {

    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit // aspecto da imagem
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(self.userImageView) //para celular temos que add o contentView para poder selecionar a celula e nao uma view
        self.contentView.addSubview(self.nameLabel)
    }
    
    public func setUpCell(data: DataUser) {
        self.nameLabel.text = data.name
        self.userImageView.image = UIImage(named: data.nameImage)
    }
    
    private func setUpContraints() {
        NSLayoutConstraint.activate([
        
            
            self.userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.userImageView.heightAnchor.constraint(equalToConstant: 80),
            self.userImageView.widthAnchor.constraint(equalToConstant: 80),
            
            
            self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 20)
        ])
    }

}
