# Dynamic Feature Selection for Canadian GDP Forecasting

This repository contains research and implementation code for forecasting Canadian GDP using dynamic feature selection techniques, including **PDC-SIS (Partial Distance Correlation - Sure Independence Screening)**.

## Project Overview

The core of this project explores how to dynamically select the most relevant economic indicators (features) from a large pool of potential predictors to improve the accuracy of GDP forecasts. The methodology accounts for changing economic conditions by updating feature selection across different forecast horizons.

## Key Features

- **PDC-SIS Implementation**: Utilizes Partial Distance Correlation for robust, non-linear feature screening.
- **Rolling-Window Forecasting**: Implements "Ba Chu Style" rolling window analysis for Out-of-Sample (OoS) performance evaluation.
- **Multiple Forecast Horizons**: Supports forecasting at various horizons (e.g., $\tau = 1, 3, 6, 9$ months).
- **Comparison of Models**: Includes evaluations for various regression models like Random Forest, XGBoost, CatBoost, and ARIMA.
- **Google Trends Integration**: Explores the use of Google Trends data as supplementary predictors for real-time economic activity.

## Project Structure

- `data/`: Contains the datasets used for training and evaluation.
- `Google_trends_terms/`: Data related to Google Trends keyword analysis.
- `OoS_metrics_*/`: Out-of-Sample metrics for different models and horizons.
- `graph_*/`: Visualizations of model performance (RMSE, MAE, R², etc.).
- `*.ipynb`: Jupyter notebooks containing the main experimental workflows:
    - `pdc_sis_rolling_forecast_GT_updated.ipynb`: Main forecast logic with Google Trends.
    - `pdc_sis_rolling_forecast_graph.ipynb`: Graph generation and visualization.

## Methodology

The project follows a rigorous rolling-window evaluation framework:
1. **Subsample Extraction**: Economic data is divided into subsamples.
2. **Dynamic Feature Selection**: For each window, the most relevant predictors are identified using PDC-SIS.
3. **Model Training**: Regression models are trained on selected features.
4. **Out-of-Sample Prediction**: The model predicts the GDP for the next $\tau$ steps.
5. **Metric Calculation**: Performance is measured using Median RMSE, MAE, and R².

## Installation

To run the notebooks, ensure you have the necessary dependencies installed:

```bash
pip install dcor
pip install git+https://github.com/Shafi2016/pypdc_sis.git
```

## Results

Model performance metrics (RMSE, MAE, R²) are saved in the `OoS_metrics_` directories. Visual representations of these metrics can be found in the `graph_` folders.

## License

[Specify License if applicable]
