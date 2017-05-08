# Perspective distortion removal using DLT and Panorama Stitching using Ransac

This repository contains code for Assignment 3 of CS698U.
## Problem Statement for the assignment

1. __PART 1__ :- Remove perspective distortion from an image of a planar object (Example 2.12 of the MVG book) using 4 point correspondences and the Direct Linear Transform (DLT) algorithm (Sec. & Alg. 4.1). Report the qualitative results of distortion correction for at least 5 different images that you have clicked yourself.

2. **PART 2** :- Panorama stitching: Take two or more images from a rotating camera (e.g. your cellphone, with fixed focus). Estimate the homography between the images automatically. You may use interest point detection, description and matching code directly from libraries and use them as black-boxes. This will give you the initial matches. Estimate the approximate number of outliers in these matches and then use RANSAC and DLT to estimate the homography. Once you have the homography, align the images and stitch the panorama.
In the report:-
    1. Describe the method
    2. Show step by step results
    3. Show stitched panoramas of at least 5 pairs (or more) of images you took yourself

### Project Details

* **PART 1** :- Test cases can be found in DLT_i_test folders. To run the code 
```
DLT.m initial_image_ponts corresponding_points_in_final_img test_image
```
Point correspondences can be found along with the test cases in folders

* **PART 2** :- Test cases can be found in panaroma folders. To run this code call panaroma.m with variable number of arguments corresponding to all the images.
```
panaroma.m img1.jpg img2.jpg ...
```

## License

This project is licensed under the MIT License

## Acknowledgments

* Gaurav Sharma (Course Instructor CS698U)
