## N-Body Simulation of Binary Star Mass Transfer

<img src="/images/logo.jpg" width="200" />

Binary star systems are a pair of stars orbiting around a common center of mass. Due to their abundance and unique 
characteristics, such systems are invaluable sources of astrophysical data. In this study we are concerned with contact binary 
systems: a pair of stars in physical contact sharing a common envelope. Due to mass transfer between the stars, the structure 
and evolution of these systems differ greatly from solitary stars. Here we develop an N-body model that simulates evolving 
contact binary star systems. Previous simulations have been developed to run on graphics cards due to the highly parallel 
nature of this algorithm. This, however, lacks the accuracy and speed necessary for this project. This summer I will be 
developing the software necessary to model this system on A&M’s Terra supercomputing cluster. This will greatly increase our 
modeling capabilities as well as allow us to explore alternate algorithms for modeling this system. A numerical model is not 
sufficient for proof of a phenomenon, however it is sufficient to validate current analytical understanding. If we identify 
conditions necessary for our model to represent a stable contact system, we will validate the current analytical understanding 
of a prevalent type of star system.

[![Presentation](/images/thumbnail.jpg)](https://youtu.be/CefOApx5AQI "Presentation Recording - Click to Watch!")
Presentation Recording

### Moving forward
- [X] Develop multi-GPU Simulation
- [X] Develop Particle Simulation saving protocol
- [X] Refactor code for a more powerful machine
- [X] Develop Graphics engine for post processing

### Short Term Goals
- [X] Fix flying Camera
- [X] Add mouse control for GUI interface 
- [X] Integrate Nbody with new engine
- [X] Save Simulation raw data
- [X] Import simulation from raw Data
- [ ] Plot particles as sheres
- [ ] Abstract particle plotting into its own class
- [ ] Improve simulation control input abstraction
- [ ] Save sim to ffmpeg
- [ ] Vamp UI for real time stats

### View Graphics Output
[![graphics](/images/thumbnail.jpg)](/projectPresentation/graphics.mp4 "Graphics Recording - Click to Watch!")

https://user-images.githubusercontent.com/33843826/148618441-a13e0e23-aca1-45a7-828e-5d9a13c08888.mp4
### Build Instructions  (Dependencies: CUDA v10 minimum and CMAKE)
    git clone https://github.com/masonamccallum/BinaryStarModel.git
    cd BinaryStarModel/source
    mkdir build
    cd build
    cmake ..
    make
    ./StarStuff
