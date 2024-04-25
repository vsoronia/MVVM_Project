//
//  MockController.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/4/24.
//

import Foundation
import Swinject

protocol GraphControllerType {
    var assembler: Assembler { get }
    func loadAssemblies(_ : [Assembly])
}

class GraphController: GraphControllerType {
    var assembler: Assembler
    func loadAssemblies(_ assemblies: [Assembly]) {
        assembler = Assembler()
        assembler.apply(assemblies: assemblies)
    }
    
    static var shared = GraphController()
    
    private init() {
        assembler = Assembler()
    }
}

extension GraphController {
  
  func resolve<T>(_ type: T.Type) -> T {
    assembler.resolver.resolve(type)!
  }
}
