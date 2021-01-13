Docker file content for the first time

````docker
FROM node:latest
WORKDIR /application
ADD . .
RUN yarn install
CMD node index.js

````
Run command docker build -t docker-cache-layer .

- Firt time fresh build when you dont have the Image in the local

![first_time_when_no_image](https://github.com/hakuna16/docker-layer-cache/blob/master/images/first_time_when_no_image.png)



````bash
rituj@INMLPB4JG8WP docker-layer-cache % docker build -t docker-cache-layer .
[+] Building 55.7s (9/9) FINISHED                                                                                                                                                                           
 => [internal] load build definition from Dockerfile                                                                                                                                                   0.0s
 => => transferring dockerfile: 307B                                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/node:latest                                                                                                                                         4.8s
 => [1/4] FROM docker.io/library/node:latest@sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb                                                                                  47.7s
 => => resolve docker.io/library/node:latest@sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb                                                                                   0.0s
 => => sha256:93d6bcf2a5a11c749a20211d09a616cf0dd5d42925d3895b6b6738335bd14e22 2.21kB / 2.21kB                                                                                                         0.0s
 => => sha256:d6740064592fe5725b06099d482ac7358b52f24b9580c418369b336305933203 7.80kB / 7.80kB                                                                                                         0.0s
 => => sha256:953fe5c215cb5f929e0e42e5a1011f33edce9278a650faf10655e855a670f79f 10.75MB / 10.75MB                                                                                                       4.1s
 => => sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb 776B / 776B                                                                                                             0.0s
 => => sha256:2587235a7635c6991dfee9791c7977ab29694cf73bc64c3c5a79097ca99364d1 45.38MB / 45.38MB                                                                                                       9.9s
 => => sha256:d4d3f270c7deffd353181076af3b5746c8dbeac5abf454169a75e7822587bdab 4.34MB / 4.34MB                                                                                                         2.7s
 => => sha256:ed36dafe30e3d9c4fde74478dae686f851d7e93b719dc3165d8eb7e8be9305d9 50.11MB / 50.11MB                                                                                                      20.1s
 => => sha256:00e912dd434d537c339ad16f37836cef5f5984fe0da0d0399fa79f47e31f1057 214.31MB / 214.31MB                                                                                                    33.4s
 => => sha256:dd25ee3ea38e0207708e76e6dcd112e86b43dfbff71976f17827b8188174922f 4.17kB / 4.17kB                                                                                                        10.5s
 => => extracting sha256:2587235a7635c6991dfee9791c7977ab29694cf73bc64c3c5a79097ca99364d1                                                                                                              2.7s
 => => sha256:7e835b17ced9fe1b933a733c5fe00eda630837a32ca84f5be669e2eaaa815cc4 33.67MB / 33.67MB                                                                                                      20.9s
 => => extracting sha256:953fe5c215cb5f929e0e42e5a1011f33edce9278a650faf10655e855a670f79f                                                                                                              0.7s
 => => extracting sha256:d4d3f270c7deffd353181076af3b5746c8dbeac5abf454169a75e7822587bdab                                                                                                              0.3s
 => => sha256:79ae84aa9e918139eefdaa5e9c970aa6408c390807aef2ee0bf4793a0936bf6e 2.38MB / 2.38MB                                                                                                        21.9s
 => => extracting sha256:ed36dafe30e3d9c4fde74478dae686f851d7e93b719dc3165d8eb7e8be9305d9                                                                                                              3.9s
 => => sha256:629164f2c016a9187a25c907d7a16f287d8b318fea484602c3f36fd085159770 295B / 295B                                                                                                            21.9s
 => => extracting sha256:00e912dd434d537c339ad16f37836cef5f5984fe0da0d0399fa79f47e31f1057                                                                                                             10.2s
 => => extracting sha256:dd25ee3ea38e0207708e76e6dcd112e86b43dfbff71976f17827b8188174922f                                                                                                              0.0s
 => => extracting sha256:7e835b17ced9fe1b933a733c5fe00eda630837a32ca84f5be669e2eaaa815cc4                                                                                                              2.6s
 => => extracting sha256:79ae84aa9e918139eefdaa5e9c970aa6408c390807aef2ee0bf4793a0936bf6e                                                                                                              0.2s
 => => extracting sha256:629164f2c016a9187a25c907d7a16f287d8b318fea484602c3f36fd085159770                                                                                                              0.0s
 => [internal] load build context                                                                                                                                                                      0.3s
 => => transferring context: 1.72MB                                                                                                                                                                    0.3s
 => [2/4] WORKDIR /application                                                                                                                                                                         0.2s
 => [3/4] ADD . .                                                                                                                                                                                      0.2s
 => [4/4] RUN yarn install                                                                                                                                                                             2.6s
 => exporting to image                                                                                                                                                                                 0.2s 
 => => exporting layers                                                                                                                                                                                0.2s 
 => => writing image sha256:de187a05bf7e148ed2f1a227f20e41eb9eb6ba7be4dee08d69a60eee5bd5f6df                                                                                                           0.0s 
 => => naming to docker.io/library/docker-cache-layer 
````

- Once build again without doing any change, docker will not pull the image form the source, See the logs

![first_time_when_no_image](https://github.com/hakuna16/docker-layer-cache/blob/master/images/Without_changing_the_Docker_file.png)


````bash
rituj@INMLPB4JG8WP docker-layer-cache % docker build -t docker-cache-layer .
[+] Building 4.0s (9/9) FINISHED                                                                                                                                                                            
 => [internal] load build definition from Dockerfile                                                                                                                                                   0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/node:latest                                                                                                                                         1.3s
 => [1/4] FROM docker.io/library/node:latest@sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb                                                                                   0.0s
 => [internal] load build context                                                                                                                                                                      0.1s
 => => transferring context: 30.56kB                                                                                                                                                                   0.0s
 => CACHED [2/4] WORKDIR /application                                                                                                                                                                  0.0s
 => [3/4] ADD . .                                                                                                                                                                                      0.1s
 => [4/4] RUN yarn install                                                                                                                                                                             2.3s
 => exporting to image                                                                                                                                                                                 0.2s 
 => => exporting layers                                                                                                                                                                                0.2s 
 => => writing image sha256:64043630a67d57c4b00f9e03d0c5c2b460d74efd822dc6c8518e29fff0e99348                                                                                                           0.0s 
 => => naming to docker.io/library/docker-cache-layer  
 
 ````

- Change the code to diffrent or add something new in the code, then also the same thing

![first_time_when_no_image](https://github.com/hakuna16/docker-layer-cache/blob/master/images/Without_changing_the_Docker_file.png)

````bash
rituj@INMLPB4JG8WP docker-layer-cache % docker build -t docker-cache-layer .
[+] Building 5.1s (9/9) FINISHED                                                                                                                                                                            
 => [internal] load build definition from Dockerfile                                                                                                                                                   0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/node:latest                                                                                                                                         2.5s
 => [1/4] FROM docker.io/library/node:latest@sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb                                                                                   0.0s
 => [internal] load build context                                                                                                                                                                      0.1s
 => => transferring context: 34.25kB                                                                                                                                                                   0.0s
 => CACHED [2/4] WORKDIR /application                                                                                                                                                                  0.0s
 => [3/4] ADD . .                                                                                                                                                                                      0.1s
 => [4/4] RUN yarn install                                                                                                                                                                             2.2s
 => exporting to image                                                                                                                                                                                 0.2s
 => => exporting layers                                                                                                                                                                                0.2s
 => => writing image sha256:be7ee212ade4b531338117f259cd72e1b3ed724baac4a6a772acc74899f59df3                                                                                                           0.0s 
 => => naming to docker.io/library/docker-cache-layer           
````

 - Now if we inteligently modify the docker file to use cache and layering then the file will somethig diffrent as

 ````docker
FROM node:latest
WORKDIR /application
ADD package.json .
ADD yarn.lock .
ADD . .
RUN yarn install
CMD node index.js

````

What we did here is as we know that we only going to change the code, which is minimal. 
So docker will use the cache , which is already created at every command we add. So Check the logs as:

1. First time after changing the code and the docker.

![first_time_when_no_image](https://github.com/hakuna16/docker-layer-cache/blob/master/images/Without_changing_the_Docker_file.png)

````bash
rituj@INMLPB4JG8WP docker-layer-cache % docker build -t docker-cache-layer .
[+] Building 6.8s (14/14) FINISHED                                                                                                                                                                          
 => [internal] load build definition from Dockerfile                                                                                                                                                   0.0s
 => => transferring dockerfile: 294B                                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/node:latest                                                                                                                                         2.5s
 => [1/9] FROM docker.io/library/node:latest@sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb                                                                                   0.0s
 => [internal] load build context                                                                                                                                                                      0.1s
 => => transferring context: 38.02kB                                                                                                                                                                   0.0s
 => CACHED [2/9] WORKDIR /application                                                                                                                                                                  0.0s
 => [3/9] ADD . .                                                                                                                                                                                      0.1s
 => [4/9] RUN yarn install                                                                                                                                                                             2.3s
 => [5/9] WORKDIR /application                                                                                                                                                                         0.0s 
 => [6/9] ADD package.json .                                                                                                                                                                           0.1s 
 => [7/9] ADD yarn.lock .                                                                                                                                                                              0.0s 
 => [8/9] ADD . .                                                                                                                                                                                      0.1s 
 => [9/9] RUN yarn install                                                                                                                                                                             1.3s
 => exporting to image                                                                                                                                                                                 0.2s
 => => exporting layers                                                                                                                                                                                0.2s
 => => writing image sha256:ccaa71c564b422d6d5746de2d116e718e0fc2a2e52e991f5277dd4c4b236ad21                                                                                                           0.0s 
 => => naming to docker.io/library/docker-cache-layer      
````


2. Next time building the same image by changing the code and adding more to the response.

![first_time_when_no_image](https://github.com/hakuna16/docker-layer-cache/blob/master/images/using%20of%20cache%20with%20layer.png)

````bash
rituj@INMLPB4JG8WP docker-layer-cache % docker build -t docker-cache-layer .
[+] Building 1.7s (11/11) FINISHED                                                                                                                                                                          
 => [internal] load build definition from Dockerfile                                                                                                                                                   0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/node:latest                                                                                                                                         1.3s
 => [1/6] FROM docker.io/library/node:latest@sha256:3a9d0636755ebcc8e24148a148b395c1608a94bb1b4a219829c9a3f54378accb                                                                                   0.0s
 => [internal] load build context                                                                                                                                                                      0.1s
 => => transferring context: 22.20kB                                                                                                                                                                   0.0s
 => CACHED [2/6] WORKDIR /application                                                                                                                                                                  0.0s
 => CACHED [3/6] ADD package.json .                                                                                                                                                                    0.0s
 => CACHED [4/6] ADD yarn.lock .                                                                                                                                                                       0.0s
 => CACHED [5/6] RUN yarn install                                                                                                                                                                      0.0s
 => [6/6] ADD . .                                                                                                                                                                                      0.1s
 => exporting to image                                                                                                                                                                                 0.1s
 => => exporting layers                                                                                                                                                                                0.1s
 => => writing image sha256:c2ab65b28d15c77ec25c0a55b2c5097e8020697188eed250563c1a4a9b654ad0                                                                                                           0.0s
 => => naming to docker.io/library/docker-cache-layer   
 ````
 If you notice properl you will see the logs are cached.
 This is how docekr uses layer.                                  
