---
layout: post
author: TreeKangaroo
categories: english
tags: [vocabulary, expressions, mathematics]
date: 2024-11-14
title: "English Notes - Sample Entry"
---

# English Expressions & Vocabulary

## Source
- **Material**: Introduction to Algorithms (CLRS)
- **Topic**: Algorithm Analysis
- **Date**: November 14, 2024

---

## New Words & Expressions

### 1. amortized analysis
- **Part of Speech**: noun phrase
- **Definition**: A method for analyzing the average time per operation over a sequence of operations, even when individual operations may have different costs.
- **Example from source**:
  > "We can use amortized analysis to show that the average cost of each operation is small, even though a single operation within the sequence might be expensive."
- **My example**: The amortized time complexity of dynamic array insertion is O(1).
- **Notes**: 분할 상환 분석 - 개별 연산의 비용이 다르더라도 전체 연산 시퀀스의 평균 비용을 분석하는 기법

### 2. asymptotic notation
- **Part of Speech**: noun phrase
- **Definition**: Mathematical notation (like O, Ω, Θ) used to describe the limiting behavior of a function as the input size approaches infinity.
- **Example from source**:
  > "Using asymptotic notation, we can characterize an algorithm's running time based on its input size."
- **My example**: Big-O notation is the most commonly used asymptotic notation in computer science.
- **Notes**: 점근 표기법 - 입력 크기가 무한대로 갈 때의 함수 동작을 표현

### 3. derive
- **Part of Speech**: verb
- **Definition**: To obtain or deduce something from a source or origin through reasoning or calculation.
- **Example from source**:
  > "We can derive the recurrence relation from the recursive structure of the algorithm."
- **My example**: The time complexity can be derived by analyzing the number of recursive calls.
- **Notes**: Common in mathematical/technical contexts meaning "유도하다, 도출하다"

---

## Grammar & Patterns

### Pattern 1: "is said to be..."
- **Structure**: Subject + is said to be + adjective/noun
- **Usage**: Used to describe a widely accepted or defined property
- **Example**: "An algorithm is said to be efficient if its time complexity is polynomial."

### Pattern 2: "given that..."
- **Structure**: Given that + condition, + conclusion
- **Usage**: Used to establish a premise before drawing a conclusion
- **Example**: "Given that the array is sorted, we can use binary search to achieve O(log n) time."

---

## Technical Terminology

### Recurrence Relation
- **Field**: Mathematics / Algorithm Analysis
- **Korean**: 점화식, 재귀 관계식
- **Definition**: An equation that recursively defines a sequence where each term is a function of preceding terms.
- **Example**: T(n) = 2T(n/2) + O(n) is a recurrence relation for merge sort.

### Tight Bound
- **Field**: Algorithm Analysis
- **Korean**: 타이트한 한계 (정확한 한계)
- **Definition**: A bound that matches both the upper and lower bounds of a function's growth rate (Θ notation).
- **Example**: The tight bound for merge sort is Θ(n log n).

---

## Review Notes

- In technical English, passive voice is frequently used: "is defined as", "is said to be", "is characterized by"
- Mathematical proofs often use structured language: "Given that...", "It follows that...", "Therefore..."
- Many mathematical terms have Latin or Greek roots
- Pay attention to prepositions: "derive FROM", "based ON", "approach TO"

