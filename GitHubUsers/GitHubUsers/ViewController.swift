//
//  ViewController.swift
//  GitHubUsers
//
//  Created by Databriz on 16/08/2024.
//

import SnapKit
import UIKit

class ViewController: UIViewController {

    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupCollectionView()
    }

    private func setupCollectionView() {
        // Создаем layout
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        // Создаем коллекцию
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Регистрируем кастомную ячейку
        collectionView.register(UserCardView.self, forCellWithReuseIdentifier: UserCardView.identifier)
        
        // Добавляем коллекцию в view
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            maker.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(16)
            maker.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-16)
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}

// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // Количество ячеек
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserCardView.identifier, for: indexPath) as? UserCardView else {
            return UICollectionViewCell()
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Ширина ячейки с учетом отступов
        let totalSpacing: CGFloat = 10 // Между ячейками в одной строке
        let numberOfItemsPerRow: CGFloat = 2
        
        let width = (collectionView.bounds.width - (numberOfItemsPerRow - 1) * totalSpacing - collectionView.contentInset.left - collectionView.contentInset.right) / numberOfItemsPerRow
        
        // Соотношение сторон 79 к 117
        let height = width * (117 / 79)
        
        return CGSize(width: width, height: height)
    }
}
