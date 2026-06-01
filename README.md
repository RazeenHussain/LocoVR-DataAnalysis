# LocoVR-DataAnalysis
This repository contains the MATLAB scripts for processing, analyzing, and visualizing data from the LocoVR experiment. 

Unity Project: https://github.com/RazeenHussain/LocoVR-Unity

---

## 📁 Repository Structure

- 📊 Visualization
  - plotMetrics.m — Generates plots for performance metrics.
  - plotMovement.m — Visualizes movement trajectories.
  - plotQuestionnaires.m — Plots questionnaire responses (SUS, TLX, SSQ, IPQ).

- 📈 Statistical Analysis
  - statisticalAnalysis.m — Runs inferential statistics (e.g., t-tests, ANOVAs) on computed metrics.

- 📐 Metric Computation
  - computeActualDistances.m — Computes ground-truth distances for comparison.
  - computeTaskTimes.m — Calculates task durations.
  - processDemographics.m — Processes demographics data and comparison questionnire data.
  - processEstimation.m — Computes errors in distance estimation.
  - processPath.m — Computes path accuracy.
  - processStart.m — Computes starting position errors.

- 📦 Included Data Files
  - readFiles.m — Loads raw data files and prepares them for analysis.
  - dataDemographics.mat — Participant demographic information.
  - dataMetrics.mat — User performance metrics.
  - dataQuestionnaires.mat — Questionnaire responses (SUS, TLX, SSQ, IPQ).

--- 

## ▶️ How to Use
- Create a Data folder and place all raw data files generated from the experimental session in it. 
- Run readFiles.m to load and structure raw data.
- Place all .mat files in the repository root or update paths in the scripts.
- Execute the processing scripts to compute metrics.
- Use the plotting scripts to generate figures.
- Run statisticalAnalysis.m to compute inferential statistics.

## 🧪 Requirements
- MATLAB R2024b or later
- Statistics and Machine Learning Toolbox (recommended)

---

## 🧩 Note
- The complete raw data are not publicly available for confidentiality and privacy reasons. However, data may be requested upon reasonable request.
