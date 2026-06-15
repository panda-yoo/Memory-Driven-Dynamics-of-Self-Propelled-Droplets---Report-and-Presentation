# Memory-Driven Dynamics of Self-Propelled Droplets

This repository contains the report and presentation for the project **"Memory-Driven Dynamics of Self-Propelled Droplets: Experimental Analysis and PDE--SDE Modelling"**.

**Author:** Pranav Deepak Shinde  
**Institute:** Department of Physics, National Institute of Technology Karnataka, Surathkal  
**Date:** June 2026

## Documents

- [Project Report PDF](./report/main.pdf)
- [Project Presentation PDF](./presentation/main.pdf)

## Overview

Active droplets are self-propelled systems that move by interacting with their surrounding chemical environment. As they move, they leave behind a chemical trail that can influence their future motion, leading to memory-dependent behaviour.

In this work, droplet trajectories were extracted from experimental video recordings and analysed using statistical measures such as the mean squared displacement (MSD), velocity autocorrelation function (VACF), and orientation correlation function. The results show that the droplets exhibit persistent motion at short times and gradually approach diffusive behaviour at longer times. The MSD indicates superdiffusive transport, while the correlation functions reveal finite velocity and directional memory.

To understand these observations, a self-repelling random-walk framework and a coupled partial differential equation–stochastic differential equation (PDE–SDE) model were studied. In these models, the droplet interacts with its own chemical trail, which stores information about past motion and produces non-Markovian dynamics.

The agreement between experimental observations and model predictions suggests that the chemical trail acts as a memory field that influences future motion. These results demonstrate that memory effects play an important role in the dynamics of active droplets and provide a useful framework for understanding non-Markovian transport in active matter systems.

## Keywords
Active droplets, active matter, memory effects, non-Markovian dynamics, mean squared displacement, velocity autocorrelation function, PDE--SDE model.

## Repository Structure

- `report/`: Contains the LaTeX source code and assets for the project report.
  - `main.tex`: The main entry point for the report document.
- `presentation/`: Contains the LaTeX source code and assets for the presentation (using Beamer).
  - `main.tex`: The main entry point for the presentation document.

## Building the Documents

To compile the report and presentation, you need a working LaTeX installation (e.g., TeX Live, MiKTeX) and `biber` for bibliography management.

For either the report or the presentation, navigate to their respective directory and run:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

Alternatively, you can use `latexmk`:

```bash
latexmk -pdf main.tex
```
