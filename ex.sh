docker exec -it postgres /bin/bash
psql -U postgres -d financial_db

\d


select * from transactions;


update transactions set amount = amount + 100 where transaction_id = '8752dcf1-4e28-40a1-a6f5-84ca39ccfd63';



ALTER TABLE transactions REPLICA IDENTITY FULL;



# debezuim UI:
# username: postgres
# password: postgres