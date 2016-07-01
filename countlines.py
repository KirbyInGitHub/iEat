import fnmatch
import os

def count_one_file(filename):
	with open(filename, 'r') as f:
		return len(f.readlines())


def count_files(path, ftype):
	ans = 0
	for root, dirnames, filenames in os.walk(path):
	    for filename in fnmatch.filter(filenames, '*.'+ftype):
	        ans += count_one_file(os.path.join(root, filename))
	return ans


if __name__ == '__main__':
	path, ftype = raw_input('input folder path and file type separate with a comma:\n').split(',')
	print count_files(path, ftype)
