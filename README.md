# Healthcare-Risk-Stratification
# 🏥 Healthcare Patient Risk Stratification & Outcome Prediction

# Project Overview
Healthcare providers face challenges in identifying high-risk patients early, leading to potential complications, prolonged hospital stays, and increased treatment costs. 

This project delivers an end-to-end **Patient Risk Stratification Pipeline** that processes healthcare data using SQL queries, extracts clinical risk indicators using Python, trains a predictive Machine Learning model, and deploys an interactive Streamlit web application for clinical decision support.

---

##  Business Problem & Value Delivered
* **Business Impact:** Helps hospital administrators and clinical staff prioritize resource allocation, monitor abnormal lab patterns, and reduce preventable complications.

---

##  Tech Stack & Architecture
* **Database & SQL Analysis:** MySQL / PostgreSQL (Complex Joins, Aggregations, Lab Result Thresholding)
* **Data Processing & Analytics:** Python, Pandas, NumPy
* **Machine Learning:** Scikit-Learn (Logistic Regression, Classification Metrics)
* **Model Serialization:** Joblib
* **Web Application:** Streamlit

---

##  Key Features & Workflow

1. **SQL Analytics (`Risk_stratification.sql`)**
   - Relational schema modeling across `Patients`, `Diagnoses`, `Outcomes`, and `Labs`.
   - Identified abnormal laboratory trends across key tests (Blood Sugar > 120, Hemoglobin < 13, Cholesterol > 200).
   - Aggregated treatment costs and risk distribution by age and gender categories.

2. **Feature Engineering & Modeling (`riskmodel.ipynb`)**
   - Calculated `LengthofStay` dynamically from admission and discharge dates.
   - Built a custom lab anomaly counter (`AbnormalLabCount`) mapping multi-test clinical thresholds.
   - Encoded target risk outcomes (`Recovered` = 0 vs. `Complicated`/`Deceased` = 1).
   - Trained a Logistic Regression model to predict high-risk outcomes.

3. **Deployment (`Risk_Model.py`)**
   - Integrated trained model artifacts into a real-time **Streamlit UI** providing both classification and calculated risk probability.

---

##  Business & Technical Challenges Faced & Solved

| Challenge | Impact | How I Solved It |
| :--- | :--- | :--- |
| **Class Imbalance** | The dataset had significantly more `Recovered` cases than high-risk outcomes, causing initial model bias (0% recall on class 0 during split testing). | Refined feature selection to include engineered lab anomalies (`AbnormalLabCount`) and structured explicit classification probability scoring. |
| **Lab Threshold Aggregation** | Mapping non-standardized lab result values dynamically per patient ID across multiple test types. | Implemented custom Python lambda mapping functions within Pandas to evaluate multi-condition lab rules efficiently. |
| **Model Deployment Compatibility** | Mismatch in saved model filenames and target input columns during Streamlit integration. | Standardized feature input vector shapes (`['Age', 'LengthofStay', 'TreatmentCost', 'AbnormalLabCount']`) and fixed model loading paths in `joblib`. |

---


