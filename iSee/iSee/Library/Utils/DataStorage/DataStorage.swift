//
//  DataStorage.swift
//  iSee
//
//  Created by Vlad on 01.12.2019.
//  Copyright © 2019 Vlad. All rights reserved.
//

import KeychainSwift
import NodeKit

final class DataStorage {

    static let shared = DataStorage()

    // MARK: - Favorites Keys

    private enum Keys {
        static let favoriteList = "favoriteList"
    }

    // MARK: - Private Properties

    private static var keychain: KeychainSwift = {
        let keychain = KeychainSwift()
        keychain.synchronizable = false
        return keychain
    }()

    private var keychain: KeychainSwift = {
        return DataStorage.keychain
    }()

    // MARK: - Internal Methods

    func setFavoriteItem(item: ClotheItemEntity) {
        let viewModel = ClotheItemViewModel(with: item)
        let favoritesEntity = getFavorites()
        var favoritesViewModel = favoritesEntity.map({ ClotheItemViewModel(with: $0) })
        favoritesViewModel.append(viewModel)
        let favoritesData = NSKeyedArchiver.archivedData(withRootObject: favoritesViewModel)
        set(data: favoritesData, forKey: Keys.favoriteList)
    }

    func getFavorites() -> [ClotheItemEntity] {
        guard let favoriteListData = getData(forKey: Keys.favoriteList) else {
            return []
        }
        let favoriteArray = NSKeyedUnarchiver.unarchiveObject(with: favoriteListData as Data) as? [ClotheItemViewModel]
        return favoriteArray?.compactMap({ ClotheItemEntity(with: $0) }) ?? []
    }

    func isFavorite(_ item: ClotheItemEntity) -> Bool {
        let favoritesEntity = getFavorites()
        return favoritesEntity.contains(where: { $0.id == item.id })
    }

    func removeFavorites(_ item: ClotheItemEntity) {
        var favoritesEntity = getFavorites()
        guard let findedIndex = favoritesEntity.firstIndex(where: { $0.id == item.id}) else {
            return
        }
        favoritesEntity.remove(at: findedIndex)
        let favoritesViewModel = favoritesEntity.map({ ClotheItemViewModel(with: $0) })
        let favoritesData = NSKeyedArchiver.archivedData(withRootObject: favoritesViewModel)
        set(data: favoritesData, forKey: Keys.favoriteList)
    }

}

// MARK: - Private Properties

private extension DataStorage {

    func set(data: Data?, forKey key: String) {
        guard let value = data else {
            keychain.delete(key)
            return
        }
        keychain.set(value, forKey: key, withAccess: .accessibleWhenUnlockedThisDeviceOnly)
    }

    func getData(forKey key: String) -> Data? {
        return keychain.getData(key)
    }

}
