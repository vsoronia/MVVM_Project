//
//  MockController.swift
//  IOS Assignment
//
//  Created by SORONIATIS Vasilis on 23/4/24.
//

import Foundation
import Swinject

protocol GraphControllerType {
    var assembler: Assembler { get set}
    func loadAssembly(_ : [Assembly])
}

struct GraphController: GraphControllerType {
    var assembler: Assembler
    func loadAssembly(_ assemblies: [Assembly]) {
        assembler.apply(assemblies: assemblies)
    }
    
    static var shared = GraphController()
    
    private init() {
        assembler = Assembler([ServiceAssembly()])
    }
}


