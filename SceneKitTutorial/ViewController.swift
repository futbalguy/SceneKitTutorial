//
//  ViewController.swift
//  SceneKitTutorial
//
//  Created by Kyle Rokita on 8/18/15.
//  Copyright (c) 2015 RokShop. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sceneView = SCNView(frame: self.view.frame)
        self.view.addSubview(sceneView)
        
        let scene = SCNScene()
        sceneView.scene = scene
        
        let camera = SCNCamera()
        let cameraNode = SCNNode()
        cameraNode.camera = camera
        
        let light = SCNLight()
        light.type = SCNLightTypeOmni
        let lightNode = SCNNode()
        lightNode.light = light
        lightNode.position = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
        
        let cubeGeometry = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
        let cubeNode = SCNNode(geometry: cubeGeometry)
        
        let planeGeometry = SCNPlane(width: 100.0, height: 100.0)
        let planeNode = SCNNode(geometry: planeGeometry)
        planeNode.eulerAngles = SCNVector3(x: GLKMathDegreesToRadians(-90), y: 0, z: 0)
        planeNode.position = SCNVector3(x: 0, y: -0.5, z: 0)
        
        let redMaterial = SCNMaterial()
        redMaterial.diffuse.contents = UIColor.redColor()
        cubeGeometry.materials = [redMaterial]
        
        let greenMaterial = SCNMaterial()
        greenMaterial.diffuse.contents = UIColor.greenColor()
        planeGeometry.materials = [greenMaterial]
        
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(cubeNode)
        scene.rootNode.addChildNode(planeNode)

        cameraNode.position = SCNVector3(x: -3.0, y: 3.0, z: 3.0)
        
        let constraint = SCNLookAtConstraint(target: cubeNode)
        constraint.gimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        
        //allows user to move camera with touch
        sceneView.allowsCameraControl = true

    }

}

