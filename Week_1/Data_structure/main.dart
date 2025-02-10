//Tạo một danh sách số nguyên và in ra màn hình các phần tử trong danh sách.
import 'dart:collection';

void bai1() {
  List<int> list = [1, 2, 3, 4, 5];
  print('list: $list');
}

//Tạo một map của các đôi tượng với các trường tên và giá trị, in ra màn hình các đối tượng trong map.
void bai2() {
  Map<String, int> map = {
    'one': 1,
    'two': 2,
    'three': 3,
  };
  print('map: $map');
}

//Tạo một set của các chuỗi và in ra màn hình tất cả các phần tử trong set.
void bai3() {
  Set<String> set = {'one', 'two', 'three'};
  print('set: $set');
}

//Tạo một queue và thực hiện các hoạt động thêm phần tử vào queue, xóa phần tử khỏi queue, và in ra màn hình các phần tử trong queue.
void bai4() {
  Queue<int> queue = Queue();
  queue.add(1);
  queue.add(2);
  queue.add(3);
  print('queue: $queue');
  queue.removeFirst();
  print('queue: $queue');
}

//Tạo một stack và thực hiện các hoạt động thêm phần tử vào stack, xóa phần tử khỏi stack, và in ra màn hình các phần tử trong stack.
void bai5() {
  List<int> stack = [];
  stack.add(1);
  stack.add(2);
  stack.add(3);
  print('stack: $stack');
  stack.removeLast();
  print('stack: $stack');
}

//Tạo một linked list và thực hiện các hoạt động thêm phần tử vào linked list, xóa phần tử khỏi linked list, và in ra màn hình các phần tử trong linked list.
base class IntEntry extends LinkedListEntry<IntEntry> {
  final int value;
  IntEntry(this.value);

  @override
  String toString() => '$value';
}

void bai6() {
  LinkedList<IntEntry> linkedList = LinkedList<IntEntry>();
  linkedList.add(IntEntry(1));
  linkedList.add(IntEntry(2));
  linkedList.add(IntEntry(3));
  print('linkedList: $linkedList');
  linkedList.remove(linkedList.first);
  print('linkedList: $linkedList');
}

//Tạo một binary tree và thực hiện các hoạt động thêm phần tử vào binary tree, xóa phần tử khỏi binary tree, và in ra màn hình các phần tử trong binary tree.
void bai7() {
  BinaryTree binaryTree = BinaryTree();
  binaryTree.insert(5);
  binaryTree.insert(3);
  binaryTree.insert(7);
  print('binaryTree: $binaryTree');
  binaryTree.remove(3);
  print('binaryTree: $binaryTree');
}

class BinaryTree {
  Node? root;

  void insert(int value) {
    root = _insert(root, value);
  }

  Node _insert(Node? node, int value) {
    if (node == null) {
      return Node(value);
    }
    if (value < node.value) {
      node.left = _insert(node.left, value);
    } else {
      node.right = _insert(node.right, value);
    }
    return node;
  }

  void remove(int value) {
    root = _remove(root, value);
  }

  Node? _remove(Node? node, int value) {
    if (node == null) {
      return null;
    }
    if (value < node.value) {
      node.left = _remove(node.left, value);
    } else if (value > node.value) {
      node.right = _remove(node.right, value);
    } else {
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      node.value = _minValue(node.right!);
      node.right = _remove(node.right, node.value);
    }
    return node;
  }

  int _minValue(Node node) {
    int minValue = node.value;
    while (node.left != null) {
      node = node.left!;
      minValue = node.value;
    }
    return minValue;
  }

  @override
  String toString() {
    return _inOrder(root).toString();
  }

  List<int> _inOrder(Node? node) {
    List<int> res = [];
    if (node != null) {
      res.addAll(_inOrder(node.left));
      res.add(node.value);
      res.addAll(_inOrder(node.right));
    }
    return res;
  }
}

class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value);
}

//Tạo một graph và thực hiện các hoạt động thêm cạnh vào graph, xóa cạnh khỏi graph, và in ra màn hình các đỉnh và cạnh trong graph.
void bai8() {
  Graph graph = Graph();
  graph.addEdge(1, 2);
  graph.addEdge(2, 3);
  graph.addEdge(3, 1);
  print('graph: $graph');
  graph.removeEdge(2, 3);
  print('graph: $graph');
}

class Graph {
  Map<int, List<int>> adjList = {};

  void addEdge(int v, int w) {
    adjList.putIfAbsent(v, () => []).add(w);
    adjList.putIfAbsent(w, () => []).add(v);
  }

  void removeEdge(int v, int w) {
    adjList[v]?.remove(w);
    adjList[w]?.remove(v);
  }

  @override
  String toString() {
    return adjList.toString();
  }
}
