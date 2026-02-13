# Dynamic Feature Selection for Canadian GDP Forecasting

This repository contains research and implementation code for forecasting monthly Canadian real GDP growth using machine learning models and dynamic feature selection.

## Abstract

We forecast monthly Canadian real GDP growth using machine learning models trained on 18 official macroeconomic indicators and Google Trends (GT) data. Predictors are selected dynamically in each rolling window using **PDC-SIS (Partial Distance Correlation - Sure Independence Screening)**, with cross-validation-based tuning to support real-time forecasting and avoid data leakage. The evaluation is conducted on latest-available (final-vintage) series and should be interpreted as a pseudo out-of-sample forecasting exercise rather than real-time vintage nowcasting.

## Key Features & Models

- **Models Evaluated**: GBM, XGBoost, LightGBM, CatBoost, and Random Forest.
- **Baseline**: ARIMA model.
- **Dynamic Feature Selection**: Implementation of PDC-SIS for robust, non-linear feature screening in each rolling window.
- **Data Sources**: 18 Official macroeconomic indicators combined with Google Trends (GT) data.

## Findings

- **Data Performance**: Official data delivers the strongest performance at short and medium horizons.
- **Synergy**: Combining Official and GT data yields the clearest improvement at the longest horizon.
- **LightGBM Robustness**: With GT data alone, LightGBM is the only ML model maintaining positive out-of-sample $R^2$ across all horizons.
- **Statistical Significance**: Diebold–Mariano tests corroborate these patterns, showing LightGBM's dominance under GT-only predictors.

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
3. **Model Training & Tuning**: Machine learning models are trained with cross-validation-based tuning.
4. **Pseudo Out-of-Sample Prediction**: The model predicts the GDP for the next $\tau$ steps.
5. **Metric Calculation**: Performance is measured using Median RMSE, MAE, and $R^2$, with Diebold–Mariano tests for statistical comparison.

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
