import'dart:io';
class node<T>{
  T? nodeValue;
  node<T>? left, right;

  node(this.nodeValue);
}

class binaryTree<T>{
  node<T>? root;

  // traversal preOrder dengan rekursif
  void printPreOrder(node? Node){
    if(Node != null){
      stdout.write('${Node.nodeValue} ');
      printPreOrder(Node.left);
      printPreOrder(Node.right);
    }
  }

  //traversal inOrder dengan rekursif
  void printInOrder(node? Node){
    if(Node != null){
      printInOrder(Node.left);
      stdout.write('${Node.nodeValue} ');
      printInOrder(Node.right);
    }
  }

  //traversal postOrder dengan rekursif
  void printPostOrder(node? Node){
    if(Node != null){
      printPostOrder(Node.left);
      printPostOrder(Node.right);
      stdout.write('${Node.nodeValue} ');
    }
  }

  //insert level order dengan bantuan queue
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
}
void main () {
  binaryTree bt = binaryTree();

  bt.insertLevelOrder('A');
  bt.insertLevelOrder('*');
  bt.insertLevelOrder('B');
  bt.insertLevelOrder('-');
  bt.insertLevelOrder('C');
  bt.insertLevelOrder('^');
  bt.insertLevelOrder('D');
  bt.insertLevelOrder('+');
  bt.insertLevelOrder('E');
  bt.insertLevelOrder('/');
  bt.insertLevelOrder('F');

  print('Traversal PreOrder');
  bt.printPreOrder(bt.root);
  print('\nTraversal InOrder');
  bt.printInOrder(bt.root);
  print('\nTraversal PostOrder');
  bt.printPostOrder(bt.root);
}