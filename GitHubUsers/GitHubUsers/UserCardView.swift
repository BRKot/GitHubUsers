//
//  File.swift
//  GitHubUsers
//
//  Created by Databriz on 16/08/2024.
//

import UIKit
import SnapKit

class UserCardView: UICollectionViewCell{
    
    var imageView: UIImageView!
    static let identifier = "CustomCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAvatar()
        self.layer.cornerRadius = 24
        self.backgroundColor = UIColor(named: "CardColor")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureAvatar(){
        imageView = UIImageView()
        imageView.image = UIImage(named: "Avatar")
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(16)
            maker.left.equalToSuperview().inset(16)
            maker.right.equalToSuperview().inset(16)
            maker.height.equalTo(imageView.snp.width).multipliedBy(1)
        }
    }
    
}
