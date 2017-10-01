# Infrared and visible image fusion using Latent Low-Rank Representation

In Peer Review(TIP)

## Abstract

We propose a novel image fusion method based on latent low-rank representation (LatLRR) which is simple and effective. 

Firstly, the source images are decomposed into low-rank part and saliency part by LatLRR. The global structure information is preserved by low-rank part, and the local structure information is extracted by saliency part. 

Then, the low-rank parts are fused by weighted-average strategy, and the saliency parts are simply fused by sum strategy. 

Finally, the fused image is obtained by combining the fused low-rank part and the fused saliency part. 


## Figures
1 infrared_images ---- infrared and visible imaegs(16) which we used.

2 source_images ------ infrared and visible imaegs(5) which we used.


## Source code
1 fusion_latlrr.m ----- our method

2 latlent_lrr.m ------- latent low-rank representation method


