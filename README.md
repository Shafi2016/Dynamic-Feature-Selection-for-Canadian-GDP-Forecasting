# Dynamic Feature Selection for Canadian GDP Forecasting: Machine Learning with Google Trends and Official Data

**Authors:**  
Shafiullah Qureshi*  
Ba M. Chu†  
Fanny S. Demers‡  

---

## 📘 Overview

This repository provides replication code and data for the paper:  
**_Dynamic Feature Selection for Canadian GDP Forecasting: Machine Learning with Google Trends and Official Data_**

The study combines traditional economic indicators with high-frequency Google Trends data using a novel dynamic feature selection approach with **PDC-SIS** and machine learning models to enhance the forecasting of monthly Canadian GDP.

---

## 📂 Repository Structure

| File/Notebook | Description |
|---------------|-------------|
| `pdc-sis_rolling_forecast_GT_updated.ipynb` | Forecast using **Google Trends** data |
| `pdc-sis_rolling_forecast_off_updated.ipynb` | Forecast using **official macroeconomic indicators** |
| `pdc-sis_rolling_forecast_off_gt_updated.ipynb` | Forecast using **Google Trends + official data** |
| `pdc-sis_rolling_forecast_graph.ipynb` | Generates performance graphs comparing models |
| `table.ipynb` | Produces summary tables as presented in the paper |
| `gt_final.csv` | Final dataset of selected Google Trends variables |
| `official_data.csv` | Cleaned dataset of official macroeconomic indicators |

---

## 🔧 Setup & Installation

To run the notebooks, install the following required packages:

<pre>
<code>
!pip install dcor
!pip install git+https://github.com/Shafi2016/pypdc_sis.git
</code>
</pre>

These install the `dcor` library (for distance correlation) and the custom `pypdc_sis` library implementing the PDC-SIS feature selection method.

Additional commonly used packages may include:  
`pandas`, `numpy`, `scikit-learn`, `matplotlib`, `xgboost`, `lightgbm`, and `catboost`.

---

## 📈 Machine Learning Models

- Random Forest (RF)
- Support Vector Machine (SVM)
- Gradient Boosting Machine (GBM)
- XGBoost
- LightGBM
- CatBoost

Each model is evaluated using three data configurations:  
→ Google Trends only  
→ Official data only  
→ Combined data

---



## 📜 Citation

If you use this code or reference this work, please cite:

> Qureshi, S., Chu, B.M., & Demers, F.S. (2024). *Dynamic Feature Selection for Canadian GDP Forecasting: Machine Learning with Google Trends and Official Data*.  
> [Insert publication link here]

---

## 📬 Contact

For questions or collaboration, contact:  
📧 `shafiullah.qureshi [at] gmail.com`

---

## 📌 License

This codebase is provided for academic and research purposes only.
