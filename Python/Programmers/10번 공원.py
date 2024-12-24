def solution(mats, park):
    def calculateRectSize(origin, end):
        origin_row, origin_column = origin
        end_row, end_column = end

        if origin_row == 0 and origin_column == 0:
            return rect_psum[end_row][end_column]
        elif origin_row == 0:
            return rect_psum[end_row][end_column] - rect_psum[end_row][origin_column - 1]
        elif origin_column == 0:
            return rect_psum[end_row][end_column] - rect_psum[origin_row - 1][end_column]
        else:
            return (rect_psum[end_row][end_column] 
                    - rect_psum[origin_row - 1][end_column] 
                    - rect_psum[end_row][origin_column - 1] 
                    + rect_psum[origin_row - 1][origin_column - 1])
    
    answer = -1
    width, height = len(park[0]), len(park)
    
    new_matrix = [[1 if x != "-1" else 0 for x in row] for row in park]
    rect_psum = [r[:] for r in new_matrix]

    for row in range(height):
        for column in range(width):
            if row == 0 and column == 0:
                continue
            elif row == 0:
                rect_psum[row][column] += rect_psum[row][column - 1]
            elif column == 0:
                rect_psum[row][column] += rect_psum[row - 1][column]
            else:
                rect_psum[row][column] += (rect_psum[row - 1][column] 
                                            + rect_psum[row][column - 1] 
                                            - rect_psum[row - 1][column - 1])
    for row in range(height):
        for column in range(width):
            for mat in mats:
                if mat < answer or row + mat - 1 >= height or column + mat - 1 >= width:
                    continue
                if calculateRectSize((row, column), (row + mat - 1, column + mat - 1)) == 0:
                    answer = mat

    return answer
