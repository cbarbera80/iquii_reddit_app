//
//  Coordinator.swift
//  IQUIIGalleryApp
//
//  Created by claudio barbera on 15/07/2020.
//  Copyright © 2020 iquii. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
    var coordinators: [Coordinator] { get set }
}

extension Coordinator {
    
    func removeCoordinator<T>(_ coordinator: T) {
        
        for (index, coordinator) in self.coordinators.enumerated() where coordinator is T {
            self.coordinators.remove(at: index)
            break
        }
    }
}
