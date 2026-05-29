import streamlit as st
import pandas as pd
from datetime import datetime

# =============================================================================
# PAGE CONFIG
# =============================================================================
st.set_page_config(
    page_title="DataEye - Hospital Management System",
    page_icon="👁️",
    layout="wide"
)

# =============================================================================
# GLOBAL STYLING (DARK THEME + UI UPGRADE)
# =============================================================================
st.markdown("""
<style>
    .stApp {
        background-color: #0e1117;
        color: #ffffff;
    }

    /* Sidebar */
    section[data-testid="stSidebar"] {
        background-color: #111827;
    }

    /* Metric cards */
    div[data-testid="metric-container"] {
        background-color: #1c1f26;
        border: 1px solid #2a2f3a;
        padding: 15px;
        border-radius: 10px;
    }

    /* Buttons */
    div.stButton > button {
        background-color: #4FC3F7;
        color: black;
        border-radius: 8px;
        padding: 10px;
        font-weight: bold;
        border: none;
    }

    div.stButton > button:hover {
        background-color: #29B6F6;
        color: white;
    }

    /* Titles */
    h1, h2, h3 {
        color: #4FC3F7;
    }

</style>
""", unsafe_allow_html=True)

# =============================================================================
# HEADER
# =============================================================================
st.title("👁️ DataEye System Portal")
st.markdown("### Smart Hospital Management Dashboard")
st.markdown("---")

# =============================================================================
# SIDEBAR
# =============================================================================
st.sidebar.markdown("""
<div style='text-align:center; padding:10px;'>
    <h2 style='color:#4FC3F7;'>👁️ DataEye</h2>
    <p style='color:gray;'>Hospital Management System</p>
</div>
""", unsafe_allow_html=True)

page = st.sidebar.radio(
    "Navigation Menu:",
    ["Dashboard Overview", "Patient Management", "Doctors & Appointments", "Billing & Transactions"]
)

st.sidebar.markdown("---")
st.sidebar.success("🔗 Connected to Database: DATAEYE1")

# =============================================================================
# DASHBOARD
# =============================================================================
if page == "Dashboard Overview":
    st.header("Hospital Metrics Dashboard")

    col1, col2, col3, col4 = st.columns(4)

    col1.metric("Total Active Patients", "1,240", "+12%")
    col2.metric("Available Rooms", "14 / 20", "Good")
    col3.metric("Pending Appointments", "42", "-5")
    col4.metric("Revenue Managed", "$14,250", "+8.2%")

    st.markdown("<br>", unsafe_allow_html=True)

    st.markdown("### 📅 Quick Schedule Overview")

    mock_appointments = pd.DataFrame({
        "Appointment ID": [101, 102, 103],
        "Patient PSSN": [987654, 876543, 765432],
        "Time": ["09:30 AM", "11:00 AM", "02:15 PM"],
        "Purpose": ["Eye Exam", "Surgery Follow-up", "Consultation"],
        "Status": ["Confirmed", "Pending", "In Progress"]
    })

    st.dataframe(mock_appointments, use_container_width=True)

# =============================================================================
# PATIENT MANAGEMENT
# =============================================================================
elif page == "Patient Management":
    st.header("Patient Admissions & Records")

    tab1, tab2 = st.tabs(["🆕 Admit Patient", "🔍 Patient Lookup"])

    with tab1:
        st.subheader("New Patient Registration")

        with st.form("patient_form"):
            c1, c2, c3 = st.columns(3)

            pssn = c1.number_input("PSSN", step=1)
            pnum = c2.number_input("PNUM", step=1)
            name = c3.text_input("Full Name")

            c4, c5, c6 = st.columns(3)

            phone = c4.text_input("Phone")
            sex = c5.selectbox("Sex", ["M", "F", "Other"])
            dob = c6.date_input("Birth Date")

            st.markdown("### Vitals")

            c7, c8, c9 = st.columns(3)
            temp = c7.number_input("Temperature", 30.0, 45.0, 37.0)
            bp = c8.text_input("Blood Pressure")
            hr = c9.number_input("Heart Rate", 30, 200, 75)

            history = st.text_area("Medical History")
            address = st.text_input("Address")

            submit = st.form_submit_button("Save Patient")

            if submit:
                st.success(f"Patient {name} successfully registered!")

    with tab2:
        st.subheader("Patient Lookup")

        search = st.text_input("Enter PSSN")

        if search:
            st.info("Displaying patient record...")

            col1, col2 = st.columns(2)
            col1.metric("Left Eye Vision", "20/20")
            col2.metric("Right Eye Vision", "20/40")

# =============================================================================
# DOCTORS
# =============================================================================
elif page == "Doctors & Appointments":
    st.header("Doctors & Scheduling")

    col1, col2 = st.columns([1, 2])

    with col1:
        st.subheader("Doctors")

        doctors = pd.DataFrame({
            "DSSN": [4455, 6677],
            "Name": ["Dr. Sarah Jenkins", "Dr. Alan Vance"],
            "Specialty": ["Cornea", "Glaucoma"],
            "Degree": ["MD", "MD, PhD"]
        })

        st.dataframe(doctors, use_container_width=True)

    with col2:
        st.subheader("Book Appointment")

        with st.form("appointment"):
            date = st.date_input("Date")
            time = st.time_input("Time")

            patient = st.selectbox("Patient", ["John - 987654", "Jane - 876543"])
            doctor = st.selectbox("Doctor", ["4455 - Sarah", "6677 - Alan"])
            room = st.selectbox("Room", ["101", "102", "103"])

            submit = st.form_submit_button("Book")

            if submit:
                st.success("Appointment booked successfully!")

# =============================================================================
# BILLING
# =============================================================================
elif page == "Billing & Transactions":
    st.header("Billing System")

    tab1, tab2 = st.tabs(["Payments", "Refunds"])

    with tab1:
        with st.form("payment"):
            pid = st.number_input("Payment ID", step=1)
            method = st.selectbox("Method", ["Cash", "Card", "Insurance"])
            amount = st.number_input("Amount", 0.0)

            status = st.selectbox("Status", ["Paid", "Pending", "Failed"])

            submit = st.form_submit_button("Save Payment")

            if submit:
                st.success(f"Payment #{pid} recorded!")

    with tab2:
        with st.form("refund"):
            rid = st.number_input("Refund ID", step=1)
            payid = st.number_input("Payment ID", step=1)
            amount = st.number_input("Refund Amount", 0.0)

            submit = st.form_submit_button("Process Refund")

            if submit:
                st.warning(f"Refund #{rid} processed!")