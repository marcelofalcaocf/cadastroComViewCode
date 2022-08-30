//
//  SportTableViewCellScreen.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 19/08/22.
//

import UIKit

class SportTableViewCellScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init()) // jeito nativo do collection view
        collectionView.translatesAutoresizingMaskIntoConstraints = false // sempre false
        collectionView.showsHorizontalScrollIndicator = false // indicador de scroll
        collectionView.backgroundColor = .none   // .white
        collectionView.delaysContentTouches = false // para nao ter delay
        collectionView.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.indetifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init() // Acessar as propriedades da cv
        layout.scrollDirection = .horizontal // para setar que vai ser horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)  // para adicionar esse layout na nossa cv
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.configContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configProtocolsCollectionView(delegate: UICollectionViewDelegate, dataSouce: UICollectionViewDataSource) {
        self.collectionView.delegate = delegate
        self.collectionView.dataSource = dataSouce
    }
    
    func addSubView() {
        self.addSubview(collectionView)
    }
    
    func configContraints() {
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
//    func configContraintsCollectionView() {
//        self.collectionView.snp.makeConstraints { make in
//            make.edges.equalToSuperview() // pega todos os cantos da tela
//        }
//    }
}
