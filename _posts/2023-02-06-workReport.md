---
layout: post
title: "[2023-02-06] Work Report" 
date: 2023-02-06
category: read 
excerpt: ""
---
# 2023년 02월 06일 화요일 

## 오늘의 공부 기록 
### Powershell
- 권한확인 command 
     ```
        (Get-Acl -Path "a full name of file").Access | Format-Table IdetifyReference,FileSystemRights,AccessControlType,IsInherite,InheritanceFlags -AutoSize
     ```