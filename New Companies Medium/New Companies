SELECT company.company_code, 
       company.founder, 
       COUNT(DISTINCT Lead_Manager.lead_manager_code) AS lead_manager_count, 
       COUNT(DISTINCT senior_manager.senior_manager_code) AS senior_manager_count, 
       COUNT(DISTINCT manager.manager_code) AS manager_count, 
       COUNT(DISTINCT employee.employee_code) AS employee_count
FROM company
LEFT JOIN Lead_Manager 
       ON company.company_code = lead_manager.company_code
LEFT JOIN Senior_Manager
       ON lead_manager.lead_manager_code = senior_manager.lead_manager_code
LEFT JOIN Manager
       ON senior_manager.senior_manager_code = manager.senior_manager_code
LEFT JOIN Employee 
       ON manager.manager_code = employee.manager_code
GROUP BY company.company_code, company.founder
ORDER BY company.company_code ASC;
