import fnmatch
import os

def count_one_file(filename):
	with open(filename, 'r') as f:
		return len(f.readlines())


def count_files(path, ftype):
	res = {}
	for ft in ftype:
		ans = 0
		for root, dirnames, filenames in os.walk(path):
		    for filename in fnmatch.filter(filenames, '*.'+ft):
		        ans += count_one_file(os.path.join(root, filename))
		res.update({ft: ans})
	return res


if __name__ == '__main__':
	path = raw_input('folder path please:\n')
	ftype = raw_input('file type separate with a comma:\n').split(',')
	print count_files(path, ftype)
