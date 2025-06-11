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

    List stack = <node<T>> [];
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

    List stack1 = <node<T>> []; //untuk proses traversal awal
    List stack2 = <node<T>> []; //untuk menyimpan urutan hasil post-order
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

  //insert target dengan linier search
  void insertByTarget(T value, T target) {
    if (root == null){
      print('binary tree kosong.');
      return ;
    }
    List queue = <node<T>>[];
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

  // Menghapus data pada Binary Tree
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

  int maxDepth(node? node) {
    if (node == null) {
      return 0;
    } else {
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);
      return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
    }
  }
}