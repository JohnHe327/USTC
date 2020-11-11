import sqlite3
import collections
import math

from build_index_and_matrix import DB_INDEX_PATH
from build_index_and_matrix import stem_words

def search(query):
    # prepare query list
    query = query.replace('(', '( ')
    query = query.replace(')', ' )')
    query = stem_words(query)
    reserved_pattern = {'and':'AND', 'or':'OR', 'not':'NOT'}
    query = [reserved_pattern[x] if x in reserved_pattern else x for x in query]

    text_num = get_text_num()
    indexed_docIDs = [i+1 for i in range(text_num)]
    results_stack = []
    postfix_queue = collections.deque(infix2postfix(query)) # get query in postfix notation as a queue

    while postfix_queue:
        token = postfix_queue.popleft()
        result = [] # the evaluated result at each stage
        # if operand, add postings list for term to results stack
        if (token != 'AND' and token != 'OR' and token != 'NOT'):
            # token = stemmer.stem(token) # stem the token
            # default empty list if not in dictionary
            result = search_token(token)
        
        # else if AND operator
        elif (token == 'AND'):
            right_operand = results_stack.pop()
            left_operand = results_stack.pop()
            # print(left_operand, 'AND', left_operand) # check
            result = boolean_AND(left_operand, right_operand)   # evaluate AND

        # else if OR operator
        elif (token == 'OR'):
            right_operand = results_stack.pop()
            left_operand = results_stack.pop()
            # print(left_operand, 'OR', left_operand) # check
            result = boolean_OR(left_operand, right_operand)    # evaluate OR

        # else if NOT operator
        elif (token == 'NOT'):
            right_operand = results_stack.pop()
            # print('NOT', right_operand) # check
            result = boolean_NOT(right_operand, indexed_docIDs) # evaluate NOT

        # push evaluated result back to stack
        results_stack.append(result)                        
        # print ('result', result) # check

    # NOTE: at this point results_stack should only have one item and it is the final result
    if len(results_stack) != 1: print ("ERROR: results_stack. Please check valid query") # check for errors
    
    return results_stack.pop()

"""
returns the list of postfix tokens converted from the given infix expression
params:
    infix_tokens: list of tokens in original query of infix notation
"""
def infix2postfix(infix_tokens):
    # define precedences
    precedence = {}
    precedence['NOT'] = 3
    precedence['AND'] = 2
    precedence['OR'] = 1
    precedence['('] = 0
    precedence[')'] = 0    

    # declare data strucures
    output = []
    operator_stack = []

    # while there are tokens to be read
    for token in infix_tokens:
        
        # if left bracket
        if (token == '('):
            operator_stack.append(token)
        
        # if right bracket, pop all operators from operator stack onto output until we hit left bracket
        elif (token == ')'):
            operator = operator_stack.pop()
            while operator != '(':
                output.append(operator)
                operator = operator_stack.pop()
        
        # if operator, pop operators from operator stack to queue if they are of higher precedence
        elif (token in precedence):
            # if operator stack is not empty
            if (operator_stack):
                current_operator = operator_stack[-1]
                while (operator_stack and precedence[current_operator] > precedence[token]):
                    output.append(operator_stack.pop())
                    if (operator_stack):
                        current_operator = operator_stack[-1]

            operator_stack.append(token) # add token to stack
        
        # else if operands, add to output list
        else:
            output.append(token.lower())

    # while there are still operators on the stack, pop them into the queue
    while (operator_stack):
        output.append(operator_stack.pop())
    # print ('postfix:', output)  # check
    return output

'''
returns the list of DocIDs which contain the token
params: 
    token: a term in the query
'''
def search_token(token):
    conn = sqlite3.connect(DB_INDEX_PATH)
    c = conn.cursor()
    c.execute('''SELECT textIDs
                FROM invindex
                WHERE word = '{}' '''.format(token))
    result = c.fetchone()
    if result == None:
        return []

    docid_list = list(map(int, str(result).strip("(),'").split(' ')))
    conn.close()
    return docid_list

