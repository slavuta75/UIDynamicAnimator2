//
//  ViewController.swift
//  UIDynamic2
//
//  Created by Slava Utyuzh on 26.06.2018.
//  Copyright © 2018 Slava Utyuzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //012012012012
    //010101010101
    //123456789
    //UIAttachmentBehavior - привязка
    //UISnapBehavior - снимок
    
    var squareView = UIView()
//    var squareViewAnchorView = UIView()
//    var anchorView = UIView()
    var animator = UIDynamicAnimator()
//    var attachmentBehavior: UIAttachmentBehavior?
    var snapBehavior: UISnapBehavior?

    override func viewDidLoad() {
        super.viewDidLoad()
//        createGestureRecognizer()
//        creatSmallSquareView()
//        createAnchorView()
//        createAnimationAndBehaviors()
        creatGestureRecognizer()
        createSmallSquare()
        createAnimatorAndBehavior()
    }
    
    func creatGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func createSmallSquare() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        squareView.backgroundColor = .blue
        squareView.center = view.center
        view.addSubview(squareView)
    }

    func createAnimatorAndBehavior() {
        animator = UIDynamicAnimator(referenceView: view)
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    //зацеп
        snapBehavior = UISnapBehavior(item: squareView, snapTo: squareView.center)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
        }
    
    @objc func handleTap(parameterTap: UITapGestureRecognizer) {
        //получаем угол между центром квадрата и точкой касания
        let tap = parameterTap.location(in: view)
        if snapBehavior != nil {
            animator.removeBehavior(snapBehavior!)
        }
        snapBehavior = UISnapBehavior(item: squareView, snapTo: tap)
        snapBehavior?.damping = 0.5
        animator.addBehavior(snapBehavior!)
        
    }
    //    //создаем квадрат и в нем еще один
//    func creatSmallSquareView(){
//        squareView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        squareView.backgroundColor = .red
//        squareView.center = view.center
//        squareViewAnchorView = UIView(frame: CGRect(x: 70, y: 0, width: 30, height: 30))
//        squareViewAnchorView.backgroundColor = .green
//        squareView.addSubview(squareViewAnchorView)
//        view.addSubview(squareView)
//        }
//
//    //view с точкой привязки
//    func createAnchorView() {
//        anchorView = UIView(frame: CGRect(x: 140, y: 140, width: 30, height: 30))
//        anchorView.backgroundColor = .yellow
//        view.addSubview(anchorView)
//    }
//
//    //создадим регистратор жеста
//    func createGestureRecognizer() {
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
//        view.addGestureRecognizer(panGestureRecognizer)
//    }
//
//    //создаем столкновение и прикрепление
//    func createAnimationAndBehaviors() {
//        animator = UIDynamicAnimator(referenceView: view)
//        //столкновения
//        let collision = UICollisionBehavior(items: [squareView])
//        collision.translatesReferenceBoundsIntoBoundary = true
//        attachmentBehavior = UIAttachmentBehavior(item: squareView, attachedToAnchor: anchorView.center)
//        animator.addBehavior(collision)
//        animator.addBehavior(attachmentBehavior!)
//    }
//
//    //определяет где палец и туда передает желтый квадрат а потом привязка к большому
//    @objc func handlePan(paramPan: UIPanGestureRecognizer) {
//        let tapPoint = paramPan.location(in: view)
//        print(tapPoint)
//        attachmentBehavior?.anchorPoint = tapPoint
//        anchorView.center = tapPoint
//
//    }

}

