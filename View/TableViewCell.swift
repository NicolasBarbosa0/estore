//
//  TableViewCell.swift
//  estore
// 
//  Created by Nicolas Barbosa on 19/10/22.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
//    static let [Product]: [image]

    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let myLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myLabel)
        contentView.addSubview(myImageView)

        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: 150)
//            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 1),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

}

    func configure(with model: Product) {
        self.myImageView.sd_setImage(with: URL(string: model.image)!)
        self.myLabel.text = model.title
    }
}
