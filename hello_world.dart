
void main() {
  print(rotateK([1,2,3,4,5,6,7], 3));
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