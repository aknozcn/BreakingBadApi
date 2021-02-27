//
//  ViewController.swift
//  BreakingBadApi
//
//  Created by sh3ll on 13.02.2021.
//

import UIKit
import CardSlider
import Kingfisher

class ViewController: UIViewController, CardSliderDataSource {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonCardSlider: UIButton!
    var data = [Item]()
    var chars = [Chars]()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonCardSlider.setTitle("LOADING...", for: .normal)
        self.buttonCardSlider.isEnabled = false
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: nil, completion: { response in
            for index in 0..<response.count {
                let urlString = response[index].img
                let url = URL(string: urlString)
                let data = try! Data(contentsOf: url!)

                DispatchQueue.global(qos: .background).async {
                    self.data.append(Item(
                        image: UIImage(data: data)!,
                        rating: nil,
                        title: response[index].name,
                        subtitle: response[index].nickname,
                        description: "Status: \(response[index].status)"
                        ))
                }

                DispatchQueue.main.async {
                    self.buttonCardSlider.setTitle("LOADING...\(index)/\(response.count)", for: .normal)
                }
            }

            DispatchQueue.main.async {
                self.buttonCardSlider.setTitle("SHOW CHARACTERS", for: .normal)
                self.buttonCardSlider.isEnabled = true
            }
        })
    }

    @IBAction func buttonCardSliderClicked(_ sender: UIButton) {

        let vc = CardSliderViewController.with(dataSource: self)
        vc.title = "Breaking Bad Characters"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }


    func item(for index: Int) -> CardSliderItem {
        return data[index]
    }

    func numberOfItems() -> Int {
        return data.count
    }
}

