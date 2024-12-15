//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    // MARK: - Public Properties
    var answers: [Answer]!

    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResult(for: answers)
    }
    
    // MARK: - IB Actions
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func getResult(for answers: [Answer]) {
        var summary: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            summary[animal, default: 0] += 1
        }
        
        let sortedAnimals = summary.sorted { $0.value > $1.value }
        guard let topAnimal = sortedAnimals.first?.key else { return }
        
        updateUI(for: topAnimal)
    }
    
    private func updateUI(for topAnimal: Animal) {
        answerLabel.text = "Вы - \(topAnimal.rawValue)"
        definitionLabel.text = "\(topAnimal.definition)"
    }
    
    // MARK: - Deinitialization
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
    
}
