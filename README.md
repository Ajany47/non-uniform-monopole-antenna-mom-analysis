# Non-Uniform Monopole Antenna Analysis using Method of Moments (MoM)

## Overview
This project presents the electromagnetic modelling of a non-uniform monopole antenna using the Method of Moments (MoM) implemented in MATLAB.

The work investigates how antenna geometry, loading techniques, and excitation strategies influence current distribution, impedance characteristics, and radiation behaviour.

---

## Research Scope
- Thin-wire monopole antenna modelling
- Current distribution analysis
- Input impedance and admittance evaluation
- Radiation pattern computation
- Investigation of:
  - Reactive loading
  - Resistive loading
  - Multi-point excitation

---

## Relevance
This work provides a foundational framework for:
- MIMO antenna systems
- 5G / 6G wireless communication
- Compact antenna optimisation
- Electromagnetic simulation and modelling

---
## Results

### Current Distribution (Multi-Frequency Analysis)

The figure below shows the current distribution along the monopole antenna at different operating frequencies (300 MHz – 360 MHz).  
It demonstrates how current magnitude varies with both antenna length and frequency, highlighting the electromagnetic behaviour of the non-uniform monopole structure.

![Current Distribution](current_distribution_multi_frequency.png)

### Radiation Pattern

The radiation pattern illustrates the directional characteristics of the monopole antenna, showing the typical figure-8 behaviour.  
This confirms the expected radiation properties of the antenna and validates the modelling approach.

![Radiation Pattern](radiation_pattern.png)

### Input Impedance (Reactive Loading – Single Excitation)

The plot below shows the variation of input impedance for a reactively loaded monopole antenna under single excitation conditions.  
It illustrates how reactive loading influences impedance behaviour, which is critical for impedance matching and efficient power transfer in antenna systems.

![Input Impedance](input_impedance_reactive_loading.png)

## Note
This MATLAB implementation forms part of my MSc dissertation on electromagnetic modelling of non-uniform monopole antennas using the Method of Moments (MoM).  

All simulations and validations were carried out during the research phase. The code is provided here to demonstrate the modelling approach, numerical implementation, and analysis methodology.

---

## Author
Olubunmi Adenekan  
Telecommunications Engineer | Antenna Research Enthusiast
