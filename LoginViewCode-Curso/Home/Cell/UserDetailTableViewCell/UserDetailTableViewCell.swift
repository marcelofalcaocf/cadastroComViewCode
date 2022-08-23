//
//  UserDetailTableViewCell.swift
//  LoginViewCode-Curso
//
//  Created by Marcelo Falcao Costa Filho on 18/08/22.
//

import UIKit
import SnapKit

class UserDetailTableViewCell: UITableViewCell {

    static let identifier: String = "UserDetailTableViewCell"
    
    lazy var userDetailView: UserDetailView = {
        let view = UserDetailView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview()
        self.configContraintsDescriptionCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.contentView.addSubview(userDetailView)
    }
    
    public func setUpCell(data: DataUser) {
        self.userDetailView.nameLabel.text = data.name
        self.userDetailView.userImageView.image = UIImage(named: data.nameImage)
    }

    private func configContraintsDescriptionCell() {
        self.userDetailView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // setar todas as 4 constraints
        }
    }
}
