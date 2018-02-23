//
//  ViewController.swift
//  Planets
//
//  Created by pandani on 2/2/18.
//  Copyright © 2018 KA32. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    let configuration =  ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = []
        self.sceneView.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let sun = SCNNode()
        let mercuryParent = SCNNode()
        let venusParent = SCNNode()
        let earthParent = SCNNode()
        let marsParent = SCNNode()
        let jupiterParent = SCNNode()
        let saturnParent = SCNNode()
        let uranusParent = SCNNode()
        let neptuneParent = SCNNode()
        
        let moonParent = SCNNode()
        sun.geometry = SCNSphere(radius: 0.25)
        sun.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "sun_diffuse")
        sun.position = SCNVector3(0, -0.5, -1)
        self.sceneView.scene.rootNode.addChildNode(sun)
        
        self.sceneView.scene.rootNode.addChildNode(mercuryParent)
        self.sceneView.scene.rootNode.addChildNode(venusParent)
        self.sceneView.scene.rootNode.addChildNode(earthParent)
        self.sceneView.scene.rootNode.addChildNode(marsParent)
        self.sceneView.scene.rootNode.addChildNode(jupiterParent)
        self.sceneView.scene.rootNode.addChildNode(saturnParent)
        self.sceneView.scene.rootNode.addChildNode(uranusParent)
        self.sceneView.scene.rootNode.addChildNode(neptuneParent)

        let planetScale = SCNVector3(0, -0.5, -1)
        mercuryParent.position = planetScale
        venusParent.position = planetScale
        earthParent.position = planetScale
        marsParent.position = planetScale
        jupiterParent.position = planetScale
        saturnParent.position = planetScale
        uranusParent.position = planetScale
        neptuneParent.position = planetScale
        
        moonParent.position = SCNVector3(1, 0, 0)
        
        /** Planets **/
        let mercury = planet(geometry: SCNSphere(radius: 0.038 ), diffuse: #imageLiteral(resourceName: "mercury"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(0, 0, 0.5))
        let venus = planet(geometry: SCNSphere(radius: 0.095 ), diffuse: #imageLiteral(resourceName: "Venus Surface"), specular: nil, emmision: #imageLiteral(resourceName: "Venus Atmosphere"), normal: nil, position: SCNVector3(0, 0, 0.8))
        let earth  = planet(geometry: SCNSphere(radius: 0.1), diffuse: #imageLiteral(resourceName: "earth_day"), specular: nil, emmision: #imageLiteral(resourceName: "earth_emmision"), normal: nil, position: SCNVector3(1.2, 0, 0))
        let mars = planet(geometry: SCNSphere(radius: 0.053 ), diffuse: #imageLiteral(resourceName: "mars"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(0, 0, 1.5))
        let jupiter = planet(geometry: SCNSphere(radius: 0.23 ), diffuse: #imageLiteral(resourceName: "jupiter"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(2, 0, 0))
        
        let saturn = planet(geometry: SCNSphere(radius: 0.19 ), diffuse: #imageLiteral(resourceName: "saturn"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(0, 0, 2.3))
        let uranus = planet(geometry: SCNSphere(radius: 0.15 ), diffuse: #imageLiteral(resourceName: "uranus"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(2.6, 0, 0))
        
        let neptune = planet(geometry: SCNSphere(radius: 0.13 ), diffuse: #imageLiteral(resourceName: "neptune") , specular: nil, emmision: nil, normal: nil, position: SCNVector3(0, 0, 3))
        
        //moons
        let moon = planet(geometry: SCNSphere(radius: 0.02), diffuse: #imageLiteral(resourceName: "moon"), specular: nil, emmision: nil, normal: nil, position: SCNVector3(0, 0, -0.2))
        
        let mercuryParentAxis = SCNNode()
        let venusParentAxis = SCNNode()
        let mercuryAxis = SCNNode(geometry: SCNTorus(ringRadius:  1, pipeRadius: 0.003))
        let venusAxis = SCNNode(geometry: SCNTorus(ringRadius:  1.5, pipeRadius: 0.003))
        
        mercuryAxis.position = planetScale
        venusAxis.position = planetScale
        
        mercuryParentAxis.addChildNode(mercuryAxis)
        mercuryParentAxis.addChildNode(venusAxis)
        sun.addChildNode(venusAxis)
        
        //let sunAction = rotation(time: 8)
        /* Planet Parent Rotations */
        let moonParentRotation = rotation(time: 5)
        let mercuryParentRotation = rotation(time: 10)
        let venusParentRotation = rotation(time: 15)
        let earthParentRotation = rotation(time: 20)
        let marsParentRotation = rotation(time: 20)
        let jupiterParentRotation = rotation(time: 22)
        let saturnParentRotation = rotation(time: 20)
        let uranusParentRotation = rotation(time: 26)
        let neptuneParentRotation = rotation(time: 30)
        
        
        /* Plante Rotations*/
        let moonRotation = rotation(time: 5)
        
        let mercuryRotation = rotation(time: 5)
        let venusRotation = rotation(time: 18)
        let earthRotation = rotation(time: 8)
        let marsRotation = rotation(time: 10)
        let jupiterRotation = rotation(time: 20)
        let saturnRotation = rotation(time: 18)
        let uranusRotation = rotation(time: 22)
        let neptuneRotation = rotation(time: 21)
        
        moon.runAction(moonRotation)
        mercury.runAction(mercuryRotation)
        venus.runAction(venusRotation)
        earth.runAction(earthRotation)
        mars.runAction(marsRotation)
        jupiter.runAction(jupiterRotation)
        saturn.runAction(saturnRotation)
        uranus.runAction(uranusRotation)
        neptune.runAction(neptuneRotation)
        
        moonParent.runAction(moonParentRotation)
        mercuryParent.runAction(mercuryParentRotation)
        venusParent.runAction(venusParentRotation)
        earthParent.runAction(earthParentRotation)
        marsParent.runAction(marsParentRotation)
        jupiterParent.runAction(jupiterParentRotation)
        saturnParent.runAction(saturnParentRotation)
        uranusParent.runAction(uranusParentRotation)
        neptuneParent.runAction(neptuneParentRotation)
    
        //sun.runAction(sunAction)
        earth.addChildNode(moon)
        
        mercuryParent.addChildNode(mercury)
        venusParent.addChildNode(venus)
        earthParent.addChildNode(earth)
        moonParent.addChildNode(moon)
        earthParent.addChildNode(moonParent)
        
        marsParent.addChildNode(mars)
        jupiterParent.addChildNode(jupiter)
        saturnParent.addChildNode(saturn)
        uranusParent.addChildNode(uranus)
        neptuneParent.addChildNode(neptune)
        
        
    }
    
    func planet(geometry: SCNGeometry, diffuse: UIImage?, specular: UIImage?, emmision: UIImage?, normal: UIImage?, position: SCNVector3) -> SCNNode {
        let planet = SCNNode(geometry: geometry)
        planet.geometry?.firstMaterial?.diffuse.contents = diffuse
        planet.geometry?.firstMaterial?.specular.contents = specular
        planet.geometry?.firstMaterial?.emission.contents = emmision
        planet.geometry?.firstMaterial?.normal.contents = normal
        planet.position = position
        
        return planet;
    }
    
    func rotation(time: TimeInterval) -> SCNAction {
        let Rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: time)
        let foreverRotation = SCNAction.repeatForever(Rotation)
        return foreverRotation
    }
    
}
extension Int {
    var degreeToRadians: Double { return Double(self) * .pi/180}
}
