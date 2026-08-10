def rotate(key):
    m = len(key)
    return [[key[m - col - 1][row] for col in range(m)] for row in range(m)]

def create_padded_lock(lock, pad):
    n = len(lock)
    size = n + pad * 2
    padded = [[0] * size for _ in range(size)]
    holes = []
    
    for i in range(n):
        for j in range(n):
            val = lock[i][j]
            padded[i + pad][j + pad] = val
            if val == 0:
                holes.append((i + pad, j + pad))
    return padded, holes

def is_unlocked(temp_lock, holes):
    return all(temp_lock[i][j] == 1 for i, j in holes)

def solution(key, lock):
    m, n = len(key), len(lock)
    pad = m - 1
    padded_lock, holes = create_padded_lock(lock, pad)
    size = len(padded_lock)
    
    for _ in range(4):
        key = rotate(key)
        for x in range(n + pad):
            for y in range(n + pad):
                temp = [row[:] for row in padded_lock]
                valid = True
                for i in range(m):
                    for j in range(m):
                        px, py = x + i, y + j
                        if key[i][j] == 1:
                            if temp[px][py] == 1:
                                valid = False
                                break
                            temp[px][py] += 1
                    if not valid:
                        break

                if valid and is_unlocked(temp, holes):
                    return True
    return False
