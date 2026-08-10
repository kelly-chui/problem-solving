def checkValidity(structure):
    for x, y, frame in structure:
        if frame == 0:
            if (
                y == 0 
                or (x, y - 1, 0) in structure
                or (x - 1, y, 1) in structure
                or (x, y, 1) in structure
            ):
                continue
            return False
        if frame == 1:
            if (
                (x, y - 1, 0) in structure
                or (x + 1, y - 1, 0) in structure
                or ((x - 1, y, 1) in structure and (x + 1, y, 1) in structure)
            ):
                continue
            return False
    return True

def solution(n, build_frame):
    structure = set()
    for x, y, a, b in build_frame:
        if b == 0:
            structure.discard((x, y, a))
            if not checkValidity(structure):
                structure.add((x, y, a))
        elif b == 1:
            structure.add((x, y, a))
            if not checkValidity(structure):
                structure.discard((x, y, a))
    answer = sorted([list(t) for t in structure], key=lambda e: (e[0], e[1], e[2]))
    return answer
