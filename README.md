# Car Diagnostic Dialogue

This project is part of the Expert Systems course and involves implementing a car diagnostic dialogue using CLIPS, a rule-based expert system language. The purpose of this dialogue is to help diagnose potential issues with a car based on user responses to a series of questions.

## Table of Contents

- [Introduction](#introduction)
- [Approaches](#approaches)
- [Usage](#usage)

## Introduction

In this project, we use CLIPS to create a rule-based expert system for diagnosing car problems. The system asks a series of questions related to the car's symptoms and, based on the user's responses, provides recommendations for further actions, such as calling for assistance, buying petrol, or performing specific maintenance tasks.

![capture](https://github.com/Amirkia1998/Car-Dialogue/blob/main/Car-Rules/Capture.PNG)

## Approaches

### Approach 1: Car_Dialogue1.clp

- **Rule-Based Approach**: This implementation follows a traditional rule-based expert system approach. It uses explicit rules to collect information about the car's symptoms and make recommendations.

- **Structured Questioning**: The dialogue starts with structured questions to gather information systematically. It checks the status of the starter motor, the availability of petrol, the functionality of headlights, the presence of solenoid clicks, terminal cleanliness, and solenoid fuse status.

- **Static Rules for Decisions**: Once the necessary information is collected, a set of static rules determines the recommended action. For example, if the starter motor is turning and there is petrol, it suggests calling for assistance.

### Approach 2: Car_Dialogue2.clp

- **Procedural Approach**: In this version, the dialogue follows a more procedural approach. It uses a series of `defrule` constructs to check for specific conditions and provide recommendations based on the condition that matches first.

- **Questioning and Recommendations**: Similar to Approach 1, this approach asks questions about the car's symptoms but proceeds differently based on the responses. For instance, if there's no petrol, it suggests buying petrol directly.

- **Looping Behavior**: Instead of using a fixed set of rules for decisions, it employs looping behavior to repeat the dialogue until a recommendation is made. This can be seen in rules like "call-aa," "buy-petrol," "replace-starter," etc., where the dialogue reverts to the initial state for further questioning after making a recommendation.

## Usage

To use the car diagnostic dialogue, follow these steps:

1. Make sure you have the CLIPS interpreter installed on your system.

2. Load the CLIPS program with `load "Car_Dialogue1.clp"` or `load "Car_Dialogue2.clp"` depending on which approach you want to use.

3. Run the program with `(reset)` and `(run)`.

4. Answer the prompted questions with 'y' for 'yes' and 'n' for 'no' to diagnose the car's problem.


