import random
import sys

# The code given was throwing all kinds of indent and zero-space character warnings, so I removed most of the comments to get rid of the clutter.


def confu(dictname, inname, outname):
    confulist = []
    linewords = []

    # open and read in the dictionary
    # the dictionary is a list of lists
    # each sublist is a tab-separated list of
    # two to three words
    file1 = open(dictname, 'r')
    for line in file1.readlines():
        confulist.append(line.strip().split("\t"))

    file1.close()
    file1 = open(inname, 'r')

    outfile = open(outname, 'w')

    # for each line in 'infile' ...
    for line in file1.readlines():
        linewords = line.strip().split(" ")

        for word in linewords:
            for subList in confulist:
                if word in subList:
                    subListCopy = list(subList)  # Copy sublist
                    subListCopy.remove(word)  # Remove the old word since we don't want to select it again.
                    line = line.replace(word, random.choice(subListCopy))  # Get a new word

        outfile.write(line)

    file1.close()
    outfile.close()


def main():
    confu(sys.argv[1], sys.argv[2], sys.argv[3])

if __name__ == '__main__':
    main()
