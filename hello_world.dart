
void main() {
  print('rotate k: ${rotateK([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], 7)}');
  print('cyclic k: ${rotateCyclic([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20], 7)}');
}

List<int> rotateK(List<int> nums, int k) {
  if (nums.length == 0) return nums;

  k = k % nums.length;

  int n = nums.length - 1;

  reverse(nums, 0, n);
  reverse(nums, 0, k - 1);
  reverse(nums, k, n);

  return nums;
}

List<int> reverse(List<int> nums, int left, int right) {
  while (left < right) {
    int temp = nums[left];
    nums[left] = nums[right];
    nums[right] = temp;
    left++;
    right--;
  }

  return nums;
}

// rotate using cycles
// pick item
// find next index to place the picked item
// 

List<int> rotateCyclic(List<int> nums, int k) {
  if (nums.length == 0) return nums;

  int n = nums.length;

  k = k % n;

  int count = 0;

  for (int start = 0; count < n; start++) {
    int current = start;
    int prev = nums[start];

    do {
      int next = (current + k) % n;
      int temp = nums[next];

      nums[next] = prev;
      prev = temp;

      current = next;
      count++;
    } while (start != current);
  }

  return nums;
}