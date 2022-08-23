//
//  UserDetailView.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 19/08/22.
//

import UIKit

class UserDetailView: UIView {

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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.setUpContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.addSubview(self.userImageView) //para celula temos que add o contentView para poder selecionar a celula e nao uma view
        self.addSubview(self.nameLabel)
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
    
    
//    func configUserImageViewConstraints() {
//        self.userImageView.snp.makeConstraints { make in
//            make.centerY.leading.equalToSuperview()
//            make.height.width.equalTo(80)
//        }
//    }
//
//    func configNomeLabelConstraints() {
//        self.nameLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
//        }
//    }
}
