# Binary Search Tree Complexity Analysis

Let $n$ be the number of stored values and $h$ be the tree height. This BST does not rebalance itself, so operation cost depends on the shape of the tree.

| Operation | Average time | Worst-case time | Auxiliary space |
| --- | ---: | ---: | ---: |
| Insert | $O(\log n)$ | $O(n)$ | $O(h)$ recursive stack |
| Search / contains | $O(\log n)$ | $O(n)$ | $O(h)$ recursive stack |
| Remove | $O(\log n)$ | $O(n)$ | $O(h)$ recursive stack |
| Minimum / maximum | $O(\log n)$ | $O(n)$ | $O(h)$ recursive stack |
| Height | $O(n)$ | $O(n)$ | $O(h)$ recursive stack |
| In-order, pre-order, post-order traversal | $O(n)$ | $O(n)$ | $O(h)$ stack, plus $O(n)$ result storage |
| Empty / size | $O(1)$ | $O(1)$ | $O(1)$ |

For a reasonably balanced tree, height is approximately $\log_2 n$, making search, insertion, removal, and extrema lookup logarithmic. A sorted insertion sequence creates a skewed tree with height $n$, making those operations linear and increasing recursive call depth to $O(n)$. A sufficiently skewed tree can therefore exhaust the call stack.

The implementation uses recursive operations throughout. Recursion follows the tree structure directly and keeps the code compact, while an iterative search or update could avoid recursive stack use. Iterative versions require explicit traversal state, and traversal algorithms commonly use an auxiliary stack. A self-balancing tree (such as an AVL tree or red-black tree) is preferable when worst-case logarithmic operations are important.

The tree owns its dynamically allocated nodes and disables copy construction and copy assignment to prevent shallow copies from sharing pointers and attempting to free the same nodes twice.