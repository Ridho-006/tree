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

  bool find(T item) {
    BstNode<T>? t = findNode(item);
      if (t != null) {
      T value = t.nodeValue;
      return true;
    }
    return false;
  }

  void RemoveNode(BstNode<T>? dNode) {
    if (dNode == null) {
      return;
    }
    BstNode<T>? pNode, rNode;
    pNode = dNode.parent;
    // Node yang dihapus mempunyai satu anak
    if (dNode.left == null || dNode.right == null) {
      if (dNode.right == null) {
        rNode = dNode.left;
      } else {
        rNode = dNode.right;
      }
      if (rNode != null) {
        print("Ngeset Parent");
        rNode.parent = pNode;
      }
      // Menghapus node root
      if (pNode == null) {
        root = rNode;
      } else if ((dNode.nodeValue as Comparable<T>).compareTo(pNode.nodeValue) < 0) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    } // Node yang dihapus mempunyai dua anak
    else {
      BstNode<T>? pOfRNode = dNode;
      rNode = dNode.right;
      pOfRNode = dNode;
      while (rNode!.left != null) {
        pOfRNode = rNode;
        rNode = rNode.left;
      }
      dNode.nodeValue = rNode.nodeValue;
      if (pOfRNode == dNode) {
        dNode.right = rNode.right;
      } else {
        pOfRNode!.left = rNode.right;
      }
      if (rNode.right != null) {
        rNode.right!.parent = pOfRNode;
      }
    }
  }

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

  bool delete(T value) {
    BstNode<T>? nodeToDelete = findNode(value);
    if (nodeToDelete == null) {
      return false;
    }
    RemoveNode(nodeToDelete);
    treeSize--;
    return true;
  }
}

void main() {
  binarySearchTree bst = binarySearchTree<int>();
  bst.insertData(35);
  bst.insertData(18);
  bst.insertData(25);
  bst.insertData(48);
  bst.insertData(20);
  print('Tree Size: ${bst.treeSize}');
 
  var node = bst.findNode(18);
  if (node != null) {
    print('Node found with value: ${node.nodeValue}');
  } else {
    print('Node not found.');
  }

  bool found = bst.find(20);
  if (found) {
    print('Node found');
  } else {
    print('Node not found.');
  }

  print('\ntraversal inOrder:');
  bst.InOrder();

  print('\nMenghapus node 18...');
  bool deleted = bst.delete(18);
  print(deleted ? 'Node berhasil dihapus.' : 'Node tidak ditemukan.');

  print('\nTraversal setelah penghapusan:');
  bst.InOrder();
}