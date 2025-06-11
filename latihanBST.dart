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

  T? first() {
    BstNode<T>? current = root;
    if (current == null) {
      return null;
    }
    while (current!.left != null) {
      current = current.left;
    }
    return current.nodeValue;
  } 
}

void main(){
  binarySearchTree bst = binarySearchTree();
  bst.insertData(60);
  bst.insertData(34);
  bst.insertData(56);
  bst.insertData(22);

  bst.printTree();
  var terkecil = bst.first();
  print('\nNilai terkecil dalam BST: $terkecil');
}