import FLASK

class Customer(FLASK):
    def __init__(self, c_id, f_name, l_name, email, phone):
        self.customer_id = c_id
        self.first_name = f_name 
        self.last_name = l_name 

class Ticket(FLASK):
    def __init__(self, t_id, price, customer):
        self.ticket_id = t_id
        self.price = price 
        self.customer = customer

c1 = Customer(1, "Shoha", "T", "sho@sho.com", '888-888-8888')

t1 = Ticket(1, 2.00, c1)
t2 = Ticket(1, 2.00, c1)
t3 = Ticket(1, 2.00, c1)
t4 = Ticket(1, 2.00, c1)