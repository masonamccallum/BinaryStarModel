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
- [ ] Develop Particle Simulation saving protocol
- [ ] Refactor code for a more powerful machine
- [ ] Develop Graphics engine for post processing

### Short Term Goals Summer
- [ ] Fix flying Camera
- [ ] Integrate Nbody with new engine
- [ ] Save Simulation raw data
- [ ] Import simulation from raw Data
- [ ] Save sim to ffmpeg
- [ ] Vamp UI for real time stats

### Build Instructions
Dependencies: CUDA v10 minimum and CMAKE

'''bash
git clone https://github.com/masonamccallum/BinaryStarModel.git
cd BinaryStarModel/source
mkdir build
cd build
cmake ..
make
./StarStuff
'''