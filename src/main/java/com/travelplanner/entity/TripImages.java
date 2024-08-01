package com.travelplanner.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class TripImages {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long imageId;
    private String imageName;
    private String type;
    @Column(length = 1500)
    private String discription;
    private String originalName;

    public TripImages() {
    }

    public TripImages(long imageId, String imageName, String type, String discription) {
        this.imageId = imageId;
        this.imageName = imageName;
        this.type = type;
        this.discription = discription;
    }

    public TripImages(long imageId, String imageName, String type, String discription, String originalName) {
        this.imageId = imageId;
        this.imageName = imageName;
        this.type = type;
        this.discription = discription;
        this.originalName = originalName;
    }

    public long getImageId() {
        return imageId;
    }

    public void setImageId(long imageId) {
        this.imageId = imageId;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getOriginalName() {
        return originalName;
    }

    public void setOriginalName(String originalName) {
        this.originalName = originalName;
    }

    @Override
    public String toString() {
        return "TripImages [imageId=" + imageId + ", imageName=" + imageName + ", type=" + type + ", discription="
                + discription + ", originalName=" + originalName + "]";
    }

    

    
    
}
