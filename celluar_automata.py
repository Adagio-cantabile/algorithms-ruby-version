def celluar_automata():
    #initialize state with 64 cells, only one is alive
    state = [
        0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0, 0,1,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0,0,0,0,  0,0,0,0]
    next_state = [0] * 64
    
    state_dic = {0:'-', 1:'*'}

    #assign next state 1 if only one neighbour is 1
    for i in range(32):
        print(''.join(state_dic[e] for e in state))
        for i in range(len(state)):
            if i > 0 and i < 63:
                if state[i-1] != state[i+1]:
                    next_state[i] = 1
                else:
                    next_state[i] = 0
            elif i == 0:
                next_state[i] = state[i+1]
            else:
                next_state[i] = state[i-1]
        #pay attention to the way copying a list in Python
        state = next_state[:]

celluar_automata()
