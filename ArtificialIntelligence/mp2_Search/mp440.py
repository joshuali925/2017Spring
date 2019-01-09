import random
from collections import deque
from Queue import PriorityQueue

''' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ '''
'''
                For Search Algorithms 
'''
''' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ '''
queue = None
'''
BFS add to queue 
'''
def add_to_queue_BFS(node_id, parent_node_id, cost, initialize=False):
    # Your code here
    global queue
    if initialize: queue = deque()
    queue.append((node_id, parent_node_id))
    return

'''
BFS add to queue 
'''
def is_queue_empty_BFS():
    # Your code here
    global queue
    return len(queue) == 0

'''
BFS pop from queue
'''
def pop_front_BFS():
    # (node_id, parent_node_id) = (0, 0)
    # Your code here
    global queue
    node_id, parent_node_id = queue.popleft()
    return (node_id, parent_node_id)

'''
DFS add to queue 
'''
def add_to_queue_DFS(node_id, parent_node_id, cost, initialize=False):
    # Your code here
    global queue
    if initialize: queue = []
    queue.append((node_id, parent_node_id))
    return

'''
DFS add to queue 
'''
def is_queue_empty_DFS():
    # Your code here
    global queue
    return len(queue) == 0

'''
DFS pop from queue
'''
def pop_front_DFS():
    # (node_id, parent_node_id) = (0, 0)
    # Your code here
    global queue
    node_id, parent_node_id = queue.pop()
    return (node_id, parent_node_id)

'''
UC add to queue 
'''
def add_to_queue_UC(node_id, parent_node_id, cost, initialize=False):
    # Your code here
    global queue
    if initialize: queue = PriorityQueue()
    queue.put((cost, node_id, parent_node_id))
    return

'''
UC add to queue 
'''
def is_queue_empty_UC():
    # Your code here
    global queue
    return queue.empty()

'''
UC pop from queue
'''
def pop_front_UC():
    # (node_id, parent_node_id) = (0, 0)
    # Your code here
    global queue
    _, node_id, parent_node_id = queue.get()
    return (node_id, parent_node_id)

'''
A* add to queue 
'''
def add_to_queue_ASTAR(node_id, parent_node_id, cost, initialize=False):
    # Your code here
    global queue
    if initialize: queue = PriorityQueue()
    queue.put((cost, node_id, parent_node_id))
    return

'''
A* add to queue 
'''
def is_queue_empty_ASTAR():
    # Your code here
    global queue
    return queue.empty()

'''
A* pop from queue
'''
def pop_front_ASTAR():
    # (node_id, parent_node_id) = (0, 0)
    # Your code here
    global queue
    _, node_id, parent_node_id = queue.get()
    return (node_id, parent_node_id)

''' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ '''
'''
                For n-queens problem 
'''
''' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ '''


'''
Compute a random state 
'''
def get_random_state(n):
    # state = []
    # Your code here 
    return [random.randint(1, n) for _ in range(n)]

'''
Compute pairs of queens in conflict 
'''
def compute_attacking_pairs(state):
    number_attacking_pairs = 0
    # Your code here 
    for i in range(len(state)): # (row, col): (i, state[i]) and (j, state[j])
        for j in range(i + 1, len(state)):
            if j != i and (state[j] == state[i] or abs(j - i) == abs(state[j] - state[i])):
                number_attacking_pairs += 1
            
    return number_attacking_pairs

'''
The basic hill-climing algorithm for n queens
'''
def hill_desending_n_queens(state, comp_att_pairs):
    # final_state = []
    # Your code here
    n = len(state)
    optimal = [(1, 99999)] * n # row and corresp. cost
    for i in range(n):  # traverse each column
        old_row = state[i]
        for j in range(n):  # try each row
            if j == old_row: continue
            state[i] = j + 1
            new_cost = comp_att_pairs(state)
            if optimal[i][1] > new_cost:
                optimal[i] = (j + 1, new_cost)
        state[i] = old_row
        
    row = optimal.index(min(optimal, key=lambda o: o[1]))
    final_state = state[:]
    final_state[row] = optimal[row][0]
    
    return final_state

'''
Hill-climing algorithm for n queens with restart
'''
def n_queens(n, get_rand_st, comp_att_pairs, hill_descending):
    # final_state = []
    # Your code here
    state = get_rand_st(n)
    cost = 99999
    while cost > 0:
        state = hill_descending(state, comp_att_pairs)
        new_cost = comp_att_pairs(state)
        if new_cost == cost:
            state = get_rand_st(n)
        cost = new_cost
    
    return state






