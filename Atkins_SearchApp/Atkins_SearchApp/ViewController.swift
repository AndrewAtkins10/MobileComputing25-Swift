//
//  ViewController.swift
//  Atkins_SearchApp
//
//  Created by Andrew Atkins on 3/31/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var resultImage: UIImageView!
    
    
    @IBOutlet weak var topicInfoText: UITextView!
    @objc func textFieldDidChange() {
        searchButton.isEnabled = !(searchTextField.text?.isEmpty ?? true)
    }
    var topicsImages = [
        ["stonehenge", "eiffel", "greatwall"],
        ["hubble", "mars", "station"],                      // Space Exploration
        ["bulb", "tele", "airplane"],          // Inventions & Innovations
        ["elephant", "bear", "whale"],             // Wildlife Wonders
        ["rio", "oktober", "chinese"]              // Popular Festivals
    ]
    
    // Keywords for each topic
    let landmarks_keywords = ["landmark", "place", "monument", "attraction", "famous"]
    let space_keywords = ["space", "astronomy", "planet", "galaxy", "cosmos"]
    let inventions_keywords = ["invention", "innovation", "technology", "device", "creation"]
    let wildlife_keywords = ["wildlife", "animal", "nature", "habitat", "creature"]
    let festivals_keywords = ["festival", "celebration", "holiday", "event", "tradition"]
    
    // Descriptions for each image in each topic
    let topics_description = [
        [
            "Stonehenge: A prehistoric monument in England, consisting of massive standing stones.",
            "Eiffel Tower: An iron lattice tower in Paris, France, one of the most recognizable structures in the world.",
            "Great Wall of China: An ancient series of walls and fortifications in northern China."
        ],
        [
            "Hubble Space Telescope: A space telescope that was launched into low Earth orbit in 1990.",
            "Mars Rover: A motor vehicle designed to travel on the surface of Mars.",
            "International Space Station: A modular space station in low Earth orbit."
        ],
        [
            "Light Bulb: One of Thomas Edison's most famous inventions.",
            "Telephone: Alexander Graham Bell's revolutionary communication device.",
            "Airplane: The Wright brothers' invention that changed transportation forever."
        ],
        [
            "African Elephant: The largest land animal on Earth.",
            "Polar Bear: A hypercarnivorous bear native to the Arctic Circle.",
            "Blue Whale: The largest animal known to have ever existed."
        ],
        [
            "Rio Carnival: A festival held before Lent in Rio de Janeiro, Brazil.",
            "Oktoberfest: The world's largest Volksfest held annually in Munich, Germany.",
            "Chinese New Year: The Chinese festival that celebrates the beginning of a new year."
        ]
    ]
    
    var currentTopic: Int = -1  // -1 means no topic selected
    var currentImageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupInitialView()
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    func setupInitialView() {
        resultImage.image = UIImage(named: "welcome")
        topicInfoText.text = "Enter a topic!"
        nextButton.isEnabled = false
        prevButton.isEnabled = false
        searchButton.isEnabled = false
    }
    @IBAction func searchButtonAction(_ sender: UIButton) {
        AudioServicesPlaySystemSound(1113)
        guard let searchText = searchTextField.text?.lowercased() else { return }
        
        // Check which topic matches the search text
        if landmarks_keywords.contains(where: { $0.contains(searchText) }) {
            currentTopic = 0
        } else if space_keywords.contains(where: { $0.contains(searchText) }) {
            currentTopic = 1
        } else if inventions_keywords.contains(where: { $0.contains(searchText) }) {
            currentTopic = 2
        } else if wildlife_keywords.contains(where: { $0.contains(searchText) }) {
            currentTopic = 3
        } else if festivals_keywords.contains(where: { $0.contains(searchText) }) {
            currentTopic = 4
        } else {
            // No match found
            currentTopic = -1
            resultImage.image = UIImage(named: "notfound")
            topicInfoText.text = "No result found for \(searchText)"
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            return
        }
        
        // Show first image of the matched topic
        currentImageIndex = 0
        updateImageAndDescription()
        updateButtonStates()
        
    }
    
    @IBAction func ShowNextImageBtn(_ sender: Any) {
        AudioServicesPlaySystemSound(1105)
        currentImageIndex += 1
        updateImageAndDescription()
        updateButtonStates()
    }
    
    @IBAction func ResetBtn(_ sender: Any) {
        AudioServicesPlaySystemSound(1111)
        setupInitialView()
        currentTopic = -1
        currentImageIndex = 0
        searchTextField.text = ""    }
    
    @IBAction func ShowPrevImageBtn(_ sender: Any) {
        AudioServicesPlaySystemSound(1105)
        currentImageIndex -= 1
        updateImageAndDescription()
        updateButtonStates()
    }
    func updateImageAndDescription() {
        guard currentTopic >= 0 && currentTopic < topicsImages.count else { return }
        guard currentImageIndex >= 0 && currentImageIndex < topicsImages[currentTopic].count else { return }
        
        let imageName = topicsImages[currentTopic][currentImageIndex]
        resultImage.image = UIImage(named: imageName)
        
        if currentTopic < topics_description.count && currentImageIndex < topics_description[currentTopic].count {
            topicInfoText.text = topics_description[currentTopic][currentImageIndex]
        }
    }
    func updateButtonStates() {
        guard currentTopic >= 0 && currentTopic < topicsImages.count else {
            nextButton.isEnabled = false
            prevButton.isEnabled = false
            return
        }
        
        // Enable/disable next button
        nextButton.isEnabled = currentImageIndex < topicsImages[currentTopic].count - 1
        
        // Enable/disable previous button
        prevButton.isEnabled = currentImageIndex > 0
    }
}