"""
returns the list of docIDs which is the compliment of given right_operand 
params:
    right_operand:  sorted list of docIDs to be complimented
    indexed_docIDs: sorted list of all docIDs indexed
"""
def boolean_NOT(right_operand, indexed_docIDs):
    # complement of an empty list is list of all indexed docIDs
    if (not right_operand):
        return indexed_docIDs
    
    result = []
    r_index = 0 # index for right operand
    for item in indexed_docIDs:
        # if item do not match that in right_operand, it belongs to compliment 
        if (item != right_operand[r_index]):
            result.append(item)
        # else if item matches and r_index still can progress, advance it by 1
        elif (r_index + 1 < len(right_operand)):
            r_index += 1
    return result

"""
returns list of docIDs that results from 'OR' operation between left and right operands
params:
    left_operand:   docID list on the left
    right_operand:  docID list on the right
"""
def boolean_OR(left_operand, right_operand):
    result = []     # union of left and right operand
    l_index = 0     # current index in left_operand
    r_index = 0     # current index in right_operand

    # while lists have not yet been covered
    while (l_index < len(left_operand) or r_index < len(right_operand)):
        # if both list are not yet exhausted
        if (l_index < len(left_operand) and r_index < len(right_operand)):
            l_item = left_operand[l_index]  # current item in left_operand
            r_item = right_operand[r_index] # current item in right_operand
            
            # case 1: if items are equal, add either one to result and advance both pointers
            if (l_item == r_item):
                result.append(l_item)
                l_index += 1
                r_index += 1

            # case 2: l_item greater than r_item, add r_item and advance r_index
            elif (l_item > r_item):
                result.append(r_item)
                r_index += 1

            # case 3: l_item lower than r_item, add l_item and advance l_index
            else:
                result.append(l_item)
                l_index += 1

        # if left_operand list is exhausted, append r_item and advance r_index
        elif (l_index >= len(left_operand)):
            r_item = right_operand[r_index]
            result.append(r_item)
            r_index += 1

        # else if right_operand list is exhausted, append l_item and advance l_index 
        else:
            l_item = left_operand[l_index]
            result.append(l_item)
            l_index += 1

    return result

"""
returns list of docIDs that results from 'AND' operation between left and right operands
params:
    left_operand:   docID list on the left
    right_operand:  docID list on the right
"""
def boolean_AND(left_operand, right_operand):
    # perform 'merge'
    result = []                                 # results list to be returned
    l_index = 0                                 # current index in left_operand
    r_index = 0                                 # current index in right_operand
    l_skip = int(math.sqrt(len(left_operand)))  # skip pointer distance for l_index
    r_skip = int(math.sqrt(len(right_operand))) # skip pointer distance for r_index

    while (l_index < len(left_operand) and r_index < len(right_operand)):
        l_item = left_operand[l_index]  # current item in left_operand
        r_item = right_operand[r_index] # current item in right_operand
        
        # case 1: if match
        if (l_item == r_item):
            result.append(l_item)   # add to results
            l_index += 1            # advance left index
            r_index += 1            # advance right index
        
        # case 2: if left item is more than right item
        elif (l_item > r_item):
            # if r_index can be skipped (if new r_index is still within range and resulting item is <= left item)
            if (r_index + r_skip < len(right_operand)) and right_operand[r_index + r_skip] <= l_item:
                r_index += r_skip
            # else advance r_index by 1
            else:
                r_index += 1

        # case 3: if left item is less than right item
        else:
            # if l_index can be skipped (if new l_index is still within range and resulting item is <= right item)
            if (l_index + l_skip < len(left_operand)) and left_operand[l_index + l_skip] <= r_item:
                l_index += l_skip
            # else advance l_index by 1
            else:
                l_index += 1

    return result

def get_text_num():
    conn = sqlite3.connect(DB_INDEX_PATH)
    c = conn.cursor()
    c.execute('''SELECT value
                FROM variables
                WHERE name = 'text_num' ''')
    result = int(c.fetchone()[0])
    conn.close()
    return result   

# TEST FUNCTIONS

def test_search_token(token):
    doclist = search_token(token)
    print(doclist)

if __name__ == "__main__":
    query_str = input("Please input your bool query (words connected with AND, OR, NOT): ")
    print(search(query_str))
