import 'dart:collection';
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

  //traversal preOrder non rekursif
  void PreOrder() {
    if (root == null) return;

    var stack = <node<T>>[];
    stack.add(root!);

    while (stack.isNotEmpty) {
      final current = stack.removeLast();
      stdout.write('${current.nodeValue} ');

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
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

  //traversal inOrder non rekursif
  void InOrder() {
    var stack = <node<T>>[];
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

  //traversal postOrder dengan rekursif
  void printPostOrder(node? Node){
    if(Node != null){
      printPostOrder(Node.left);
      printPostOrder(Node.right);
      stdout.write('${Node.nodeValue} ');
    }
  }

  //traversal postOrder non rekursif
  void PostOrder() {
    if (root == null) return;

    var stack1 = <node<T>>[];
    var stack2 = <node<T>>[];
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

  void insertRoot(T newValue){
    node<T> newNode = node(newValue);
    
    if(newValue == null){
      root = newNode;
      return;
    }
  }

  //insert level order dengan bantuan queue
  void insertLevelOrder(T value) {
    var newNode = node(value);
    
    if (root == null) {
      root = newNode;
      return;
    }

    var queue = Queue<node<T>>();
    queue.add(root!);

    while (queue.isNotEmpty) {
      var current = queue.removeFirst();

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

  //insert target dengan linier search
  void insertByTarget(T value, T target) {
    if (root == null){
      print('binary tree kosong.');
      return ;
    }
    var queue = <node<T>>[];
    queue.add(root!);

    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);
      if (current.nodeValue == target) {
        if (current.left == null) {
          current.left = node<T>(value);
          return;
        } else if (current.right == null) {
          current.right = node<T>(value);
          return;
        } else {
          print('target $target sudah mempunyai 2 anak node!');
          return;
        }
      }
      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
    print('target $target tidak di temukan!');
    return;
  }
}