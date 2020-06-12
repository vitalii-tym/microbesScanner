//
//  HandAR.swift
//  WashHands
//
//  Created by Vitaliy Tim on 30.05.2020.
//  Copyright © 2020 Vitalii Tymoshenko. All rights reserved.
//

import SwiftUI
import ARKit

struct HandARView: UIViewRepresentable {

//    let scene = SCNScene(named: "art.scnassets/ship.scn")!

    @EnvironmentObject var handARSCNObservableObject: HandARSCNObservableObject

    func makeUIView(context: Context) -> ARSCNView {
        // create and add a camera to the scene
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        //scene.rootNode.addChildNode(cameraNode)
//
//        // place the camera
//        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
//
//        // create and add a light to the scene
//        let lightNode = SCNNode()
//        lightNode.light = SCNLight()
//        lightNode.light!.type = .omni
//        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
//        //scene.rootNode.addChildNode(lightNode)
//
//        // create and add an ambient light to the scene
//        let ambientLightNode = SCNNode()
//        ambientLightNode.light = SCNLight()
//        ambientLightNode.light!.type = .ambient
//        ambientLightNode.light!.color = UIColor.darkGray
        //scene.rootNode.addChildNode(ambientLightNode)

        // retrieve the ship node
        //let ship = scene.rootNode.childNode(withName: "ship", recursively: true)!

        // animate the 3d object
        //ship.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 1)))

        return handARSCNObservableObject.handARSCNView
    }

    func updateUIView(_ sceneView: ARSCNView, context: Context) {

        // allows the user to manipulate the camera
 //       scnView.allowsCameraControl = true

        // show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        // configure the view
        sceneView.backgroundColor = UIColor.black
    }
}

#if DEBUG
struct HandAR_Previews: PreviewProvider {
    static var previews: some View {
        HandARView()
    }
}
#endif
