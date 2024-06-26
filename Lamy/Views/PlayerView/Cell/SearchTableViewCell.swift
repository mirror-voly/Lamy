//
//  SearchTableViewCell.swift
//  Lamy
//
//  Created by mix on 11.4.24..
//

import UIKit
import SDWebImage


class SearchTableViewCell: UITableViewCell {

    let dataMeneger = DataManager.shared
    var correctTrack: Track!
    
    @IBOutlet weak var songYearLable: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellArtistNameLable: UILabel!
    @IBOutlet weak var cellSongNameLable: UILabel!
    
    @IBOutlet weak var cellAddButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCell(vith track: Track) {
        correctTrack = track
        cellSongNameLable.text = track.trackName
        cellArtistNameLable.text = track.artistName
        songYearLable.text = track.collectionName
        let contains = dataMeneger.playlisTracks.contains { $0.trackName == track.trackName &&
            $0.artistName == track.artistName
        }
        cellAddButton.isHidden = contains
        guard let atrwork = track.artworkUrl100 else {
            let image = UIImage(systemName: "cube.transparent")
            cellImage.image = image
            return
        }

        if let url = URL(string: atrwork) {
            let image = UIImage(systemName: "cube.transparent")
            cellImage.sd_setImage(with: url, placeholderImage: image)
            cellImage.tintColor = .gray
        }
    }
    
    
    @IBAction func addToPlaylistButtonPressed(_ sender: Any) {
        guard let correctTrack = correctTrack else { return }
        cellAddButton.isHidden = true
        dataMeneger.saveTrack(correctTrack)
    }
    
}
