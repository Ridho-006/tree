import 'dart:io';
class node<T>{
  T? nodeValue;
  node<T>? left, right;

  node(this.nodeValue);
}

class BinaryTree<T> {
  node<T>? root;
  BinaryTree() {
    root = null;
  }

  void printInOrder(node? node) {
    if (node != null) {
      printInOrder(node.left);
      stdout.write('${node.nodeValue} ');
      printInOrder(node.right);
    }
  }

  void printPreorder(node? node) {
    if (node != null) {
      stdout.write('${node.nodeValue} ');
      printPreorder(node.left);
      printPreorder(node.right);
    }
  }

  void printPostorder(node? node) {
    if (node != null) {
      printPostorder(node.left);
      printPostorder(node.right);
      stdout.write('${node.nodeValue} ');
    }
  }

  int maxDepth(node? node) {
    if (node == null) {
      return 0;
    } else {
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);
      return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
    }
  }

  void insertLevelOrder(T value) {
    var newNode = node(value);
    
    if (root == null) {
      root = newNode;
      return;
    }

    List queue = <node<T>> [];
    queue.add(root!);

    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);

      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

  void deleteDeepest(node<T>? root, node<T> deleteNode) {
    if (root == null) return;
    List<node<T>> queue = [];
    queue.add(root);

    while (queue.isNotEmpty) {
      node<T> temp = queue.removeAt(0);
      
      if (temp.left != null) {
        if (temp.left == deleteNode) {
          temp.left = null;
          return;
        } else {
          queue.add(temp.left!);
        }
      }

      if (temp.right != null) {
        if (temp.right == deleteNode) {
          temp.right = null;
          return;
        } else {
          queue.add(temp.right!);
        }
      }
    }
  }

  void delete(T key) {
    if (root == null) return;

    if (root!.left == null && root!.right == null) {
      if (root!.nodeValue == key) {
        root = null;
      }
      return;
    }

    List<node<T>> queue = [];
    queue.add(root!);
    node<T>? temp;
    node<T>? keyNode;

    //Cari node dengan key yang ingin dihapus & Ganti dengan node terdalam
    while (queue.isNotEmpty) {
      temp = queue.removeAt(0);

      if (temp.nodeValue == key) {
        keyNode = temp;
      }

      if (temp.left != null) {
        queue.add(temp.left!);
      }

      if (temp.right != null) {
        queue.add(temp.right!);
      }
    }
    if (keyNode != null && temp != null) {
      keyNode.nodeValue = temp.nodeValue;
      deleteDeepest(root, temp);
    }
  }

}
void main(){
  BinaryTree t = BinaryTree();
  t.root = node(10);
  t.root!.left = node(20);
  t.root!.right = node(30);
  t.root!.right!.left = node(4);
  print('traversal inOrder:');
  t.printInOrder(t.root);
  print('\ntraversal preOrder');
  t.printPreorder(t.root);
  print('\ntraversal postOrder');
  t.printPostorder(t.root);

  print("\nKedalaman Binary Tree: ${t.maxDepth(t.root)}");

  print("Nilai pada Level Tertentu pada Binary Tree: ");
  t.insertLevelOrder(15);
  t.insertLevelOrder(17);
  t.insertLevelOrder(18);
  t.insertLevelOrder(19);

  print("In Order traversal: ");
  t.printInOrder(t.root);

  print("\nKedalaman Binary Tree: ${t.maxDepth(t.root)}");
}