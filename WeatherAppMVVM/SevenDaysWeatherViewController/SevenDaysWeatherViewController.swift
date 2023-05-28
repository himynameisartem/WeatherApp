//
//  SevenDaysWeatherViewController.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 26.05.2023.
//

import UIKit

class SevenDaysWeatherViewController: UIViewController {
    
    private var backgroundView: UIView!
    private var gradient: CAGradientLayer!
    private var calendarSign: UIImageView!
    private var sevenDaysLabel: UILabel!
    private var backButton: UIButton!
    private var weatherImage: UIImageView!
    private var tommorowLabel: UILabel!
    private var tempLabel: UILabel!
    private var minTempLabel: UILabel!
    private var weatherDiscription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSettings()
        setupConstraints()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = backgroundView.bounds
        
    }

    
    private func setupUI() {
        backgroundView = UIView()
        calendarSign = UIImageView()
        sevenDaysLabel = UILabel()
        backButton = UIButton()
        gradient = CAGradientLayer()
        weatherImage = UIImageView()
        tommorowLabel = UILabel()
        tempLabel = UILabel()
        minTempLabel = UILabel()
        weatherDiscription = UILabel()
        
        view.addSubview(backgroundView)
        backgroundView.layer.addSublayer(gradient)
        backgroundView.addSubview(backButton)
        backgroundView.addSubview(calendarSign)
        backgroundView.addSubview(sevenDaysLabel)
        backgroundView.addSubview(weatherImage)
        backgroundView.addSubview(tommorowLabel)
        backgroundView.addSubview(tempLabel)
        backgroundView.addSubview(minTempLabel)
        backgroundView.addSubview(weatherDiscription)
    }
    
    private func setupSettings() {
        
        let topColor = #colorLiteral(red: 0.08297913522, green: 0.7363885045, blue: 0.9625709653, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.06859397143, green: 0.4181304872, blue: 0.9508929849, alpha: 1).cgColor
        gradient.colors = [topColor, bottomColor]
        gradient.locations = [0, 1]
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.layer.cornerRadius = 42
        backgroundView.backgroundColor = .blue
        backgroundView.clipsToBounds = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(UIImage(systemName: "chevron.left.circle"), for: .normal)
        backButton.tintColor = .white
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        calendarSign.translatesAutoresizingMaskIntoConstraints = false
        calendarSign.image = UIImage(systemName: "calendar")
        calendarSign.tintColor = .white
        
        sevenDaysLabel.translatesAutoresizingMaskIntoConstraints = false
        sevenDaysLabel.font = UIFont(name: "helvetica-bold", size: 18)
        sevenDaysLabel.textColor = .white
        sevenDaysLabel.textAlignment = .center
        sevenDaysLabel.text = "7 Days"
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.image = UIImage(named: "showers-day")
        weatherImage.contentMode = .scaleAspectFit
        
        tommorowLabel.translatesAutoresizingMaskIntoConstraints = false
        tommorowLabel.font = UIFont(name: "helvetica", size: 16)
        tommorowLabel.text = "Tommorow"
        tommorowLabel.textAlignment = .left
        tommorowLabel.textColor = .white
        
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont(name: "helvetica-bold", size: 50)
        tempLabel.textColor = .white
        tempLabel.text = "20.0°"
        tempLabel.textAlignment = .left
        
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.font = UIFont(name: "helvetica-bold", size: 30)
        minTempLabel.textColor = .white
        minTempLabel.alpha = 0.5
        minTempLabel.textAlignment = .left
        minTempLabel.text = "/17°"
        
        weatherDiscription.translatesAutoresizingMaskIntoConstraints = false
        weatherDiscription.font = UIFont(name: "helvetica-light", size: 14)
        weatherDiscription.textColor = .white
        weatherDiscription.textAlignment = .left
        weatherDiscription.alpha = 0.5
        weatherDiscription.text = "Rainy - cloudy"
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            backgroundView.heightAnchor.constraint(equalToConstant: view.frame.height / 3),
            
            backButton.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            
            sevenDaysLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            sevenDaysLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            calendarSign.centerYAnchor.constraint(equalTo: sevenDaysLabel.centerYAnchor),
            calendarSign.trailingAnchor.constraint(equalTo: sevenDaysLabel.leadingAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: sevenDaysLabel.bottomAnchor, constant: 20),
            weatherImage.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            weatherImage.widthAnchor.constraint(equalToConstant: view.frame.width / 2 - 10),
            weatherImage.heightAnchor.constraint(equalToConstant: (view.frame.height / 3) / 2.5),
            
            tempLabel.centerYAnchor.constraint(equalTo: weatherImage.centerYAnchor),
            tempLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            
            minTempLabel.bottomAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            minTempLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor),
            
            tommorowLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor),
            tommorowLabel.bottomAnchor.constraint(equalTo: tempLabel.topAnchor),
            
            weatherDiscription.topAnchor.constraint(equalTo: tempLabel.bottomAnchor),
            weatherDiscription.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor)
        ])
    }
 
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
}
