//
//  HandARSceneObservableObject.swift
//  WashHands
//
//  Created by Vitaliy Tim on 30.05.2020.
//  Copyright © 2020 Vitalii Tymoshenko. All rights reserved.
//

import UIKit
import ARKit

class HandARSCNObservableObject: ObservableObject {

    @Published var handARSCNView = ARSCNView()
    @Published var numOfMicrobesVisible = 5
}
