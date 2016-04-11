#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>

extern "C" {
#include "vl/dsift.h"
}

using namespace std;

int main(int argc, char **argv) {

    const string image_p = "image.jpg";

    cv::Mat image = cv::imread(image_p, CV_LOAD_IMAGE_GRAYSCALE);
    if (!image.data) {
        cerr << image_p << " not found." << endl;
        return -1;
    }

    vector<float> image_data((unsigned char *)image.data, (unsigned char*)image.data + image.rows*image.cols);

    VlDsiftFilter *siftFilter = vl_dsift_new_basic(image.size().width, image.size().height, 1, 8);
    vl_dsift_process(siftFilter, image_data.data());

    int num = vl_dsift_get_keypoint_num(siftFilter);
    const float *p_descs = vl_dsift_get_descriptors(siftFilter);
    VlDsiftKeypoint const *key_pts = vl_dsift_get_keypoints(siftFilter);

    for (int n = 0; n < num; n++) {
        cout << key_pts[n].x << " " << key_pts[n].y << endl;
    }

    vl_dsift_delete(siftFilter);

    return 0;
}
