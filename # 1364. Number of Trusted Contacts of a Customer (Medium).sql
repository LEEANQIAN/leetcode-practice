# 1364. Number of Trusted Contacts of a Customer (Medium)
SELECT invoice_id, Customers.customer_name, price, COUNT(DISTINCT Contacts.contact_name) AS contacts_cnt, 
SUM(CASE WHEN contact_email IN (SELECT email FROM Customers) 
    THEN 1 ELSE 0 END) AS trusted_contacts_cnt FROM 
invoices LEFT JOIN Customers ON Invoices.user_id = Customers.customer_id
LEFT JOIN Contacts ON customer_id = Contacts.user_id
GROUP BY invoice_id