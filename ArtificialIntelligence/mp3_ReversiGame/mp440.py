# directions stores lambdas to move in the 8 directions
directions = (lambda (i, j): (i - 1, j), lambda (i, j): (i + 1, j),
         lambda (i, j): (i, j - 1), lambda (i, j): (i, j + 1),
         lambda (i, j): (i - 1, j - 1), lambda (i, j): (i - 1, j + 1),
         lambda (i, j): (i + 1, j - 1), lambda (i, j): (i + 1, j + 1))


def valid_direction(state, row, column, player, direction):
    """checks if the move flipps any pieces in the direction"""
    r, c = len(state), len(state[0])
    i, j = direction((row, column))
    flip = False
    while 0 <= i < r and 0 <= j < c:
        if state[i][j] == ' ': return False
        if state[i][j] == player: return flip
        flip = True
        i, j = direction((i, j))
    return False


def valid_move(state, row, column, player):
    """checks if the move flippes any pieces"""
    for d in directions:
        if valid_direction(state, row, column, player, d):
            return True
    return False

'''
Compute the value brought by a given move by placing a new token for player
at (row, column). The value is the number of opponent pieces getting flipped
by the move. 

A move is valid if for the player, the location specified by (row, column) is
(1) empty and (2) will cause some pieces from the other player to flip. The
return value for the function should be the number of pieces hat will be moved.
If the move is not valid, then the value 0 (zero) should be returned. Note
here that row and column both start with index 0. 
'''
def get_move_value(state, player, row, column):
    if state[row][column] != ' ': return 0
    flipped = 0
    r, c = len(state), len(state[0])

    def count_a_direction(direction):
        i, j = direction((row, column))
        count = 0
        while 0 <= i < r and 0 <= j < c:
            if state[i][j] == ' ': return 0
            if state[i][j] == player: return count
            count += 1
            i, j = direction((i, j))
        return 0

    for d in directions:
        flipped += count_a_direction(d)
    return flipped


'''
Execute a move that updates the state. A new state should be crated. The move
must be valid. Note that the new state should be a clone of the old state and
in particular, should not share memory with the old state. 
'''
def execute_move(state, player, row, column):
    r, c = len(state), len(state[0])
    new_state = [s[:] for s in state]
    new_state[row][column] = player

    def flip_a_direction(direction):
        copy = None
        i, j = direction((row, column))
        while 0 <= i < r and 0 <= j < c:
            if new_state[i][j] == ' ': return None
            if new_state[i][j] == player: return copy
            if not copy: copy = [s[:] for s in new_state]
            copy[i][j] = player
            i, j = direction((i, j))

    for d in directions:
        copy = flip_a_direction(d)
        if copy: new_state = copy
    return new_state



def execute_move_inplace(state, player, row, column):
    r, c = len(state), len(state[0])
    state[row][column] = player

    def flip_a_direction(direction):
        if not valid_direction(state, row, column, player, direction): return
        i, j = direction((row, column))
        while 0 <= i < r and 0 <= j < c:
            if state[i][j] == player: return
            state[i][j] = player
            i, j = direction((i, j))

    for d in directions:
        flip_a_direction(d)
        
        
'''
A method for counting the pieces owned by the two players for a given state. The
return value should be two tuple in the format of (blackpeices, white pieces), e.g.,

    return (4, 3)

'''
def count_pieces(state):
    blackpieces = whitepieces = 0
    for s in state:
        for p in s:
            if p == 'B': blackpieces += 1
            elif p == 'W': whitepieces += 1
    return (blackpieces, whitepieces)


def state_to_hashable(state, player):
    """converts state to hashable object"""
    return "".join(j for i in state for j in i) + player
    
    
'''
Check whether a state is a terminal state. 
'''
def is_terminal_state(state, state_list=None):
    r, c = len(state), len(state[0])
    if state_list:
        for i, j in state_list:
            if valid_move(state, i, j, 'B') or valid_move(state, i, j, 'W'):
                return False
    else:
        for i in xrange(r):
            for j in xrange(c):
                if state[i][j] == ' ' and (valid_move(state, i, j, 'B') or valid_move(state, i, j, 'W')): 
                    return False
    return True


def get_empty_pos(state):
    r, c = len(state), len(state[0])
    pos = []
    for i in xrange(r):
        for j in xrange(c):
            if state[i][j] == ' ':
                pos.append((i, j))
    return pos
            

minimax_vals = {}

'''
The minimax algorithm. Your implementation should return the best value for the
given state and player, as well as the next immediate move to take for the player. 
'''
def minimax(state, player, all_vals=True, empty_pos=None):
    """
    If all values is true and player has no valid move while opponent can move,
    minimax returns value, -1, -1 instead of None.
    """
    key = state_to_hashable(state, player)
    if not all_vals and key in minimax_vals:
        return minimax_vals[key]
    
    if not empty_pos:
        empty_pos = get_empty_pos(state)
        
    if is_terminal_state(state, state_list=empty_pos):  # don't memorize to reduce memory usage
        blacks, whites = count_pieces(state)
        return blacks - whites, -1, -1
    
    opponent = 'W' if player == 'B' else 'B'
    moved = False
    
    if player == 'B':
        best = -10000000, None, None
        for i, j in empty_pos:
            if valid_move(state, i, j, player):
                moved = True
                new_state = execute_move(state, player, i, j)
                new_empty_pos = [p[:] for p in empty_pos]
                new_empty_pos.remove((i, j))
                result = minimax(new_state, opponent, all_vals=all_vals, empty_pos=new_empty_pos)
                if not result:
                    best = minimax(new_state, player, all_vals=all_vals, empty_pos=new_empty_pos)
                    minimax_vals[key] = best
                    return best
                if result[0] > best[0]:
                    best = result[0], i, j
    else:
        best = 10000000, None, None
        for i, j in empty_pos:
            if valid_move(state, i, j, player):
                moved = True
                new_state = execute_move(state, player, i, j)
                new_empty_pos = [p[:] for p in empty_pos]
                new_empty_pos.remove((i, j))
                result = minimax(new_state, opponent, all_vals=all_vals, empty_pos=new_empty_pos)
                if not result:
                    best = minimax(new_state, player, all_vals=all_vals, empty_pos=new_empty_pos)
                    minimax_vals[key] = best
                    return best
                if result[0] < best[0]:
                    best = result[0], i, j
    if not moved:  # no valid moves for player
        if all_vals:
            return minimax(state, opponent)[0], -1, -1
        minimax_vals[key] = None
        return None
    minimax_vals[key] = best
    return best  # (value, row, column)


