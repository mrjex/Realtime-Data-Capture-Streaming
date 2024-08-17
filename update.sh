docker exec -it postgres /bin/bash # Enter 'postgress' container's shell environment

psql -U postgres -d financial_db # Enter 'financial_db' database's environment


select * from transactions; # Check existing db-instances


# Run commands:

# Set value of an instance
update transactions set amount = 1000 where transaction_id = '303fb59d-d42f-455a-a3c5-a6c5dd5ec988';

# Update value of an instance
update transactions set amount = amount + 100 where transaction_id = '303fb59d-d42f-455a-a3c5-a6c5dd5ec988';



# Add new column
ALTER TABLE transactions add column modified_by TEXT;

ALTER TABLE transactions add column modified_at TIMESTAMP;




# Create function
CREATE OR REPLACE FUNCTION record_change_user()
RETURNS TRIGGER AS $$
BEGIN
NEW.modified_by := current_user;


NEW.modified_at := CURRENT_TIMESTAMP;

RETURN NEW;
END;



# $$ LANGUAGE plpgsql;



# CREATE TRIGGER............