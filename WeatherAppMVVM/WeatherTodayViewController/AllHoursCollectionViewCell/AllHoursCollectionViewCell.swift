//
//  AllHoursCollectionViewCell.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 23.05.2023.
//

import UIKit

class AllHoursCollectionViewCell: UICollectionViewCell {
    
    private var tempLabel: UILabel!
    private var weatherImage: UIImageView!
    private var timeLabel: UILabel!
    
    var viewModel: AllHoursCollectionViewCellViewModelProtocol! {
        didSet {
            self.tempLabel.text = String(viewModel.temp)
            self.weatherImage.image = UIImage(named: viewModel.image)
            self.timeLabel.text = String(viewModel.time.dropLast(3))
        }
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        setupUI()
        setupProperties()
        setupConstraints()
    }
    
    private func setupUI() {
        tempLabel = UILabel()
        weatherImage = UIImageView()
        timeLabel = UILabel()
        
        addSubview(tempLabel)
        addSubview(weatherImage)
        addSubview(timeLabel)
    }
    
    private func setupProperties() {
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.font = UIFont(name: "helvetica-Bold", size: 12)
        tempLabel.textColor = UIColor(named: "textColor")
        
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.contentMode = .scaleAspectFit
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont(name: "helvetica-light", size: 10)
        timeLabel.textColor = UIColor(named: "textColor")
        timeLabel.alpha = 0.5
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tempLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            weatherImage.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 0),
            weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            weatherImage.heightAnchor.constraint(equalToConstant: frame.height / 2),
            
            timeLabel.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 2),
            timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -2)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
