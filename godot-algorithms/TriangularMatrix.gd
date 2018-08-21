extends Node

const MATRIX_LINES = 3

var matrix = []
var is_upper = true 


func _ready():
    var test
    
    print(" TEST UPPER MATRIX")
    create_test_matrix_upper()
    test = is_triangular(is_upper)
    print(matrix)
    print(" expected: ", is_upper, 
          " actual ", test)
    
    print(" TEST LOWER MATRIX ")
    create_test_matrix_lower()
    test = is_triangular(!is_upper)
    print(matrix)
    print(" expected: ", !is_upper, 
          " actual ", test)
    
    print(" TEST RANDOM ", "UPPER" if is_upper else "LOWER", " MATRIX ")
    create_random_matrix(is_upper)
    test = is_triangular(is_upper)
    print(matrix)
    print(is_upper , 
          " expected: ", is_upper or !is_upper, 
          " actual: ", test)

func create_random_matrix(is_upper):
    randomize()
    matrix = []
    is_upper = (randi()%31+1) % 3 == 0
    for i in range(0, MATRIX_LINES):
        matrix.append([])
        for j in range(0, MATRIX_LINES):
            if (is_upper and i < j) or (!is_upper and i > j):
                matrix[i].append(0)
            else:
                matrix[i].append(randi()%30+1)


func is_triangular(is_upper):
    var top
    var bottom
    for i in range(matrix.size()):
        for j in range(matrix[i].size()):
            top = (true if is_upper and (   i <  j and matrix[i][j] == 0
                                         or i >= j and matrix[i][j] != 0)
                        else false)
            bottom = (true if !is_upper and (   i <= j and matrix[i][j] != 0
                                             or i >  j and matrix[i][j] == 0)
                           else false)
    return ((top and !bottom) if is_upper 
                              else (bottom and !top))


func create_test_matrix_upper():
    matrix = []
    is_upper = true
    matrix.append([1, 4, 1])
    matrix.append([0, 6, 4])
    matrix.append([0, 0, 1])


func create_test_matrix_lower():
    matrix = []
    is_upper = false
    matrix.append([1, 0, 0])
    matrix.append([2, 8, 0])
    matrix.append([4, 9, 7])

