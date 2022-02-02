//
//  ViewController.swift
//  RandomPhotoGenerator-Storyboard
//
//  Created by MacBook on 02.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors : [UIColor] = [
        .systemPink,
        .systemPurple,
        .systemOrange,
        .systemGreen,
        .systemBlue,
        .systemYellow
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        super.view.backgroundColor = .systemBrown
        super.view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        imageView.center.y = view.center.y
        imageView.center.x = view.center.x
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        
        super.view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 40, y: view.frame.size.height-100-view.safeAreaInsets.bottom, width: view.frame.size.width-80, height: 60)
        button.layer.cornerRadius = 15
        
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }


}

