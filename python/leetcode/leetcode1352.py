# https://leetcode.com/problems/product-of-the-last-k-numbers

class ProductOfNumbers:
    def __init__(self):
        self.prefixProduct = [1]

    def add(self, num: int) -> None:
        if num == 0:
            self.prefixProduct = [1]
        else:
            self.prefixProduct.append(self.prefixProduct[-1] * num)

    def getProduct(self, k: int) -> int:
        if k >= len(self.prefixProduct):
            return 0

        return self.prefixProduct[-1] // self.prefixProduct[-k - 1]
