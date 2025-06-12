//
//  NextDaysTableViewCell:.swift
//  WeatherAppMVVM
//
//  Created by Артем Кудрявцев on 03.06.2023.
//

import UIKit

class NextDaysTableViewCell: UITableViewCell {
    
    private var weekdayLabel: UILabel!
    private var weatherImage: UIImageView!
    private var descriptionLabel: UILabel!
    private var maxTempLabel: UILabel!
    private var minTempLabel: UILabel!
    
    var viewModel: NextDaysTableViewCellViewModelProtocol! {
        didSet {
            DispatchQueue.main.async {
                self.weekdayLabel.text = self.viewModel.weekday
                self.weatherImage.image = UIImage(named: self.viewModel.imageName)
                self.descriptionLabel.text = self.viewModel.desription
                self.maxTempLabel.text = self.viewModel.maxTemp
                self.minTempLabel.text = self.viewModel.minTemp
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        setupSettings()
        setupConstraints()
    }
    
    private func setupUI() {
        
        weekdayLabel = UILabel()
        weatherImage = UIImageView()
        descriptionLabel = UILabel()
        maxTempLabel = UILabel()
        minTempLabel = UILabel()
        
        addSubview(weekdayLabel)
        addSubview(weatherImage)
        addSubview(descriptionLabel)
        addSubview(maxTempLabel)
        addSubview(minTempLabel)
    }
    
    private func setupSettings() {
        weekdayLabel.translatesAutoresizingMaskIntoConstraints = false
        weekdayLabel.font = UIFont(name: "helvetica-bold", size: 18)
        weekdayLabel.textColor = UIColor(named: "textColor")
        weekdayLabel.alpha = 0.5
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.contentMode = .scaleAspectFit
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont(name: "helvetica", size: 10)
        descriptionLabel.textColor = UIColor(named: "textColor")
        descriptionLabel.alpha = 0.5
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.5
        maxTempLabel.translatesAutoresizingMaskIntoConstraints = false
        maxTempLabel.font = UIFont(name: "helvetica-bold", size: 18)
        maxTempLabel.textColor = UIColor(named: "textColor")
        minTempLabel.translatesAutoresizingMaskIntoConstraints = false
        minTempLabel.font = UIFont(name: "helvetica", size: 12)
        minTempLabel.textColor = UIColor(named: "textColor")
        minTempLabel.alpha = 0.5
        minTempLabel.contentMode = .bottom
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            weekdayLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            weekdayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            weekdayLabel.widthAnchor.constraint(equalToConstant: 40),
            weatherImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherImage.leadingAnchor.constraint(equalTo: weekdayLabel.trailingAnchor, constant: 40),
            weatherImage.heightAnchor.constraint(equalToConstant: 30),
            weatherImage.widthAnchor.constraint(equalToConstant: 30),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: weatherImage.trailingAnchor, constant: 5),
            minTempLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 2.5),
            minTempLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            minTempLabel.widthAnchor.constraint(equalToConstant: 35),
            maxTempLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            maxTempLabel.trailingAnchor.constraint(equalTo: minTempLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: maxTempLabel.leadingAnchor, constant: -10)
        ])
    }
}
