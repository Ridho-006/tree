import 'dart:io';
class BstNode<T> {
  T nodeValue;
  BstNode<T>? left, right, parent;

  BstNode(this.nodeValue, [this.parent]);
}

class binarySearchTree<T extends Comparable> {
  BstNode<T>? root;
  int treeSize = 0;

  bool insertData(T newValue){
    BstNode<T>? node = root, parent;
    int orderValue = 0;

    while (node != null) {
      parent = node;
      orderValue = newValue.compareTo(node.nodeValue);
      if (orderValue == 0) {
      return false;
      } else if (orderValue < 0) {
      node = node.left;
      } else {
      node = node.right;
      }
    }

    BstNode<T> newNode = BstNode(newValue, parent);
    if (parent == null) {
      root = newNode;
    } else if (orderValue < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }
    treeSize++;
    return true;
  }

  // Fungsi untuk menampilkan visualisasi struktur pohon BST
  void printTree([BstNode<T>? node, String prefix = '', bool isLeft = true]) {
    node ??= root;
    if (node == null) return;

    if (node.right != null) {
      printTree(node.right, prefix + (isLeft ? "│   " : "    "), false);
    }

    stdout.write(prefix);
    stdout.write(isLeft ? "└── " : "┌── ");
    print(node.nodeValue);

    if (node.left != null) {
      printTree(node.left, prefix + (isLeft ? "    " : "│   "), true);
    }
  }

  //traversal pre order
  void PreOrder() {
    if (root == null) return;

    List stack = <BstNode<T>> [];
    stack.add(root!);

    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      stdout.write('${current.nodeValue} ');

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

  //traversal in Order
  void InOrder() {
    var stack = <BstNode<T>>[];
    var current = root;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write('${current.nodeValue} ');
      current = current.right;
    }
  }

  //traversal post order
  void PostOrder() {
    if (root == null) return;

    List stack1 = <BstNode<T>> []; //untuk proses traversal awal
    List stack2 = <BstNode<T>> []; //untuk menyimpan urutan hasil post-order
    stack1.add(root!);

    while (stack1.isNotEmpty) {
      var current = stack1.removeLast();
      stack2.add(current);

      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }

    while (stack2.isNotEmpty) {
      stdout.write('${stack2.removeLast().nodeValue} ');
    }
  }

  BstNode<T>? findNode (T data) {
    BstNode<T>? node = root;
    int orderValue = 0;
    while (node != null) {
      orderValue = data.compareTo(node.nodeValue);
      if (orderValue == 0) {
        return node;
      } else if (orderValue < 0) {
        node = node.left;
      } else {
        node = node.right;
      }
    }
    return null;
  }

}