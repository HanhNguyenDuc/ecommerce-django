from enum import unique, Enum

@unique
class OrderStatus(Enum):
    GETTING = 0
    DELIVERY = 1
    DELIVERIED = 2
    TAKEN = 3