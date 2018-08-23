extends Node

const MATRIX_LINES = 3



func _ready():
    test_matrix_upper()
    test_matrix_lower()
    test_matrix_upper_false()
    test_matrix_lower_false()
    test_matrix_all_zero()
    test_matrix_all_non_zero()
    test_random_matrix_correct()


func is_triangular(upper, matrix):
    
    for i in range(matrix.size()):
        for j in range(matrix[i].size()):
            if upper:
                if j < i and matrix[i][j] != 0:
                    return false
                elif j >= i and matrix[i][j] == 0:
                    return false
            else:
                if j > i and matrix[i][j] != 0:
                    return false
                elif j <= i and matrix[i][j] == 0:
                    return false
    return true


func create_random_matrix(upper):
    var matrix = []
    for i in range(0, MATRIX_LINES):
        matrix.append([])
        for j in range(0, MATRIX_LINES):
            if (upper and i > j) or (!upper and i < j):
                matrix[i].append(0)
            else:
                matrix[i].append(randi()%30+1)
    return matrix


func test_matrix_upper():
    var upper = true
    var matrix = []
    matrix.append([1, 4, 1])
    matrix.append([0, 6, 4])
    matrix.append([0, 0, 1])
    print("\n TEST UPPER MATRIX \n", matrix)
    print(" expected: ", true, " actual ", is_triangular(upper, matrix))


func test_matrix_lower():
    var upper = false
    var matrix = []
    matrix.append([1, 0, 0])
    matrix.append([2, 8, 0])
    matrix.append([4, 9, 7])
    print("\n TEST LOWER MATRIX \n", matrix)
    print(" expected: ", true, " actual ", is_triangular(upper, matrix))


func test_matrix_upper_false():
    var upper = true
    var matrix = []
    matrix.append([1, 4, 1])
    matrix.append([0, 6, 4])
    matrix.append([1, 0, 1])
    print("\n TEST UPPER FALSE MATRIX \n", matrix)
    print(" expected: ", false, " actual ", is_triangular(upper, matrix))


func test_matrix_lower_false():
    var upper = false
    var matrix = []
    matrix.append([1, 0, 1])
    matrix.append([2, 8, 0])
    matrix.append([4, 9, 7])
    print("\n TEST LOWER FALSE MATRIX \n", matrix)
    print(" expected: ", false, " actual ", is_triangular(upper, matrix))


func test_matrix_all_zero():
    var upper = false
    var matrix = []
    matrix.append([0, 0, 0])
    matrix.append([0, 0, 0])
    matrix.append([0, 0, 0])
    print("\n TEST ALL ZERO MATRIX \n", matrix)
    print(" expected: ", false, " actual ", is_triangular(upper, matrix))


func test_matrix_all_non_zero():
    var upper = false
    var matrix = []
    matrix.append([1, 11, 21])
    matrix.append([2, 12, 22])
    matrix.append([3, 13, 23])
    print("\n TEST ALL NON ZERO MATRIX \n", matrix)
    print(" expected: ", false, " actual ", is_triangular(upper, matrix))


func test_random_matrix_correct():
    randomize()
    var upper = (randi()%31+1) % 3 == 0
    var matrix = create_random_matrix(upper)
    print("\n TEST RANDOM ", "UPPER" if upper else "LOWER", " MATRIX \n", matrix)
    print(" expected: ", upper, " actual: ", is_triangular(upper, matrix))