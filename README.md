# Infrared and visible image fusion using Latent Low-Rank Representation

[Hui Li](https://hli1221.github.io/), Xiao-Jun Wu*  
Infrared and visible image fusion using Latent Low-Rank Representation.  
[arXiv](https://arxiv.org/abs/1804.08992)


## Latent Low-Rank Representation
![](https://github.com/hli1221/imagefusion_Infrared_visible_latlrr/blob/master/framework/latlrr.png)


## The framework for fusion method
![](https://github.com/exceptionLi/imagefusion_Infrared_visible_latlrr/blob/master/framework/framework.png)


## Abstract

We propose a novel image fusion method based on latent low-rank representation (LatLRR) which is simple and effective. 

Firstly, the source images are decomposed into low-rank part and saliency part by LatLRR. The global structure information is preserved by low-rank part, and the local structure information is extracted by saliency part. 

Then, the low-rank parts are fused by weighted-average strategy, and the saliency parts are simply fused by sum strategy. 

Finally, the fused image is obtained by combining the fused low-rank part and the fused saliency part. 


## Source code
1 fusion_latlrr.m ----- our method

2 latlent_lrr.m ------- latent low-rank representation method


## Latent LRR
The Latent LRR method is proposed by Guangcan Liu in 2011.

"Liu G, Yan S. Latent Low-Rank Representation for subspace segmentation and feature extraction[C] International Conference on Computer Vision. IEEE Computer Society, 2011:1615-1622."

And we just use this method in our paper without change.


# Citation

For codes: 

```
@misc{li2017IVimagefusion_latentLRR,
    author = {Hui Li},
    title = {CODE: Infrared and visible image fusion using Latent Low-Rank Representation},
    year = {2017},
    note = {\url{https://github.com/exceptionLi/imagefusion_Infrared_visible_latlrr}}
  }
```
