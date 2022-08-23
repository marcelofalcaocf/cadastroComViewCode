//
//  SportCollectionViewCellScreen.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 22/08/22.
//

import UIKit

class SportCollectionViewCellScreen: UIView {

    lazy var viewBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.addSubview(self.viewBackGround)
    }
    
    func configContraints() {
        NSLayoutConstraint.activate([
            self.viewBackGround.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackGround.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.viewBackGround.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.viewBackGround.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
