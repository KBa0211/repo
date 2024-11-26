/*1. Write a stored procedure named increase_value that takes one
integer parameter and returns the parameter value increased by
10.*/
CREATE OR REPLACE FUNCTION increase_value(input_value INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN input_value + 10;
END;
$$ LANGUAGE plpgsql;

/*2. Create a stored procedure compare_numbers that takes two
integers and returns 'Greater', 'Equal', or ‘Lesser' as an out
parameter, depending on the comparison result of these two
numbers.*/
CREATE OR REPLACE PROCEDURE compare_numbers(
    num1 INTEGER,
    num2 INTEGER,
    OUT result TEXT
)
LANGUAGE plpgsql AS $$
BEGIN
    IF num1 > num2 THEN
        result := 'Greater';
    ELSIF num1 = num2 THEN
        result := 'Equal';
    ELSE
        result := 'Lesser';
    END IF;
END;
$$;

/*3. Write a stored procedure number_series that takes an integer n
and returns a series from 1 to n. Use a looping construct within
the procedure*/
CREATE OR REPLACE FUNCTION number_series(n INTEGER)
RETURNS TABLE(series INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT generate_series(1, n);
END;
$$ LANGUAGE plpgsql;

/*4. Write a stored procedure nd_employee that takes an
employee name as a parameter and returns the employee
details by performing a query.*/
CREATE OR REPLACE PROCEDURE nd_employee(emp_name TEXT, OUT emp_id INTEGER, OUT emp_position TEXT, OUT emp_salary NUMERIC)
LANGUAGE plpgsql AS $$
BEGIN
    SELECT id, position, salary
    INTO emp_id, emp_position, emp_salary
    FROM employees
    WHERE name = emp_name;
END;
$$;

/*5. Develop a stored procedure list_products that returns a table
with product details from a given category.*/
CREATE OR REPLACE PROCEDURE list_products(category_name TEXT)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
    SELECT id, name, price, stock
    FROM products
    WHERE category = category_name;
END;
$$;

/*6. Create two stored procedures where the rst procedure calls
the second one. For example, a procedure calculate_bonus
that calculates a bonus, and another procedure update_salary
that uses calculate_bonus to update the salary of an employee.*/
-- Процедура для вычисления бонуса
CREATE OR REPLACE PROCEDURE calculate_bonus(emp_id INTEGER, bonus_percentage NUMERIC, OUT bonus_amount NUMERIC)
LANGUAGE plpgsql AS $$
BEGIN
    SELECT salary * (bonus_percentage / 100)
    INTO bonus_amount
    FROM employees
    WHERE id = emp_id;
END;
$$;

CREATE OR REPLACE PROCEDURE update_salary(emp_id INTEGER, bonus_percentage NUMERIC)
LANGUAGE plpgsql AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    CALL calculate_bonus(emp_id, bonus_percentage, bonus);
    UPDATE employees
    SET salary = salary + bonus
    WHERE id = emp_id;
END;
$$;

/*7.
• Write a stored procedure named complex_calculation.
• The procedure should accept multiple parameters of various
types (e.g., INTEGER, VARCHAR).
• The main block should include at least two nested subblocks.
• Each subblock should perform a distinct operation (e.g., a
string manipulation and a numeric computation).
• The main block should then combine results from these
subblocks in some way.
• Return a nal result that depends on both subblocks' outputs.
• Use labels to differentiate the main block and subblocks.*/
CREATE OR REPLACE PROCEDURE complex_calculation(
    param1 INTEGER,
    param2 VARCHAR,
    param3 NUMERIC,
    OUT final_result NUMERIC)
LANGUAGE plpgsql AS $$
DECLARE
    numeric_result NUMERIC;
    string_result VARCHAR;
BEGIN
    numeric_result := param1 * param1 * param3;
    string_result := param2 || ' is the input string.';
    final_result := numeric_result + LENGTH(string_result);
END;
$$;