'''
This method should call the minimax algorithm to compute an optimal move sequence
that leads to an end game. 
'''
def full_minimax(state, player):
    move_sequence = []  # [(player, row, column), ...]
    opponent = 'W' if player == 'B' else 'B'
    new_state = [s[:] for s in state]
    empty_pos = get_empty_pos(new_state)
    
    result = minimax(new_state, player, all_vals=False, empty_pos=empty_pos)
    if not result:
        player, opponent = opponent, player
        result = minimax(new_state, player, all_vals=False, empty_pos=empty_pos)
    value, row, column = result
    
    while row >= 0:
        move_sequence.append((player, row, column))
        empty_pos.remove((row, column))
        execute_move_inplace(new_state, player, row, column)
        player, opponent = opponent, player
        result = minimax(new_state, player, all_vals=False, empty_pos=empty_pos)
        if not result:
            player, opponent = opponent, player
            result = minimax(new_state, player, all_vals=False, empty_pos=empty_pos)
        _, row, column = result
    
    return value, move_sequence + [(player, row, column)]
    

'''
The minimax algorithm with alpha-beta pruning. Your implementation should return the
best value for the given state and player, as well as the next immediate move to take
for the player. 
'''
def minimax_ab(state, player, alpha=-10000000, beta=10000000, all_vals=True, empty_pos=None):
    """
    If all values is true and player has no valid move while opponent can move,
    minimax returns value, -1, -1 instead of None.
    """
    key = state_to_hashable(state, player)
    if not all_vals: 
        if key in minimax_vals:
            return minimax_vals[key]
        if (key, alpha, beta) in minimax_vals:
            return minimax_vals[(key, alpha, beta)]
    
    if not empty_pos:
        empty_pos = get_empty_pos(state)
    
    if is_terminal_state(state, state_list=empty_pos):
        blacks, whites = count_pieces(state)
        return blacks - whites, -1, -1

    opponent = 'W' if player == 'B' else 'B'
    moved = False
    
    if player == 'B':
        best = -10000000, None, None
        for i, j in empty_pos:
            if valid_move(state, i, j, player):
                moved = True
                new_state = execute_move(state, player, i, j)
                new_empty_pos = [p[:] for p in empty_pos]
                new_empty_pos.remove((i, j))
                result = minimax_ab(new_state, opponent, alpha, beta, all_vals=all_vals, empty_pos=new_empty_pos)
                if not result:
                    best = minimax_ab(new_state, player, alpha, beta, all_vals=all_vals, empty_pos=new_empty_pos)
                    minimax_vals[key] = best
                    return best
                if result[0] > best[0]:
                    best = result[0], i, j
                if best[0] >= beta:
                    minimax_vals[(key, alpha, beta)] = best  # depends on alpha/beta, can't just store
                    return best
                alpha = max(alpha, best[0])
    else:
        best = 10000000, None, None
        for i, j in empty_pos:
            if valid_move(state, i, j, player):
                moved = True
                new_state = execute_move(state, player, i, j)
                new_empty_pos = [p[:] for p in empty_pos]
                new_empty_pos.remove((i, j))
                result = minimax_ab(new_state, opponent, alpha, beta, all_vals=all_vals, empty_pos=new_empty_pos)
                if not result:
                    best = minimax_ab(new_state, player, alpha, beta, all_vals=all_vals, empty_pos=new_empty_pos)
                    minimax_vals[key] = best
                    return best
                if result[0] < best[0]:
                    best = result[0], i, j
                if best[0] <= alpha:
                    minimax_vals[(key, alpha, beta)] = best
                    return best
                beta = min(beta, best[0])
    if not moved:  # no valid moves for player
        if all_vals:
            return minimax_ab(state, opponent)[0], -1, -1
        minimax_vals[key] = None
        return None
    minimax_vals[key] = best
    return best


'''
This method should call the minimax_ab algorithm to compute an optimal move sequence
that leads to an end game, using alpha-beta pruning.
'''
def full_minimax_ab(state, player):
    move_sequence = []  # [(player, row, column), ...]
    opponent = 'W' if player == 'B' else 'B'
    new_state = [s[:] for s in state]
    empty_pos = get_empty_pos(new_state)
    
    result = minimax_ab(new_state, player, all_vals=False, empty_pos=empty_pos)
    if not result:
        player, opponent = opponent, player
        result = minimax_ab(new_state, player, all_vals=False, empty_pos=empty_pos)
    value, row, column = result
    
    while row >= 0:
        move_sequence.append((player, row, column))
        empty_pos.remove((row, column))
        execute_move_inplace(new_state, player, row, column)
        player, opponent = opponent, player
        result = minimax_ab(new_state, player, all_vals=False, empty_pos=empty_pos)
        if not result:
            player, opponent = opponent, player
            result = minimax_ab(new_state, player, all_vals=False, empty_pos=empty_pos)
        _, row, column = result
        
    return value, move_sequence + [(player, row, column)]
